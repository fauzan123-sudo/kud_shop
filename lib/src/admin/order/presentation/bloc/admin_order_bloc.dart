import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kud_shop/core/usecases/usecase.dart';
import 'package:kud_shop/src/customer/order/domain/entities/order_entity.dart';
import '../../domain/usecases/get_all_orders.dart';
import '../../domain/usecases/update_order_status.dart';

part 'admin_order_event.dart';
part 'admin_order_state.dart';
part 'admin_order_bloc.freezed.dart';

class AdminOrderBloc extends Bloc<AdminOrderEvent, AdminOrderState> {
  final GetAllOrders getAllOrders;
  final UpdateOrderStatus updateOrderStatus;

  AdminOrderBloc({
    required this.getAllOrders,
    required this.updateOrderStatus,
  }) : super(const AdminOrderState.initial()) {
    on<_LoadOrders>(_onLoadOrders);
    on<_UpdateStatus>(_onUpdateStatus);
  }

  Future<void> _onLoadOrders(
    _LoadOrders event,
    Emitter<AdminOrderState> emit,
  ) async {
    emit(const AdminOrderState.loading());
    final result = await getAllOrders(const NoParams());
    result.fold(
      (failure) => emit(AdminOrderState.error(failure.message)),
      (orders) => emit(AdminOrderState.loaded(orders)),
    );
  }

  Future<void> _onUpdateStatus(
    _UpdateStatus event,
    Emitter<AdminOrderState> emit,
  ) async {
    final currentState = state;
    if (currentState is! _Loaded) return;

    emit(AdminOrderState.updating(currentState.orders));

    final result = await updateOrderStatus(
      UpdateOrderStatusParams(orderId: event.orderId, status: event.status),
    );

    result.fold(
      (failure) {
        emit(AdminOrderState.loaded(currentState.orders));
        emit(AdminOrderState.updateError(currentState.orders, failure.message));
      },
      (updatedOrder) {
        final updatedList = currentState.orders.map((o) {
          return o.id == updatedOrder.id ? updatedOrder : o;
        }).toList();
        emit(AdminOrderState.updateSuccess(updatedList));
        emit(AdminOrderState.loaded(updatedList));
      },
    );
  }
}