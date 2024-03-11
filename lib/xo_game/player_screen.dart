import 'package:flutter/material.dart';
import 'package:flutter_app/xo_game/xo_screen.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = 'player screen' ;
  String player1Name = '';
  String player2Name = '';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (text){
                player1Name = text;
              },
              decoration: InputDecoration(
                labelText: 'player one name'
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextField(
              onChanged: (text){
                player2Name = text;
              },
              decoration: InputDecoration(
                labelText: 'player two name'
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10),
              ),
                onPressed: (){
                Navigator.of(context).pushNamed(XO.routeName,
                    arguments: GameBoardArgs(
                        player1Name: player1Name,
                        player2Name: player2Name));
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
