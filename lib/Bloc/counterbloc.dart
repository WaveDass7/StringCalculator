import 'package:flutter_bloc/flutter_bloc.dart';
import 'Calculate_bloc.dart';
import 'counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  final CalculateLogic repository;

  CounterBloc(this.repository) : super(CounterInitial()) {
    on<CalculateSum>((event, emit) {
      try {
        final result = repository.add(event.input);
        emit(CounterResult(result));
      } catch (e) {
        emit(CounterError(e.toString()));
      }
    });
  }
}