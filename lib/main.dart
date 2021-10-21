import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text('Sheeraz'),
          backgroundColor: Colors.green,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  bool turnShifter1 = true;
  bool turnShifter2 = false;
  bool turnShifter3 = false;
  bool turnShifter4 = false;

  int t1 = 0;
  int t2 = 0;
  int t3 = 0;
  int t4 = 0;

  int p1DiceNumber = 1;
  int p2DiceNumber = 1;
  int p3DiceNumber = 1;
  int p4DiceNumber = 1;

  int s1 = 0;
  int s2 = 0;
  int s3 = 0;
  int s4 = 0;

  void displayWinner(player){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Result'),
            content: Text('${player} won the game'),

          );
        });
  }

  void decideWinner(){
    if(s1>s2){
      if(s2>s3){
        if(s3>s4){
          displayWinner('Player 1');
          restartGame();
        }
        else{
          displayWinner('Player 4');
          restartGame();
        }
      }
    }

    else if(s2>s3){
      if(s2>s4){
        displayWinner('Player 2');
        restartGame();
      }
      else{
        displayWinner('Player 4');
        restartGame();
      }
    }

    else if(s3>s4){
      displayWinner('Player 3');
      restartGame();
    }

    else{
      displayWinner('Player 4');
      restartGame();
    }
  }

  void changeDiceFace1() {
    setState((){
      if(t1>=10 && t2>=10 &&t3>=10 && t4>=10 ){
       decideWinner();
      }
      else{
        if(turnShifter1){
          p1DiceNumber = Random().nextInt(6) + 1;
          t1 = t1+1;
          s1 = s1 + p1DiceNumber;

          print('${turnShifter1}  ${t1}   ${s1}   ${p1DiceNumber}');
          print('${turnShifter2}  ${t2}   ${s2}');
          print('${turnShifter3}  ${t3}   ${s3}');
          print('${turnShifter4}  ${t4}   ${s4}');
          print('\n');

          if(p1DiceNumber != 6){
            turnShifter1 = false;
            turnShifter2 = true;
          }
        }
      }
    });
  }
  void changeDiceFace2() {
    setState(() {
      if(t1>=10 && t2>=10 &&t3>=10 && t4>=10 ){
        decideWinner();
      }
      else{
        if(turnShifter2){
          p2DiceNumber = Random().nextInt(6) + 1;
          t2 = t2+1;
          s2 = s2 + p2DiceNumber;

          print('${turnShifter1}  ${t1}   ${s1}');
          print('${turnShifter2}  ${t2}   ${s2}');
          print('${turnShifter3}  ${t3}   ${s3}');
          print('${turnShifter4}  ${t4}   ${s4}');
          print('\n');

          if(p2DiceNumber != 6){
            turnShifter2 = false;
            turnShifter3 = true;
          }
        }
      }
    });
  }
  void changeDiceFace3() {
    setState(() {
        if(t1>=10 && t2>=10 &&t3>=10 && t4>=10 ){
          decideWinner();
          restartGame();
        }
        else{
          if(turnShifter3){
            p3DiceNumber = Random().nextInt(6) + 1;
            t3 = t3+1;
            s3 = s3 + p3DiceNumber;

            print('${turnShifter1}  ${t1}   ${s1}');
            print('${turnShifter2}  ${t2}   ${s2}');
            print('${turnShifter3}  ${t3}   ${s3}');
            print('${turnShifter4}  ${t4}   ${s4}');
            print('\n');

            if(p3DiceNumber != 6){
              turnShifter3 = false;
              turnShifter4 = true;
            }
          }
        }
      });
  }
  void changeDiceFace4() {
    setState(() {
      if(t1>=10 && t2>=10 &&t3>=10 && t4>=10 ){
        decideWinner();
      }
      else{
        if(turnShifter4){
          p4DiceNumber = Random().nextInt(6) + 1;
          t4 = t4+1;
          s4 = s4 + p4DiceNumber;

          print('${turnShifter1}  ${t1}   ${s1}');
          print('${turnShifter2}  ${t2}   ${s2}');
          print('${turnShifter3}  ${t3}   ${s3}');
          print('${turnShifter4}  ${t4}   ${s4}');
          print('\n');

          if(p4DiceNumber != 6){
            turnShifter4 = false;
            turnShifter1 = true;
          }
        }
      }
    });
  }

  void restartGame(){
    t1 = 0;
    t2= 0;
    t3 = 0;
    t4 = 0;

    s1 = 0;
    s2 = 0;
    s3 = 0;
    s4 = 0;

    p1DiceNumber = 1;
    p2DiceNumber = 1;
    p3DiceNumber = 1;
    p4DiceNumber = 1;

  }

  @override
  Widget build(BuildContext context) {
    return Center(

      child:Column(
        children:<Widget>[
          SizedBox(
            height: 20,
          ),

          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Image.asset(
                      'images/dice$p1DiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace1();
                      //s1 = p1DiceNumber+ s1;
                    },
                  ),
                ),

                Expanded(
                  child: FlatButton(
                    child: Image.asset(
                      'images/dice$p2DiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace2();
                      //s2 = p2DiceNumber+ s2;
                    },
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: 30,
          ),

          Container(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    child: Image.asset(
                      'images/dice$p3DiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace3();
                      //s3 = p3DiceNumber+ s3;
                    },
                  ),
                ),

                Expanded(
                  child: FlatButton(
                    child: Image.asset(
                      'images/dice$p4DiceNumber.png',
                    ),
                    onPressed: () {
                      changeDiceFace4();
                      //s4 = p4DiceNumber+ s4;
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}