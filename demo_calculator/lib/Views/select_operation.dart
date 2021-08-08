import 'package:flutter/material.dart';

class SelectOperation extends StatefulWidget {
  @override
  _SelectOperationState createState() => _SelectOperationState();
}

class _SelectOperationState extends State<SelectOperation> {
  List<String> text = ["Add", "Subtract", "Multiple", "Divide", "Squareroot"];

  void selectScreenType(String _selectedOperator) {
    if (_selectedOperator == text[text.length - 1]) {
      print (_selectedOperator);
    } else {
      print (_selectedOperator);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Select Operation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            for (var txt in text)
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                width: 120,
                color: Colors.blue,
                child: TextButton(
                  onPressed: () {
                    selectScreenType(txt.toString());
                  },
                  child: Text(
                    txt.toString(),
                    style: TextStyle(color: Colors.white),
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
