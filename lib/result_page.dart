import 'package:bmi_calculator/bmi_utils.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final BMIResult result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BMI Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Your result",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            ResultContent(result: result),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                color: Colors.red,
                height: 70,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "Re-Calculate".toUpperCase(),
                    style: const TextStyle(fontSize: 25),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ResultContent extends StatelessWidget {
  const ResultContent({Key? key, required this.result}) : super(key: key);

  final BMIResult result;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: inactiveCard,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              result.result.toUpperCase(),
              style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff24d876)),
            ),
            Text(
              result.bmi.toStringAsFixed(2),
              style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            ),
            Text(
              result.interpretation,
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
