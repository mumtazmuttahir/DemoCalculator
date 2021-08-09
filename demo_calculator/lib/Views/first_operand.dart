import 'package:flutter/material.dart';

class FirstOperand extends StatefulWidget {

  String selectedOperator = "";

  FirstOperand({Key? key, required this.selectedOperator}): super(key: key);

  _FirstOperandState createState() => _FirstOperandState();

}


class _FirstOperandState extends State<FirstOperand> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //App Bar text
        title: Text("First Operand"),

      ),
    );
  }
}
