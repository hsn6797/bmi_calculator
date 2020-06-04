import 'dart:math';

class BMIBrain {
  BMIBrain({this.weight, this.height});
  final int weight;
  final int height;

  double _bmi;

  double CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi;
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Take healthy diet and exercise daily to reduce weight';
    } else if (_bmi > 18) {
      return 'Your BMI is ideal so you only need to maintain it';
    } else {
      return 'Take healthy Fats and Carbohydrates to gain weight';
    }
  }
}
