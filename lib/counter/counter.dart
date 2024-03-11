import 'package:flutter/material.dart';
import 'package:flutter_app/calculator/calculator.dart';
class Counter extends StatefulWidget {
  static const String routeName = 'counter screen' ;
  @override
  State<Counter> createState() => _CounterState();
}
class _CounterState extends State<Counter> {
  int count =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('counter',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(CalculatorScreen.routeName);
          }, icon: Icon(Icons.arrow_forward,color: Colors.black,))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Text('$count'),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.teal,
            borderRadius: BorderRadius.circular(20)
            ),
            child: IconButton(
              onPressed: (){
                count++;
                setState(() {
                });
              },
              icon: Icon(Icons.add,color: Colors.black,),
            ),
          )
          ,
        ],),
      )
    );
  }
}
