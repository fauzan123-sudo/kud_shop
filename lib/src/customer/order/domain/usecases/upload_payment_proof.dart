import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:kud_shop/core/error/failure.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../repositories/order_repository.dart';

class UploadPaymentProof extends UseCase<String, UploadPaymentProofParams> {
  final OrderRepository repository;
  UploadPaymentProof(this.repository);

  @override
  Future<Either<Failure, String>> call(UploadPaymentProofParams params) {
    return repository.uploadPaymentProof(
      orderId: params.orderId,
      imageBytes: params.imageBytes,
    );
  }
}

class UploadPaymentProofParams extends Equatable {
  final int orderId;
  final List<int> imageBytes;

  const UploadPaymentProofParams({
    required this.orderId,
    required this.imageBytes,
  });

  @override
  List<Object> get props => [orderId, imageBytes];
}
