import 'package:flutter_test/flutter_test.dart';
import 'package:stringcalculator/Bloc/calculate_logic.dart';

void main() {
  group('Calculate', (){
    final repo = CalculateLogic();

    test('0', () {
      expect(repo.add("1,2,3,4"), 0);
    });
  });

}