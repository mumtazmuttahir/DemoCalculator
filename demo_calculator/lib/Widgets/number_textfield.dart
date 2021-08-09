import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final TextInputType inputType;

  /// Here is your constructor
  MyTextField(
      {Key? key,
      required this.controller,
      required this.decoration,
      required this.inputType});

  @override
  Widget build(BuildContext context) {
    return _buildTextField(this.controller, this.decoration, this.inputType);
  }

  Widget _buildTextField(TextEditingController _controller,
      InputDecoration _decoration, TextInputType _inputType) {
    return new Align(
        child: new Container(
      child: MyTextField(
        controller: _controller,
        decoration: _decoration,
        inputType: _inputType,
        // inputFormatters: <TextInputFormatter>[
        //   FilteringTextInputFormatter.digitsOnly
        // ],
      ),
    ));
  }
}
