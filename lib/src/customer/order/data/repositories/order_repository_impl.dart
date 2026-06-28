import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/src/customer/cart/domain/entities/cart_item_entity.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_supabase_datasource.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderSupabaseDataSource dataSource;

  OrderRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, OrderEntity>> createOrder({
    required int addressId,
    required String deliveryMethod,
    required String paymentMethod,
    String? notes,
    bool isBuyNow = false,
    int? buyNowProductId,
    int? buyNowQuantity,
    List<int> selectedCartItemIds = const [],
    List<CartItemEntity> cartItems = const [],
  }) async {
    try {
      final result = await dataSource.createOrder(
        addressId: addressId,
        deliveryMethod: deliveryMethod,
        paymentMethod: paymentMethod,
        notes: notes,
        isBuyNow: isBuyNow,
        buyNowProductId: buyNowProductId,
        buyNowQuantity: buyNowQuantity,
        selectedCartItemIds: selectedCartItemIds,
        cartItems: cartItems, 
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getMyOrders() async {
    try {
      final result = await dataSource.getMyOrders();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, OrderEntity>> getOrderById(int id) async {
    try {
      final result = await dataSource.getOrderById(id);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, String>> uploadPaymentProof({
    required int orderId,
    required List<int> imageBytes,
  }) async {
    try {
      final result = await dataSource.uploadPaymentProof(
        orderId: orderId,
        imageBytes: imageBytes,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }
}
