// A class that represents a calculator operation
class Operation {
  final String symbol; // The symbol of the operation, such as +, -, x, /
  final Function(double, double) function; // The function that performs the operation on two numbers

  // A constructor that initializes the symbol and function fields
  Operation(this.symbol, this.function);
}

// A class that represents the calculator state
class Calculator {
  String output = '0'; // The output displayed on the screen
  double num1 = 0.0; // The first operand
  double num2 = 0.0; // The second operand
  Operation? operation; // The current operation
  bool isNum1 = true; // A flag that indicates whether the user is entering the first or second operand

  // A list of available operations
  List<Operation> operations = [
    Operation('+', (a, b) => a + b),
    Operation('-', (a, b) => a - b),
    Operation('x', (a, b) => a * b),
    Operation('/', (a, b) => a / b),
  ];

  // A method that handles the input of a digit
  void inputDigit(int digit) {
    if (isNum1) {
      // If the user is entering the first operand, append the digit to the output and update num1
      output = output == '0' ? '$digit' : '$output$digit';
      num1 = double.parse(output);
    } else {
      // If the user is entering the second operand, append the digit to the output and update num2
      output = output == '0' ? '$digit' : '$output$digit';
      num2 = double.parse(output);
    }
  }

  // A method that handles the input of a decimal point
  void inputDecimal() {
    if (!output.contains('.')) {
      // If the output does not already contain a decimal point, append one to the output
      output = '$output.';
    }
  }

  // A method that handles the input of an operation
  void inputOperation(Operation op) {
    if (isNum1) {
      // If the user is entering the first operand, set the current operation and switch to the second operand
      operation = op;
      isNum1 = false;
      output = '0';
    } else {
      // If the user is entering the second operand, perform the current operation and display the result
      num1 = operation!.function(num1, num2);
      output = '$num1';
      operation = op;
      num2 = 0.0;
    }
  }

  // A method that handles the input of an equal sign
  void inputEqual() {
    if (!isNum1 && operation != null) {
      // If the user has entered both operands and an operation, perform the operation and display the result
      num1 = operation!.function(num1, num2);
      output = '$num1';
      operation = null;
      num2 = 0.0;
      isNum1 = true;
    }
  }

  // A method that handles the input of a clear button
  void inputClear() {
    // Reset all fields to their initial values
    output = '0';
    num1 = 0.0;
    num2 = 0.0;
    operation = null;
    isNum1 = true;
  }
}
