import 'dart:math';

class BMIData {
  final String sex;
  final int age;
  final int weight;
  final int height;

  BMIData({
    required this.sex,
    required this.age,
    required this.weight,
    required this.height
  });
}

class BMIResult {
  final double bmi;
  final String result;
  final String interpretation;

  BMIResult({
    required this.bmi,
    required this.result,
    required this.interpretation
  });
}

class BMICalculator {
  BMICalculator({required this.bmiData});

  final BMIData bmiData;

  BMIResult calculateBMI() {
    double bmi = bmiData.weight / pow(bmiData.height / 100, 2);
    String result;
    String interpretation;

    if (bmi >= 25) {
      result = 'Overweight';
      interpretation =
      'You have a higher than normal body weight. Try to exercise more.';
    } else if (bmi > 18.5) {
      result = 'Normal';
      interpretation = 'You have a normal body weight. Good job!';
    } else {
      result = 'Underweight';
      interpretation =
      'You have a lower than normal body weight. You can eat a bit more.';
    }

    return BMIResult(bmi: bmi, result: result, interpretation: interpretation);
  }
}
