import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/squareroot_operand.dart';
import 'package:flutter/material.dart';
import 'first_operand.dart';

class SelectOperation extends StatefulWidget {
  @override
  _SelectOperationState createState() => _SelectOperationState();
}

class _SelectOperationState extends State<SelectOperation> {
  List<String> text = Config.operatorList;

  void selectScreenType(String _selectedOperator, BuildContext _context) {
    if (_selectedOperator != text[text.length - 1]) {
      print(_selectedOperator);
      Navigator.push(
          _context,
          MaterialPageRoute(
              builder: (_context) =>
                  FirstOperand(selectedOperator: _selectedOperator)));
    } else {
      print(_selectedOperator);
      Navigator.push(
          _context,
          MaterialPageRoute(
              builder: (_context) =>
                  SquareRootOperand(selectedOperator: _selectedOperator)));
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
                            borderRadius: BorderRadius.circular(18.0),
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
