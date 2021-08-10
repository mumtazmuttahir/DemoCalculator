import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/result.dart';
import 'package:demo_calculator/Views/select_operation.dart';
import 'package:flutter/material.dart';

class Operand extends StatefulWidget {
  String selectedOperator = "";
  double firstOperand = 0.0;
  int visitNumber = 0;

  Operand(
      {Key? key,
      required this.selectedOperator,
      required this.firstOperand,
      required this.visitNumber})
      : super(key: key);

  _OperandState createState() => _OperandState();
}

class _OperandState extends State<Operand> {
  TextEditingController controller = TextEditingController();
  late String? number = "0";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    controller.dispose();
    super.dispose();
  }

  bool isEmpty(String? string) {
    if (string!.length == 0) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //App Bar text
        title: widget.firstOperand <= 1
            ? Text(Config.firstOperandScreenName)
            : Text(Config.secondOperandScreenName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Buttons to press
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: new InputDecoration(labelText: "Enter your number"),
              keyboardType:
                  TextInputType.numberWithOptions(signed: false, decimal: true),
            ),
            TextButton(
              onPressed: () {
                if (isEmpty(controller.text)) {
                  _showDialog(Config.enterNumberContent, Config.okButton);
                } else if (num.parse(controller.text) is num) {
                  if (widget.visitNumber == 1) {
                    _ifFirstOperand();
                  } else {
                    _ifSecondOperand();
                  }
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Config.buttonBorderRadius),
                        side: BorderSide(color: Colors.blue))),
              ),
              child: widget.firstOperand <= 1
                  ? Text(Config.toSecondOperand)
                  : Text(Config.toResult),
            ),
            TextButton(
              onPressed: () {
                _goToSelectionOperationMenu();
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Config.buttonBorderRadius),
                        side: BorderSide(color: Colors.blue))),
              ),
              child: Text(
                Config.toOperationSelection,
                style:
                    TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog(String _contentText, String _buttonText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(Config.alertContent),
          content: new Text(_contentText),
          actions: <Widget>[
            new FlatButton(
              child: new Text(_buttonText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _ifFirstOperand() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Operand(
            selectedOperator: widget.selectedOperator,
            firstOperand: double.parse(controller.text),
            visitNumber: 2,
          ),
        ),
        (route) => false);
  }

  void _ifSecondOperand() {
    double number = 0.0;
    if (widget.selectedOperator.contains("Divide") &&
        double.parse(controller.text) == 0.0) {
      _showDialog(Config.enterNonZeroDenominator, Config.okButton);
      return;
    }

    switch (widget.selectedOperator) {
      case ("Add"):
        {
          number = widget.firstOperand + double.parse(controller.text);
          break;
        }
      case ("Subtract"):
        {
          number = widget.firstOperand - double.parse(controller.text);
          break;
        }
      case ("Multiple"):
        {
          number = widget.firstOperand * double.parse(controller.text);
          break;
        }
      case ("Divide"):
        {
          number = widget.firstOperand / double.parse(controller.text);
          break;
        }
      default:
        print("This case is not valid");
        break;
    }

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Result(
            result: number,
            operationType: widget.selectedOperator,
          ),
        ),
        (route) => false);
  }

  void _goToSelectionOperationMenu() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => SelectOperation()));
  }
}
