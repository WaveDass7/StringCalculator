import 'package:flutter_test/flutter_test.dart';
import 'package:stringcalculator/Bloc/calculate_logic.dart';

void main() {
  group('Calculate', (){
    final calculate = CalculateLogic();

    test('Test with default delimiter', () {
      expect(calculate.add("1,2,3,4"), 10);
    });

    test('Test with single digit', () {
      expect(calculate.add("0"), 0);
    });

    test('Test with next line', () {
      expect(calculate.add("1\n2,3"), 6);
    });

    test('Test with negatives in number', () {
      expect(calculate.add("1,2,3,-4"), 777);
    });

    test('Test with custom delimiter', () {
      expect(calculate.add("//\n13;23;56"), 92);
    });
  });
}