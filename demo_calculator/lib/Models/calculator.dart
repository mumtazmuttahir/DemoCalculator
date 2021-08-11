class Calculator {

  late double firstOperand;
  late double secondOperand;

  Calculator(double _firstOperand, double _secondOperand){
    this.firstOperand = _firstOperand;
    this.secondOperand = _secondOperand;
  }

  double add() {
    return (this.firstOperand + this.secondOperand);
  }

  double subtract () {
    return (this.firstOperand - this.secondOperand);
  }

  double multiply () {
    return (this.firstOperand * this.secondOperand);
  }

  double divide () {
    return (this.firstOperand / this.secondOperand);
  }

}