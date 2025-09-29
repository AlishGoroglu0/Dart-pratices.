import 'dart:io';

//fictional Currencies defined as map
Map<String, num> rate = {
  "milard": 0.1923,
  "yurad": 0.1351,
  "akerid": 0.0824,
  "sumekrit": 0.0198,
  "numerit": 0.0099,
  "septin": 1.0,
};

//Currency calculation function
double currency(String From_curr, String to_curr, double amount) {
  if (From_curr == to_curr) {
    return amount;
  }

  //Error Check Not in the map!
  if (!rate.containsKey(From_curr) || !rate.containsKey(to_curr)) {
    throw ("invalid Currency!");
  } else {
    //Get Currency Rates
    num fromRate = rate[From_curr]!;
    num toRate = rate[to_curr]!;

    //Calculate the currency value
    num result = amount * fromRate / toRate;
    return result.toDouble();
  }
}

void main(List<String> args) {
  try {
    stdout.write("Write from currency: ");
    String? From_curr = stdin.readLineSync();
    if (From_curr == null || From_curr.isEmpty) {
      throw ("Empty input");
    }
    From_curr = From_curr.toLowerCase();
    stdout.write("Write to currency: ");
    String? to_curr = stdin.readLineSync();
    if (to_curr == null || to_curr.isEmpty) {
      throw ("Empty input");
    }
    to_curr = to_curr.toLowerCase();

    stdout.write("Write amount: ");
    double amount = double.parse(stdin.readLineSync()!);

    double result = currency(From_curr, to_curr, amount);
    print("Result: ${result.toStringAsFixed(2)}");
  } catch (e) {
    throw ("Error:${e}");
  }
}
