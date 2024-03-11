import 'package:flutter/material.dart';

class CalculatorBotton extends StatelessWidget {
  String text ;
  Function onButtonClick ;
  CalculatorBotton({required this.text, required this.onButtonClick});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(MediaQuery.of(context).size.height*0.002),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal
          ),
            onPressed: (){
              onButtonClick(text);
            },
            child: Text(text,
            style: TextStyle(
              fontSize: 22,
            ),)),
      ),
    )
    ;
  }
}
