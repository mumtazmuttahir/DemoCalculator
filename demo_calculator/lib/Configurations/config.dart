

class Config {
  //Select Operation Button
  static const double buttonContainerPadding = 10;
  static const double buttonContainerMargin = 10;
  static const double buttonWidth = 150;

  //Operators list
  static const List<String> operatorList = ["Add", "Subtract", "Multiple", "Divide", "Squareroot"];

  //Screen Names
  static const selectionScreenName = "Select Operation";
  static const firstOperandScreenName = "First Operand";
  static const secondOperandScreenName = "Second Operand";
  static const squareRootScreenName = "Square Root";
  static const resultScreenName = "Result";

  //Button Border Radius
  static const buttonBorderRadius = 18.0;

  //Button Text
  static const toSecondOperand = "To Second Operand";
  static const toResult = "To Result";
  static const toOperationSelection = "Back to Operation Selection";

  //Alert Content
  static const okButton = "OK";
  static const enterNumberContent = "Please enter a valid number";
  static const enterNonZeroDenominator = "Denominator cannot not be 0";
  static const alertContent = "Alert!!";

  //Result screen
  static const squareRootResult = "The Square Root is = ";
  static const otherOperationsResult = "The Result is = ";

  //Number of time Operand screen is visited
  static const firstVisit = 1;
  static const secondVisit = 2;

  //Label Texts
  static const enterNumberText = "Enter your number";
}