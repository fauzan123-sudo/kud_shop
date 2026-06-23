part of 'admin_order_bloc.dart';

@freezed
class AdminOrderEvent with _$AdminOrderEvent {
  const factory AdminOrderEvent.load() = _LoadOrders;
  const factory AdminOrderEvent.updateStatus({
    required int orderId,
    required String status,
  }) = _UpdateStatus;
}