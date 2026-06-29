import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/usecases/get_my_orders.dart';

part 'order_list_event.dart';
part 'order_list_state.dart';
part 'order_list_bloc.freezed.dart';

class OrderListBloc extends Bloc<OrderListEvent, OrderListState> {
  final GetMyOrders _getMyOrders;

  OrderListBloc({required GetMyOrders getMyOrders})
      : _getMyOrders = getMyOrders,
        super(const OrderListState.initial()) {
    on<OrderListLoad>(_onLoad);
  }

  Future<void> _onLoad(OrderListLoad event, Emitter<OrderListState> emit) async {
    emit(const OrderListState.loading());
    final result = await _getMyOrders(const NoParams());
    result.fold(
      (failure) => emit(OrderListState.error(failure.message)),
      (orders) => emit(OrderListState.loaded(orders)),
    );
  }
}