import 'package:dartz/dartz.dart';
import 'package:kud_shop/core/error/exception.dart';
import 'package:kud_shop/core/error/failure.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_supabase_datasource.dart';

class CartRepositoryImpl implements CartRepository {
  final CartSupabaseDataSource dataSource;

  CartRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<CartItemEntity>>> getCartItems() async {
    try {
      final result = await dataSource.getCartItems();
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
  Future<Either<Failure, void>> addToCart({
    required int productId,
    required int quantity,
  }) async {
    try {
      await dataSource.addToCart(productId: productId, quantity: quantity);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure());
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> updateQuantity({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      await dataSource.updateQuantity(
        cartItemId: cartItemId,
        quantity: quantity,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> removeFromCart({
    required int cartItemId,
  }) async {
    try {
      await dataSource.removeFromCart(cartItemId: cartItemId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCart() async {
    try {
      await dataSource.clearCart();
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (_) {
      return const Left(ServerFailure('Terjadi kesalahan tidak diketahui'));
    }
  }
}
