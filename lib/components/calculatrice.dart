import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({super.key, required this.title});

  final String title;

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  String output = "0";
  String num1 = "";
  String num2 = "";
  String operation = "";

  void buttonPressed(String buttonText) {
    if (buttonText == "+" || buttonText == "-" || buttonText == "*" || buttonText == "/") {
      num1 = output;
      operation = buttonText;
      output = "0";
    } else if (buttonText == "=") {
      num2 = output;
      switch (operation) {
        case "+":
          output = (double.parse(num1) + double.parse(num2)).toString();
          break;
        case "-":
          output = (double.parse(num1) - double.parse(num2)).toString();
          break;
        case "*":
          output = (double.parse(num1) * double.parse(num2)).toString();
          break;
        case "/":
          output = (double.parse(num1) / double.parse(num2)).toString();
          break;
      }
      num1 = "";
      num2 = "";
      operation = "";
    } else if (buttonText == "CE") {
      output = "0";
      num1 = "";
      num2 = "";
      operation = "";
    } else if (buttonText == ",") {
      if (!output.contains('.')) {
        output += '.';
      }
    } else {
      if (output == "0") {
        output = buttonText;
      } else {
        output += buttonText;
      }
    }

    setState(() {});
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () => buttonPressed(buttonText),
        child: Text(buttonText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Calculatrice de l'esat"),
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: <Widget>[
          // Existing content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  output,
                  style: const TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildButton("0"),
                    buildButton(","),
                    buildButton("="),
                    buildButton("CE"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pop(context),
        child: const Icon(Icons.add),
      ),
    );
  }
}
