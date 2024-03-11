import 'package:flutter/material.dart';
import 'package:flutter_app/calculator/calculator.dart';
import 'package:flutter_app/counter/counter.dart';
import 'package:flutter_app/xo_game/player_screen.dart';
import 'package:flutter_app/xo_game/xo_screen.dart';
void main(){
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Counter.routeName,
      routes: {
        Counter.routeName : (context) => Counter(),
        CalculatorScreen.routeName : (context) => CalculatorScreen(),
        XO.routeName : (context) => XO(),
        PlayerScreen.routeName : (context) => PlayerScreen(),
      },
    );
  }
}