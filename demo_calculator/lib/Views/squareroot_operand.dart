import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/result.dart';
import 'package:demo_calculator/Views/select_operation.dart';
import 'package:demo_calculator/Widgets/number_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

class SquareRootOperand extends StatefulWidget {
  String selectedOperator = "";

  SquareRootOperand({Key? key, required this.selectedOperator})
      : super(key: key) {
    selectedOperator = this.selectedOperator;
  }

  _SquareRootOperandState createState() => _SquareRootOperandState();
}

class _SquareRootOperandState extends State<SquareRootOperand> {
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

  String value = '';
  String output = 'Not Checked';

  checkTextInputData() {
    setState(() {
      value = controller.text;
    });

    print(_isNumeric(value));

    if (_isNumeric(value) == true) {
      setState(() {
        output = 'Value is Number';
      });
    } else {
      setState(() {
        output = 'Value is Not Number';
      });
    }
  }

  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //App Bar text
        title: Text(Config.squareRootScreenName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Buttons to press
          children: <Widget>[
            TextField(
              controller: controller,
              decoration:
                  new InputDecoration(labelText: Config.enterNumberText),
              keyboardType:
                  TextInputType.numberWithOptions(signed: false, decimal: true),
            ),
            TextButton(
              onPressed: () {
                if (isEmpty(controller.text) || double.tryParse(controller.text) == null) {
                  // show the dialog
                  _showDialog(Config.alertContent, Config.enterNumberContent,
                      Config.okButton);
                } else if (num.parse(controller.text) is num) {
                  double squareRoot = sqrt(num.parse(controller.text));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(
                          result: squareRoot,
                          operationType: widget.selectedOperator,
                        ),
                      ),
                      (route) => false);
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Config.buttonBorderRadius),
                        side: BorderSide(color: Colors.blue))),
              ),
              child: Text(Config.toResult),
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

  //Show the
  void _showDialog(
      String _alertContent, String _enterNumberContent, String _okButton) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(_alertContent),
          content: new Text(_enterNumberContent),
          actions: <Widget>[
            new FlatButton(
              child: new Text(_okButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  //Navigate the user to the Selection Operator Screen
  void _goToSelectionOperationMenu() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SelectOperation()));
  }
}
