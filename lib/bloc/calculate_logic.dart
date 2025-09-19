
class CalculateLogic {
  int add(String numbers) {

    //I am matching negatives and positive values here
    final regex = RegExp(r'-?\d+');
    final matches = regex.allMatches(numbers);

    int total = 0;
    List<int> negatives = [];

    //Looping all values and adding up also looking out for negative values
    for (var match in matches) {
      int number = int.parse(match.group(0)!);
      if (number < 0) {
        negatives.add(number);
      }
      total += number;
    }

    //if any negative values returning Error
    if (negatives.isNotEmpty) {
      return 777;
    }

    //if no negative values returning the total
    return total;
  }
}

  /**
   * Alternative logic works only for single digits;

  int add(String numbers) {
    if(numbers.length % 2 == 0 && !numbers.endsWith(',')){
      RegExp regex = RegExp(r'-\d+');
      Iterable<RegExpMatch> matches = regex.allMatches(numbers);

      if (matches.isEmpty) {
        if(numbers.startsWith('//')){
          var onlyDigits = numbers.replaceAll(RegExp(r'[^0-9]'), '');
          int total = 0;
          for (var t in onlyDigits) {
            if (t.isNotEmpty) {
              total += int.parse(t);
            }
          }
          return total;
        }else{
          var individualstring =  numbers.split(RegExp("[','\n]"));
          int total = 0;
                for (var t in individualstring) {
                  if (t.isNotEmpty) {
                    total += int.parse(t);
                  }
                }
              return total;
        }
        return 0;
      } else {
        print("Negative numbers found:");
        for (var match in matches) {
          print(match.group(0)); // prints each negative number
        }
        return 777;
      }


      return 0;
    }else{


    }
  }
 * Alternative logic works only for single digits;
 */
