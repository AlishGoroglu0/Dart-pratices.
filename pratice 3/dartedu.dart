//main
void main(List<String> args) {
  print(FindOddEven(100, true, true));
}
//find odd and evens

List FindOddEven(int number, bool Even, bool Odd) {
  List numbers = [];
  //Set the list
  for (var i = 0; i < number; i++) {
    numbers.add(i);
  }
  //define the return value
  List returned = [];
  //Filter the odds and evens
  for (var i = 0; i < numbers.length; i++) {
    //if both true
    if (Even && Odd) {
      returned.add(numbers[i]);
      //Only Even
    } else if (Even) {
      if (numbers[i] % 2 == 0) {
        returned.add(numbers[i]);
      }
      //Only Odd
    } else {
      if (numbers[i] % 2 != 0) {
        returned.add(numbers[i]);
      }
    }
  }

  return returned;
}
