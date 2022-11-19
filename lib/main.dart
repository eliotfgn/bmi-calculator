import 'package:flutter/material.dart';

const Color activeCard = Color(0xff1d1e33);
const Color inactiveCard = Color(0xff111328);

void main() {
  runApp(const BMICalculator());
}

MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  final swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: createMaterialColor(const Color(0xff0a0e21)),
          backgroundColor: createMaterialColor(const Color(0xff0a0e21)),
        ),
        scaffoldBackgroundColor: createMaterialColor(
          const Color(0xff0a0e21),
        ),
        textTheme: const TextTheme(
            bodyText1: TextStyle(color: Colors.white),
            button: TextStyle(color: Colors.white),
            bodyText2: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
          centerTitle: true,
        ),
        body: InputPage(),
      ),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: const [
              Expanded(
                child: InputCard(
                  child: IconContainer(
                    icon: Icons.male_rounded,
                    label: "Male",
                  ),
                ),
              ),
              Expanded(
                child: InputCard(
                  child: IconContainer(
                    icon: Icons.female_rounded,
                    label: "Female",
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: InputCard(
            child: Container(
              color: Colors.white,
              height: 20,
              width: double.infinity,
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                  child: InputCard(
                child: Container(),
              )),
              Expanded(
                  child: InputCard(
                child: Container(),
              ))
            ],
          ),
        ),
      ],
    );
  }
}

class InputCard extends StatefulWidget {
  final Widget child;

  const InputCard({Key? key, required this.child}) : super(key: key);

  @override
  State<InputCard> createState() => _InputCardState();
}

class _InputCardState extends State<InputCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff1d1e33),
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.child,
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContainer({Key? key, required this.icon, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 100,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 20, color: Color(0xff8d8e98)),
        ),
      ],
    );
  }
}
