
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  Widget buildnum(String num){
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        
          
        onPressed: (){
          setState(() {
            if(display == "0" || isResult){
              display = num;
              isResult = false;
            }else{
              display = "$display$num";
            }
          });
        },
        child: Text(num),
      ),
    );
  }

  Widget buildOperation(String op){
    return ElevatedButton(
      onPressed: (){
        setState(() {
          if(display.contains("+") || display.contains("-") || display.contains("x") || display.contains("/")){
            display = display;
          }else if(isResult){
            display = display;
          }else{
            display = "$display$op";
            symbol = op;
          }
        });
      },
      child: Text(op),
    );
  }

  String display = '0';
  String symbol = "";
  bool isResult = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator")),
      body: ListView(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                display.toString(),
                style: const TextStyle(fontSize: 50),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 900,
          width: 400,
          child: GridView.count(crossAxisCount: 3, childAspectRatio: 1.2, children: [
            buildnum("1"),
            buildnum("2"),
            buildnum("3"),
            buildnum("4"),
            buildnum("5"),
            buildnum("6"),
            buildnum("7"),
            buildnum("8"),
            buildnum("9"),
            buildnum("0"),
            buildOperation("+"),
            buildOperation("-"),
            buildOperation("x"),
            buildOperation("/"),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isResult || display.length == 1 || display.endsWith("+") || display.endsWith("-") || display.endsWith("x") || display.endsWith("/")) {
                      display = display;
                    
                    } else if (display.length == 1) {
                      display = display;
                    
                    } else if (symbol == "+") {
                      var num1 = display.split("+")[0];
                      var num2 = display.split("+")[1];
                      var sum = int.parse(num1) + int.parse(num2);
                      display = sum.toString();
                      
                    
                    } else if (symbol == "-") {
                      var num1 = display.split("-")[0];
                      var num2 = display.split("-")[1];
                      var subtract = int.parse(num1) - int.parse(num2);
                      display = subtract.toString();
                      
                    
                    } else if (symbol == "x") {
                      var num1 = display.split("x")[0];
                      var num2 = display.split("x")[1];
                      var multiply = int.parse(num1) * int.parse(num2);
                      display = multiply.toString();
                      
                    
                    } else if (symbol == "/") {
                      var num1 = display.split("/")[0];
                      var num2 = display.split("/")[1];
                      var divide = int.parse(num1) / int.parse(num2);
                      display = divide.toString();
                      
                    }
                    isResult = true;
                  });
                },
                child: const Text("=")),
            ElevatedButton(onPressed: () {
              setState(() {
                display = "0";
              });
            }, child: const Text("C")),
          ]),
        )
      ]),
    );
  }
}
