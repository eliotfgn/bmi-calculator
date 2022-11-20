import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("Your result"),
          const ResultContent(),
          GestureDetector(
            child: Container(
              color: Colors.red,
              height: 70,
              width: double.infinity,
              child: const Center(
                child: Text(
                  "Re-Calculate",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultContent extends StatelessWidget {
  const ResultContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
