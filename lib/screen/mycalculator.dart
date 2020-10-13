import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  String result = "0";
  double resultFont = 34.00;
  double enterTextFont = 44.00;
  String enterText = "0";
  String expression = "";
  void _getButtonText(String text) {
    setState(() {
      if (text == "C") {
        result = "0";
        enterText = "0";
        resultFont = 34.00;
        enterTextFont = 44.00;
      } else if (text == "🔙") {
        resultFont = 34.00;
        enterTextFont = 44.00;
        enterText = enterText.substring(0, enterText.length - 1);
        if (enterText == "") {
          enterText = "0";
        }
      } else if (text == "=") {
        resultFont = 44.00;
        enterTextFont = 34.00;
        expression = enterText;
        expression = expression.replaceAll("X", "*");
        expression = expression.replaceAll("÷", "/");
        try {
          Parser parser = Parser();
          Expression exp = parser.parse(expression);
          ContextModel cm = ContextModel();
          result = "${exp.evaluate(EvaluationType.REAL, cm)}";
        } catch (e) {
          result = "Error";
        }
      } else {
        enterTextFont = 48.0;
        resultFont = 38.0;
        if (enterText == "0") {
          enterText = text;
        }
        enterText = enterText + text;
      }
    });
  }

  Widget _buildSingleButton({context, String title, Color color, bool height}) {
    return Container(
      height: height == true
          ? MediaQuery.of(context).size.height * 0.1 * 1
          : MediaQuery.of(context).size.height * 0.1 * 2,
      color: color,
      child: FlatButton(
        padding: EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            style: BorderStyle.solid,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(0.0),
        ),
        onPressed: () => _getButtonText(title),
        child: Text(
          title,
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Wow Calculator",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.centerRight,
            child: Text(
              enterText,
              style: TextStyle(
                fontSize: enterTextFont,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            alignment: Alignment.centerRight,
            child: Text(
              result,
              style: TextStyle(
                fontSize: resultFont,
              ),
            ),
          ),
          Expanded(
            child: Center(),
          ),
          Row(
            children: [
              Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.height * .40,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        _buildSingleButton(
                          height: true,
                          context: context,
                          title: "C",
                          color: Colors.blue,
                        ),
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "🔙",
                          color: Theme.of(context).primaryColor,
                        ),
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "÷",
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          height: true,
                          context: context,
                          title: "9",
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "8",
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          title: "7",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          title: "6",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "5",
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "4",
                          color: Color(0xff272d3a),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "3",
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          title: "2",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          title: "1",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          title: ".",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          title: "0",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                        _buildSingleButton(
                          context: context,
                          title: "00",
                          height: true,
                          color: Color(0xff272d3a),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * .24,
                child: Table(
                  children: [
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          title: "X",
                          height: true,
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          height: true,
                          title: "-",
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          height: true,
                          context: context,
                          title: "+",
                          color: Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                    TableRow(
                      children: [
                        _buildSingleButton(
                          context: context,
                          height: false,
                          title: "=",
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
