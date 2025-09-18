abstract class CounterEvent {}

class CalculateSum extends CounterEvent {
  final String input;
  CalculateSum(this.input);
}
