part of 'order_list_bloc.dart';

@freezed
abstract class OrderListEvent with _$OrderListEvent {
  const factory OrderListEvent.load() = OrderListLoad;
}