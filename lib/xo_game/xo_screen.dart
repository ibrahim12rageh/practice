import 'package:flutter/material.dart';
import 'package:flutter_app/xo_game/board_button.dart';
class XO extends StatefulWidget {
  static const routeName = 'xo screen' ;
  @override
  State<XO> createState() => _XOState();
}

class _XOState extends State<XO> {
  List<String> textButtons = [
    '','','',
    '','','',
    '','','',
  ];
  int scoreplayerone = 0;
  int scoreplayertwo = 0;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as GameBoardArgs;
    return Scaffold(
      appBar: AppBar(
        title: Text('XO Game'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.player1Name} (x)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('$scoreplayerone',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${args.player2Name} (o)',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text('$scoreplayertwo',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
            BoardButton(text: textButtons[0],index: 0,onButtonClick: onButtonClick),
            BoardButton(text: textButtons[1],index: 1,onButtonClick: onButtonClick),
            BoardButton(text: textButtons[2],index: 2,onButtonClick: onButtonClick),
          ],)),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(text: textButtons[3],index: 3,onButtonClick: onButtonClick),
              BoardButton(text: textButtons[4],index: 4,onButtonClick: onButtonClick),
              BoardButton(text: textButtons[5],index: 5,onButtonClick: onButtonClick),
          ],)),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              BoardButton(text: textButtons[6],index: 6,onButtonClick: onButtonClick),
              BoardButton(text: textButtons[7],index: 7,onButtonClick: onButtonClick),
              BoardButton(text: textButtons[8],index: 8,onButtonClick: onButtonClick),
          ],)),
        ],
      ),
    );
  }

  int counter = 0 ;

  void onButtonClick(index){
    if(textButtons[index].isNotEmpty){
      return ;
    }
    if(counter % 2 ==0){
      textButtons[index] = 'x';
    }else{
      textButtons[index] = 'o';
    }
    counter++;
    if(checkWinner('x')){
      scoreplayerone++;
      finshGame();
    }else if(checkWinner('o')){
      scoreplayertwo++;
      finshGame();
    }else if(counter == 9){ //فى حالة حدوث تعادل
      finshGame();
    }
    setState(() {

    });
  }
  bool checkWinner(String symbol){
    for(int i = 0 ; i<9;i+=3){
      if(textButtons[i]==symbol &&
          textButtons[i+1]==symbol &&
          textButtons[i+2]==symbol){
        return true ;
      }
    }

    for(int i =0;i<3;i++){
      if(textButtons[i]==symbol &&
          textButtons[i+3]==symbol &&
          textButtons[i+6]==symbol){
        return true ;
      }
    }
    if(textButtons[0]==symbol &&
        textButtons[4]==symbol &&
        textButtons[8]==symbol){
      return true ;
    }
    if(textButtons[2]==symbol &&
        textButtons[4]==symbol &&
        textButtons[6]==symbol){
      return true ;
    }
    return false ;
  }
  void finshGame(){
    for(int i = 0 ; i<textButtons.length;i++){
      textButtons[i]='';
    }
    counter = 0 ;
    setState(() {

    });
  }
}

class GameBoardArgs{
  String player1Name ;
  String player2Name ;
  GameBoardArgs({required this.player1Name,required this.player2Name});
}
