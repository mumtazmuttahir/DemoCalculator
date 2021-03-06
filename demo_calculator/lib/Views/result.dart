import 'package:demo_calculator/Configurations/config.dart';
import 'package:demo_calculator/Views/select_operation.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  double result = 0.0;
  String operationType = "";

  Result({Key? key, required this.result, required this.operationType}) : super(key: key) {
    this.result = result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //App Bar text
        title: Text(Config.resultScreenName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //Buttons to press
          children: <Widget>[
            if (operationType == Config.operatorList[Config.operatorList.length - 1])
              Text(Config.squareRootResult + result.toString()),
            if (operationType != Config.operatorList[Config.operatorList.length - 1])
              Text(Config.otherOperationsResult + result.toString()),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => SelectOperation()));
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Config.buttonBorderRadius),
                        side: BorderSide(color: Colors.blue))),
              ),
              child: Text(
                Config.toOperationSelection,
                style: TextStyle(
                    color: Colors.blue, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
