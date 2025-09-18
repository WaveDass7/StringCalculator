import 'package:flutter_test/flutter_test.dart';
import 'package:stringcalculator/Bloc/Calculate_bloc.dart';

void main() {
  group('CalculatE', (){
    final repo = CalculateLogic();

    test('1', () {
      expect(repo.add("1,2,3,4"), 1);
    });
  });

}