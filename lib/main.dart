import 'package:flutter/material.dart';

const Color activeCard = Color(0xff1d1e33);
const Color inactiveCard = Color(0xff111328);

enum Gender { male, female }

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
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 120;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: InputCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color:
                      selectedGender == Gender.male ? activeCard : inactiveCard,
                  child: const IconContainer(
                    icon: Icons.male_rounded,
                    label: "Male",
                  ),
                ),
              ),
              Expanded(
                child: InputCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? activeCard
                      : inactiveCard,
                  child: const IconContainer(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text(
                    "HEIGHT",
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xff8d8e98),
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "$height",
                        style: const TextStyle(
                            fontSize: 45, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "cm",
                        style:
                            TextStyle(color: Color(0xff8d8e98), fontSize: 22),
                      ),
                    ],
                  ),
                ),
                Slider(
                    value: height.ceilToDouble(),
                    min: 120,
                    max: 220,
                    activeColor: Colors.red,
                    inactiveColor: const Color(0xff8d8e98),
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    })
              ],
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

class InputCard extends StatelessWidget {
  final Widget child;
  final Color? color;
  final void Function()? onPressed;

  const InputCard({
    Key? key,
    required this.child,
    this.color = activeCard,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final IconData icon;
  final String label;

  const IconContainer({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

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
