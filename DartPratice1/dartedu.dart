//import math library
import 'dart:ffi';
import 'dart:math';

//get current date
DateTime Get_date = DateTime.now();

//area calculator function
List<double> areaCalculator(double radius, double height) {
  double circle = pi * 2 * radius;
  double polygon = radius * height;
  double triangle = radius * height / 2;
  return [circle, polygon, triangle];
}

//age calculator function
String Get_age(int year, int month, int day) {
  //Calculate age by year.
  int age = Get_date.year - year;
  //Calculate add month and day factors in to calculation.
  if (month > Get_date.month ||
      (month == Get_date.month && day > Get_date.day)) {
    age--;
  }
  //return age.
  return age.toString();
}

//main function
void main(List<String> args) {
  //Show function area calculation function conclusions
  int lenght = areaCalculator(0, 0).length;
  var statements = ["Circle: ", "Polygon: ", "Triangle: "];
  for (var i = 0; i < lenght; i++) {
    print(statements[i] + areaCalculator(12, 12)[i].toStringAsFixed(3));
  }

  //Show function age calculation function conclusion
  print("You are " + Get_age(1984, 11, 32) + " years old.");
}
