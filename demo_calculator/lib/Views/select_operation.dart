import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/squareroot_operand.dart';
import 'package:flutter/material.dart';
import 'operand.dart';

class SelectOperation extends StatefulWidget {
  @override
  _SelectOperationState createState() => _SelectOperationState();
}

class _SelectOperationState extends State<SelectOperation> {
  List<String> text = Config.operatorList;

  void selectScreenType(String _selectedOperator, BuildContext _context) {
    if (_selectedOperator != text[text.length - 1]) {
      print(_selectedOperator);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Operand(
              selectedOperator: _selectedOperator,
              firstOperand: 0.0,
              visitNumber: Config.firstVisit,
            ),
          ),
          (route) => false);
    } else {
      print(_selectedOperator);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                SquareRootOperand(selectedOperator: _selectedOperator),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //App Bar text
        title: Text(Config.selectionScreenName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Buttons to press
          children: <Widget>[
            for (var txt in text)
              Container(
                padding: EdgeInsets.all(Config.buttonContainerPadding),
                margin: EdgeInsets.all(Config.buttonContainerMargin),
                width: Config.buttonWidth,
                //color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    selectScreenType(txt.toString(), context);
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Config.buttonBorderRadius),
                            side: BorderSide(color: Colors.blue))),
                  ),
                  child: Text(
                    txt.toString(),
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            //Text(txt.toString())
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
