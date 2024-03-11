import 'package:flutter/material.dart';
import 'package:flutter_app/calculator/calculator_botton.dart';
import 'package:flutter_app/xo_game/player_screen.dart';
import 'package:flutter_app/xo_game/xo_screen.dart';
import 'dart:math';
class CalculatorScreen extends StatefulWidget {
  static const String routeName = 'calculator screen' ;

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String resText = '' ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('calculator'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(PlayerScreen.routeName);
          }, icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(resText,style: TextStyle(
                fontSize: 22,
              )),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: IconButton(onPressed: (){
                  clearClick();
                }, icon: Icon(Icons.clear)),
              )
            ],
          )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorBotton(text: 'sin',onButtonClick: onOperatorsClick),
                CalculatorBotton(text: 'cos',onButtonClick: onOperatorsClick),
                CalculatorBotton(text: 'tan',onButtonClick: onDigitClick ),
                CalculatorBotton(text: '%',onButtonClick: onOperatorsClick),
                 ]
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorBotton(text: '7',onButtonClick: onDigitClick),
                CalculatorBotton(text: '8',onButtonClick: onDigitClick),
                CalculatorBotton(text: '9',onButtonClick: onDigitClick ),
                CalculatorBotton(text: '*',onButtonClick: onOperatorsClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorBotton(text: '4',onButtonClick: onDigitClick),
                CalculatorBotton(text: '5',onButtonClick: onDigitClick),
                CalculatorBotton(text: '6',onButtonClick: onDigitClick),
                CalculatorBotton(text: '/',onButtonClick: onOperatorsClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorBotton(text: '1',onButtonClick: onDigitClick),
                CalculatorBotton(text: '2',onButtonClick: onDigitClick),
                CalculatorBotton(text: '3',onButtonClick: onDigitClick),
                CalculatorBotton(text: '+',onButtonClick: onOperatorsClick),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CalculatorBotton(text: '.',onButtonClick: onDigitClick),
                CalculatorBotton(text: '0',onButtonClick: onDigitClick),
                CalculatorBotton(text: '=',onButtonClick: onEqualClick),
                CalculatorBotton(text: '-',onButtonClick: onOperatorsClick),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onDigitClick(String text){
    resText += text ;
    setState(() {

    });
  }
  String lhs = '' ;
  String operator = '' ;
  void onOperatorsClick (String clicedOperator){
    if(operator.isEmpty){
      lhs = resText ;

    }else{
      String rhs = resText ;
      lhs = calculate(lhs,operator,rhs);
    }
    operator = clicedOperator ;
    resText = '' ;
    setState(() {

    });
  }
String calculate(String lhs, String operator, String rhs) {
  double num1 = double.parse(lhs);
  double num2 = double.parse(rhs);
  double result = 0.0 ;
  if(operator == '+'){
    result = num1+num2;
  }else if(operator == '-'){
    result = num1 - num2 ;
  }if(operator == '*'){
    result = num1*num2;
  }else if(operator == '/'){
    result = num1 / num2 ;
  }else if(operator=='%'){
    result = num1 % num2 ;
  }else if(operator=='sin'){
    num1=1;
    result = num1 * sin(num2*pi/180) ;
  }
  return result.toString();
}
void onEqualClick(String text){
    String rhs = resText ;
    resText = calculate(lhs, operator, rhs);
lhs = '';
operator = '' ;
  setState(() {
  });
  }
  void clearClick(){
    setState(() {
      lhs = '';
      operator = '' ;
      resText = '';
    });
  }

}

