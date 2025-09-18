
abstract class CounterState {}

class CounterInitial extends CounterState {}
class CounterResult extends CounterState {
  final int sum;
  CounterResult(this.sum);
}
class CounterError extends CounterState {
  final String message;
  CounterError(this.message);
}
