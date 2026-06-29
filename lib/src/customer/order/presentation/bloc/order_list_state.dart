part of 'order_list_bloc.dart';

@freezed
abstract class OrderListState with _$OrderListState {
  const factory OrderListState.initial() = OrderListInitial;
  const factory OrderListState.loading() = OrderListLoading;
  const factory OrderListState.loaded(List<OrderEntity> orders) = OrderListLoaded;
  const factory OrderListState.error(String message) = OrderListError;
}