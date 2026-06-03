import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_employee_by_id.dart';
import 'employee_detail_event.dart';
import 'employee_detail_state.dart';

class EmployeeDetailBloc
    extends Bloc<EmployeeDetailEvent, EmployeeDetailState> {
  final GetEmployeeById getEmployeeById;

  EmployeeDetailBloc(this.getEmployeeById) : super(const EmployeeDetailInitial()) {
    on<GetEmployeeDetailEvent>(_onGetDetail);
  }

  Future<void> _onGetDetail(
    GetEmployeeDetailEvent event,
    Emitter<EmployeeDetailState> emit,
  ) async {
    emit(const EmployeeDetailLoading());
    final result = await getEmployeeById(GetEmployeeByIdParams(event.id));
    result.fold(
      (failure) => emit(EmployeeDetailError(failure.message)),
      (employee) => emit(EmployeeDetailLoaded(employee)),
    );
  }
}
