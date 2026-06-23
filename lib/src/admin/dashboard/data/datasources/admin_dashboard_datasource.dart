import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/src/admin/product/domain/entities/product_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DashboardStats {
  final int totalOrders;
  final int pendingOrders;
  final double totalRevenue;
  final int totalProducts;
  final List<DailySalesData> dailySales;
  final List<ProductEntity> lowStockProducts;
  final List<ProductEntity> allProducts;

  const DashboardStats({
    required this.totalOrders,
    required this.pendingOrders,
    required this.totalRevenue,
    required this.totalProducts,
    required this.dailySales,
    required this.lowStockProducts,
    required this.allProducts,
  });
}

class DailySalesData {
  final DateTime date;
  final int orderCount;
  final double revenue;

  const DailySalesData({
    required this.date,
    required this.orderCount,
    required this.revenue,
  });
}

abstract class AdminDashboardDataSource {
  Future<DashboardStats> getDashboardStats();
}

class AdminDashboardDataSourceImpl implements AdminDashboardDataSource {
  final SupabaseClient supabase;

  AdminDashboardDataSourceImpl(this.supabase);

  @override
  Future<DashboardStats> getDashboardStats() async {
    try {
      final now = DateTime.now();
      final thirtyDaysAgo = now.subtract(const Duration(days: 30));
      final cutoff = thirtyDaysAgo.toIso8601String();

      // ─── Ambil semua data paralel ──────────────────────────
      final results = await Future.wait([
        // 1. Semua order (untuk statistik total)
        supabase.from('orders').select('id, total_price, status, created_at'),

        // 2. Semua produk (untuk stok)
        supabase
            .from('products')
            .select(
              'id, category_id, name, description, price, stock, '
              'image_url, unit, is_active, created_at, updated_at',
            )
            .order('stock', ascending: true),

        // 3. Order 30 hari terakhir (untuk grafik)
        supabase
            .from('orders')
            .select('id, total_price, created_at')
            .gte('created_at', cutoff)
            .order('created_at'),
      ]);

      final allOrders = results[0] as List;
      final allProductsRaw = results[1] as List;
      final recentOrders = results[2] as List;

      // ─── Statistik ringkas ─────────────────────────────────
      final totalOrders = allOrders.length;
      final pendingOrders = allOrders
          .where((o) => o['status'] == 'pending')
          .length;
      final totalRevenue = allOrders
          .where((o) => o['status'] != 'cancelled')
          .fold<double>(0, (sum, o) => sum + (o['total_price'] as num));

      // ─── Parse produk ──────────────────────────────────────
      final allProducts = allProductsRaw.map(_parseProduct).toList();
      final lowStockProducts = allProducts.where((p) => p.stock <= 10).toList();

      // ─── Grafik: group order per hari ─────────────────────
      final Map<String, DailySalesData> dailyMap = {};

      // Isi semua 30 hari terlebih dahulu dengan nilai 0
      for (int i = 29; i >= 0; i--) {
        final date = DateTime(
          now.year,
          now.month,
          now.day,
        ).subtract(Duration(days: i));
        final key =
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
        dailyMap[key] = DailySalesData(date: date, orderCount: 0, revenue: 0);
      }

      // Isi dengan data order yang ada
      for (final order in recentOrders) {
        final date = DateTime.parse(order['created_at'] as String).toLocal();
        final key =
            '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
        if (dailyMap.containsKey(key)) {
          final existing = dailyMap[key]!;
          dailyMap[key] = DailySalesData(
            date: existing.date,
            orderCount: existing.orderCount + 1,
            revenue:
                existing.revenue + (order['total_price'] as num).toDouble(),
          );
        }
      }

      return DashboardStats(
        totalOrders: totalOrders,
        pendingOrders: pendingOrders,
        totalRevenue: totalRevenue,
        totalProducts: allProducts.length,
        dailySales: dailyMap.values.toList(),
        lowStockProducts: lowStockProducts,
        allProducts: allProducts,
      );
    } catch (e) {
      throw ServerException(message: 'Gagal memuat data dashboard');
    }
  }

  ProductEntity _parseProduct(dynamic raw) {
    final p = raw as Map<String, dynamic>;
    return ProductEntity(
      id: p['id'] as int,
      categoryId: p['category_id'] as int?,
      name: p['name'] as String,
      description: p['description'] as String?,
      price: (p['price'] as num).toDouble(),
      stock: p['stock'] as int,
      imageUrl: p['image_url'] as String?,
      unit: p['unit'] as String,
      isActive: p['is_active'] as bool,
      createdAt: DateTime.parse(p['created_at'] as String),
      updatedAt: DateTime.parse(p['updated_at'] as String),
    );
  }
}
