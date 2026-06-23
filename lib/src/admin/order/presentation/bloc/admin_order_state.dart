part of 'admin_order_bloc.dart';

@freezed
class AdminOrderState with _$AdminOrderState {
  const factory AdminOrderState.initial() = _Initial;
  const factory AdminOrderState.loading() = _Loading;
  const factory AdminOrderState.loaded(List<OrderEntity> orders) = _Loaded;
  const factory AdminOrderState.updating(List<OrderEntity> orders) = _Updating;
  const factory AdminOrderState.updateSuccess(List<OrderEntity> orders) = _UpdateSuccess;
  const factory AdminOrderState.updateError(List<OrderEntity> orders, String message) = _UpdateError;
  const factory AdminOrderState.error(String message) = _Error;
}