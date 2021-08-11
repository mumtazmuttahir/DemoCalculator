import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/result.dart';
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
              decoration: new InputDecoration(labelText: Config.enterNumberText),
              keyboardType:
                  TextInputType.numberWithOptions(signed: false, decimal: true),
            ),
            TextButton(
              onPressed: () {
                if (isEmpty(controller.text)) {
                  // show the dialog
                  _showDialog ();
                } else if (num.parse(controller.text) is num) {
                  double squareRoot = sqrt(num.parse(controller.text));
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Result(result: squareRoot, operationType: widget.selectedOperator,),
                      ),
                      (route) => false);
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Config.buttonBorderRadius),
                        side: BorderSide(color: Colors.blue))),
              ),
              child: Text(Config.toResult),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text(Config.alertContent),
          content: new Text(Config.enterNumberContent),
          actions: <Widget>[
            new FlatButton(
              child: new Text(Config.okButton),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
