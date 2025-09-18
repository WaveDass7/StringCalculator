
class CalculateLogic {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    }else{
      String defaultdelimeter = ',';
      if (numbers.startsWith("//")) {
        var parts = numbers.split("\n");
        defaultdelimeter = parts[0].substring(2);
        numbers = parts[1];
      }
        var individualstring = numbers.split(RegExp("[$defaultdelimeter\n]"));

        int total = 0;
        for (var t in individualstring) {
          if (t.isNotEmpty) {
            total += int.parse(t);
          }
        }
      return total;
    }
  }
}