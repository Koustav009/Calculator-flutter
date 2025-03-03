import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:calculator/main.dart';

class CalculatorButton extends StatelessWidget {
  final String textVal;
  final Color? buttonColor;
  final double? fontSize;
  final Color? textColor;
  final Function calculate;

  // void callBack(String textVal) {
  //   print("object $textVal");
  //   buttonOnclick();
  // }

  const CalculatorButton(
      {super.key,
      required this.textVal,
      this.buttonColor,
      this.fontSize,
      this.textColor,
      required this.calculate});

  @override
  Widget build(BuildContext context) {
    // button_color = const Color.fromARGB(255, 102, 102, 102);
    Color buttonColor1 =
        buttonColor ?? const Color.fromARGB(255, 102, 102, 102);

    double fontSize1 = fontSize ?? 32;

    Color textColor1 = textColor ?? Color.fromARGB(255, 255, 255, 255);

    return Container(
      margin: const EdgeInsets.all(5),
      child: SizedBox(
        height: 70,
        width: 70,
        child: OutlinedButton(
          onPressed: () {
            // callBack(textVal);
            calculate(textVal);
          },
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            backgroundColor: buttonColor1,
            side: const BorderSide(color: Color.fromARGB(255, 78, 62, 62)),
          ),
          child: Text(textVal,
              style: GoogleFonts.rubik(
                fontSize: fontSize1,
                color: textColor1,
              )
              // fontFamily: 'Caveat-Variable'),
              ),
        ),
      ),
    );
  }
}
