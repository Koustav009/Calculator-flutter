import 'package:calculator/widgets/calculator_button.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await Future.delayed(Duration(seconds: 1));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: ,
          // useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 174, 0)),
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(255, 255, 174, 0))),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double firstnum = 0;
  double secondnum = 0;
  String history = '00';
  String mainDisplay = '00';
  String res = '';
  String operator = '';
  bool isEqationdone = false;

  void buttonOnclick(String val) {
    if (val == 'C') {
      firstnum = 0;
      secondnum = 0;
      if (isEqationdone) history = mainDisplay;
      mainDisplay = '00';
      res = '0';
    } else if (val == 'AC') {
      firstnum = 0;
      secondnum = 0;
      history = '00';
      mainDisplay = '00';
      res = '0';
    } else if (val == 'BK') {
      mainDisplay = mainDisplay.substring(0, mainDisplay.length - 1);
    } else if (val == '+' ||
        val == '-' ||
        val == 'X' ||
        val == '/' ||
        val == '%') {
      firstnum = double.parse(mainDisplay);
      operator = val;
      mainDisplay = mainDisplay + val;
      isEqationdone = false;
    } else if (val == '=') {
      history = mainDisplay;
      int temp = mainDisplay.indexOf(operator);
      secondnum = double.parse(mainDisplay.substring(temp + 1));

      switch (operator) {
        case '+':
          {
            res = (firstnum + secondnum).toString();
          }
          break;
        case '-':
          {
            res = (firstnum - secondnum).toString();
          }
          break;
        case 'X':
          {
            res = (firstnum * secondnum).toString();
          }
          break;
        case '/':
          {
            res = (firstnum / secondnum).toString();
          }
          break;
        case '%':
          {
            res = ((secondnum * firstnum) / 100).toString();
          }
        default:
          {
            res = '';
          }
      }
      int indexofDot = res.indexOf('.');
      String afterDotStr = res.substring(indexofDot + 1);
      if (0 == int.parse(afterDotStr)) {
        res = res.substring(0, indexofDot);
      }
      mainDisplay = res;
      isEqationdone = true;
    } else {
      if (isEqationdone) {
        buttonOnclick('C');
        isEqationdone = false;
      }
      mainDisplay = mainDisplay + val;
      if (mainDisplay.startsWith('00')) {
        mainDisplay = mainDisplay.substring(2);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.greenAccent,
        title: const Text(
          "CalcuLaX",
          style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.w800,
              color: Color.fromARGB(255, 0, 33, 59)),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 0, 33, 59),
        padding: EdgeInsets.only(bottom: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                // height: double.infinity,
                width: double.infinity,
                color: const Color.fromARGB(0, 255, 124, 124),
                child: Text(
                  history,
                  style: GoogleFonts.rubik(
                    fontSize: 40,
                    color: const Color.fromARGB(255, 168, 168, 168),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                alignment: Alignment.bottomRight,
              ),
            ),
            Container(
              // height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(0, 44, 255, 2),
              child: Text(
                mainDisplay,
                style: GoogleFonts.rubik(
                  fontSize: 60,
                  color: Colors.white,
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              alignment: Alignment.bottomRight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CalculatorButton(
                  textVal: "AC",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "C",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                    textVal: "%",
                    fontSize: 28,
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 231, 158, 0)),
                CalculatorButton(
                    textVal: "/",
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 231, 158, 0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  textVal: "7",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "8",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "9",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                    textVal: "X",
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 231, 158, 0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  textVal: "4",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "5",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "6",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                    textVal: "-",
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 231, 158, 0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalculatorButton(
                  textVal: "1",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "2",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: "3",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                    textVal: "+",
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 231, 158, 0)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  margin: const EdgeInsets.all(5),
                  child: SizedBox(
                    height: 70,
                    width: 70,
                    child: OutlinedButton(
                        onPressed: () {
                          buttonOnclick('BK');
                        },
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.all(1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          backgroundColor:
                              const Color.fromARGB(255, 102, 102, 102),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 78, 62, 62)),
                        ),
                        child: Icon(
                          Icons.backspace_outlined,
                          color: Colors.white,
                        )),
                  ),
                ),
                CalculatorButton(
                  textVal: "0",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                  textVal: ".",
                  calculate: buttonOnclick,
                ),
                CalculatorButton(
                    textVal: "=",
                    calculate: buttonOnclick,
                    buttonColor: Color.fromARGB(255, 255, 94, 0)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
