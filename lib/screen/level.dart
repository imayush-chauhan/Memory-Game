import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memory/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Levels extends StatefulWidget {
  int level = 1;
  int open = 1;
  Levels({this.level,this.open});
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {

  bool show = true;
  bool choose = false;
  bool restartG = false;
  bool nextLevel = false;
  int i;
  int ab = 2;
  int y;
  String q = "";
  String w = "";
  int numberOfTurns = 0;
  int sec = 700;
  List<String> a = [];
  List<String> b = [];

  Timer timer;
  int gameTime = 0;

  List<String> emoji =
  [
    "",
    "🔥",
    "😁",
    "😍",
    "🥰",
    "🙃",
    "😘",
    "😃",
    "😂",
    "😊",
    "😣",
  ];

  @override
  void initState() {
    super.initState();
    first();
    getHighScore();
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  setHighScore() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      if(widget.level == 1){
        myPrefs.setInt("l1", numberOfTurns).then((value) {
          myPrefs.setInt("t1", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 2){
        myPrefs.setInt("l2", numberOfTurns).then((value) {
          myPrefs.setInt("t2", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 3){
        myPrefs.setInt("l3", numberOfTurns).then((value) {
          myPrefs.setInt("t3", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 4){
        myPrefs.setInt("l4", numberOfTurns).then((value) {
          myPrefs.setInt("t4", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 5){
        myPrefs.setInt("l5", numberOfTurns).then((value) {
          myPrefs.setInt("t5", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 6){
        myPrefs.setInt("l6", numberOfTurns).then((value) {
          myPrefs.setInt("t6", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 7){
        myPrefs.setInt("l7", numberOfTurns).then((value) {
          myPrefs.setInt("t7", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 8){
        myPrefs.setInt("l8", numberOfTurns).then((value) {
          myPrefs.setInt("t8", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 9){
        myPrefs.setInt("l9", numberOfTurns).then((value) {
          myPrefs.setInt("t9", gameTime).then((value) {
            getHighScore();
          });
        });
      }
    });
  }

  setPlayerLevel() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      myPrefs.setInt("pl", Data.playerLevel);
    });
  }

  getHighScore() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(widget.level == 1){
      if(myPrefs.getInt("l1") != null && myPrefs.getInt("t1") != null) {
        setState(() {
          Data.level_1 = myPrefs.getInt("l1");
          Data.time_1 = myPrefs.getInt("t1");
        });
      }
    }else if(widget.level == 2){
      if(myPrefs.getInt("l2") != null && myPrefs.getInt("t2") != null) {
        setState(() {
          Data.level_2 = myPrefs.getInt("l2");
          Data.time_2 = myPrefs.getInt("t2");
        });
      }
    }else if(widget.level == 3){
      if(myPrefs.getInt("l3") != null && myPrefs.getInt("t3") != null) {
        setState(() {
          Data.level_3 = myPrefs.getInt("l3");
          Data.time_3 = myPrefs.getInt("t3");
        });
      }
    }else if(widget.level == 4){
      if(myPrefs.getInt("l4") != null && myPrefs.getInt("t4") != null) {
        setState(() {
          Data.level_4 = myPrefs.getInt("l4");
          Data.time_4 = myPrefs.getInt("t4");
        });
      }
    }else if(widget.level == 5){
      if(myPrefs.getInt("l5") != null && myPrefs.getInt("t5") != null) {
        setState(() {
          Data.level_5 = myPrefs.getInt("l5");
          Data.time_5 = myPrefs.getInt("t5");
        });
      }
    }else if(widget.level == 6){
      if(myPrefs.getInt("l6") != null && myPrefs.getInt("t6") != null) {
        setState(() {
          Data.level_6 = myPrefs.getInt("l6");
          Data.time_6 = myPrefs.getInt("t6");
        });
      }
    }else if(widget.level == 7){
      if(myPrefs.getInt("l7") != null && myPrefs.getInt("t7") != null) {
        setState(() {
          Data.level_7 = myPrefs.getInt("l7");
          Data.time_7 = myPrefs.getInt("t7");
        });
      }
    }else if(widget.level == 8){
      if(myPrefs.getInt("l8") != null && myPrefs.getInt("t8") != null) {
        setState(() {
          Data.level_8 = myPrefs.getInt("l8");
          Data.time_8 = myPrefs.getInt("t8");
        });
      }
    }else if(widget.level == 9){
      if(myPrefs.getInt("l9") != null && myPrefs.getInt("t9") != null) {
        setState(() {
          Data.level_9 = myPrefs.getInt("l9");
          Data.time_9 = myPrefs.getInt("t9");
        });
      }
    }
  }


  first(){

    for( int i = 1;
    widget.level == 1 ? i <= 6 :
    widget.level == 2 ? i <= 6 :
    widget.level == 3 ? i <= 8 :
    widget.level == 4 ? i <= 6 :
    widget.level == 5 ? i <= 8 :
    widget.level == 6 ? i <= 8 :
    widget.level == 7 ? i <= 10 :
    widget.level == 8 ? i <= 10 :
    widget.level == 9 ? i <= 10 :
    i <= 10; i++){
      a.add(i.toString());
      a.add(i.toString());
    }
    a.shuffle();
  }

  number(int index){
    if(index == i || y == index){
      return widget.open == 1 ?
      Image.asset("asset/images/${a[index]}.png",
        fit: BoxFit.contain,
        width:
        widget.level == 1 ? 75 :
        widget.level == 2 ? 80 :
        widget.level == 3 ? 60 :
        widget.level == 4 ? 65 :
        65,
      ) :
      widget.open == 2 ?
      Text(emoji[int.parse(a[index])],
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          )) : widget.open == 3 ?
      Text(a[index],
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          )) :
      Image.asset("asset/images/${a[index]}.png",
        fit: BoxFit.contain,
        width:
        widget.level == 1 ? 77 :
        widget.level == 2 ? 80 :
        widget.level == 3 ? 65 :
        widget.level == 4 ? 80 :
        65,
      );
    } else {
      return
        widget.open == 1 ? Image.asset("asset/images/3.png",
          width:
          widget.level == 1 ? 80 :
          widget.level == 2 ? 80 :
          widget.level == 3 ? 55 :
          widget.level == 4 ? 60 :
          50,

          fit: BoxFit.contain,
          color: Color(0xffDD2A7B).withOpacity(0.85),
        ) :
        Text("?",
            style: TextStyle(
                fontSize:
                widget.level == 1 ? 38 : 30,
                color: Color(0xffDD2A7B).withOpacity(0.85)
            ));
    }
  }

  time(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        gameTime++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          choose = false;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin:  Alignment.topRight,
                end: Alignment.bottomLeft,

                stops: [0,0.46,1],

                colors: [
                  Color(0xffFFCC70),
                  Color(0xffC850C0),
                  Color(0xff4158D0),
                ]
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Text("Level ${widget.level}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
            elevation: 0,
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*0.03,
                child:
                numberOfTurns >= 1 ?
                Row(
                  children: [
                    Text(numberOfTurns.toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text("turns",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        gameTime.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text("sec",
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width*0.06,
                    ),
                    MaterialButton(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      splashColor: Color(0xffDD2A7B),
                      minWidth: 120,
                      height: 50,
                      onPressed: () {
                        showWinDialog("Memory Game");
                        setState(() {
                          restartG = true;
                          choose = false;
                        });
                      },
                      child: Text(
                        'Restart',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xffDD2A7B),
                          // fontFamily: 'David',
                        ),
                      ),
                    ),
                  ],
                ) :
                Container(
                  width: 350,
                  height: 90,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color:  Colors.white,
                    child: Center(
                      child: Text(
                        widget.level == 1 ?
                        "High Score in Level 1\n"
                            "     ${Data.level_1} turns in ${Data.time_1} sec" :
                        widget.level == 2 ?
                        "High Score in Level 2\n"
                            "     ${Data.level_2} turns in ${Data.time_2} sec" :
                        widget.level == 3 ?
                        "High Score in Level 3\n"
                            "      ${Data.level_3} turns in ${Data.time_3} sec" :
                        widget.level == 4 ?
                        "High Score in Level 4\n"
                            "      ${Data.level_4} turns in ${Data.time_4} sec" :
                        widget.level == 5 ?
                        "High Score in Level 5\n"
                            "      ${Data.level_5} turns in ${Data.time_5} sec" :
                        widget.level == 6 ?
                        "High Score in Level 6\n"
                            "      ${Data.level_6} turns in ${Data.time_6} sec" :
                        widget.level == 7 ?
                        "High Score in Level 7\n"
                            "      ${Data.level_7} turns in ${Data.time_7} sec" :
                        widget.level == 8 ?
                        "High Score in Level 8\n"
                            "      ${Data.level_8} turns in ${Data.time_8} sec" :
                        widget.level == 9 ?
                        "High Score in Level 9\n"
                            "      ${Data.level_9} turns in ${Data.time_9} sec" :
                        "High Score in Game\n"
                            "     100 turns in 132 sec",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xffDD2A7B),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 350),
                top: numberOfTurns >= 1 ?
                MediaQuery.of(context).size.height*0.135 :
                MediaQuery.of(context).size.height*0.165,

                height: MediaQuery.of(context).size.height,

                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: a.length == null ? 0 : a.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                      widget.level == 1 ? 3 :
                      widget.level == 2 ? 3 :
                      widget.level == 3 ? 4 :
                      widget.level == 4 ? 3 :
                      4,
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 4,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            choose = false;
                          });
                          if(numberOfTurns == 0){
                            time();
                          }
                          if(i != index && !b.contains(a[index]) && show == true){
                            setState(() {
                              numberOfTurns++;
                              i = index;
                              if(ab%2 == 0){
                                y = i;
                                q = a[index].toString();
                              }else{
                                w = a[index].toString();
                                show = false;
                                check();
                              }
                              if(ab%2 != 0){
                                Timer(Duration(milliseconds: sec), () {
                                  setState(() {
                                    i = null;
                                    y = null;
                                    show = true;
                                  });
                                });
                                sec = 700;
                              }
                              ab++;
                            });
                          }
                        },
                        child: Card(
                          color: b.contains(a[index]) ? Colors.green : i == index || y == index ? Colors.red : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 8,
                          child: widget.open == 1 ? Center(
                            child: b.contains(a[index]) ?
                            Image.asset("asset/images/${a[index]}.png",
                              fit: BoxFit.contain,
                              width:
                              widget.level == 1 ? 85 :
                              widget.level == 2 ? 95 :
                              widget.level == 3 ? 70 :
                              widget.level == 4 ? 95 :
                              70,
                            ) :
                            number(index),
                          ) :
                          widget.open == 2 ?
                          Center(
                            child: b.contains (a[index]) ? Text(
                              emoji[int.parse(a[index])],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ) : number(index),
                          ) :
                          widget.open == 3 ?
                          Center(
                            child: b.contains (a[index]) ? Text(
                              a[index],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ) : number(index),
                          ) :
                          Center(
                            child: b.contains (a[index]) ? Text(
                              a[index],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ) : number(index),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  check(){
    if(q == w){
      b.add(w);
      b.add(q);
      setState(() {
        sec = 1;
      });
    }

    if(b.length >= a.length){
      setState(() {
        if(widget.level <= 8){
          nextLevel = true;
        }
      });
      if(widget.level == Data.playerLevel){
        Data.playerLevel = widget.level +1;
        setPlayerLevel();
      }
      if(widget.level == 1){
        if(Data.level_1 != 0){
          if(numberOfTurns == Data.level_1){
            if(gameTime < Data.time_1){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_1){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 2){
        if(numberOfTurns == Data.level_2){
          if(gameTime < Data.time_2){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else if(Data.level_2 != 0){
          if(numberOfTurns < Data.level_2){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 3){
        if(Data.level_3 != 0){
          if(numberOfTurns == Data.level_3){
            if(gameTime < Data.time_3){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_3){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 4){
        if(Data.level_4 != 0){
          if(numberOfTurns == Data.level_4){
            if(gameTime < Data.time_4){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_4){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 5){
        if(Data.level_5 != 0){
          if(numberOfTurns == Data.level_5){
            if(gameTime < Data.time_5){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_5){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 6){
        if(Data.level_6 != 0){
          if(numberOfTurns == Data.level_6){
            if(gameTime < Data.time_6){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_6){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 7){
        if(Data.level_7 != 0){
          if(numberOfTurns == Data.level_7){
            if(gameTime < Data.time_7){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_7){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 8){
        if(Data.level_8 != 0){
          if(numberOfTurns == Data.level_8){
            if(gameTime < Data.time_8){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_8){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }else if(widget.level == 9){
        if(Data.level_9 != 0){
          if(numberOfTurns == Data.level_9){
            if(gameTime < Data.time_9){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_9){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else{
          showWinDialog("   New High Score\n"
              "$numberOfTurns Turns in $gameTime sec");
          setHighScore();
          timer.cancel();
        }
      }
    }
  }

  restart(){
    setState(() {
      i = null;
      ab = 2;
      y = null;
      q = "";
      w = "";
      numberOfTurns = 0;
      a = [];
      sec = 700;
      show = true;
      b = [];
      first();
      if(gameTime > 0){
        timer.cancel();
        gameTime = 0;
      }
      gameTime = 0;
      restartG = false;
    });
  }

  levelUp(){
    setState(() {
      widget.level++;
      if(widget.level == 2){
        widget.open = 3;
      }else if(widget.level == 3){
        widget.open = 1;
      }else if(widget.level == 4){
        widget.open = 2;
      }else if(widget.level == 5){
        widget.open = 3;
      }else if(widget.level == 6){
        widget.open = 2;
      }else if(widget.level == 7){
        widget.open = 3;
      }else if(widget.level == 8){
        widget.open = 1;
      }else if(widget.level == 9){
        widget.open = 2;
      }
      print(widget.level);
      print(widget.open);
      print(">>>>>>>>>>>>>>>>>>>>>>>>>>");
      i = null;
      ab = 2;
      y = null;
      q = "";
      w = "";
      numberOfTurns = 0;
      a = [];
      sec = 700;
      show = true;
      b = [];
      first();
      getHighScore();
      if(gameTime > 0){
        timer.cancel();
        gameTime = 0;
      }
      gameTime = 0;
      restartG = false;
    });
  }

  showWinDialog(String yo) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(child: Text(
                yo
            )),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("cancel",
                        style: TextStyle(
                          fontSize: 21,
                          color: Color(0xff151515),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.12,
                  ),
                  nextLevel == false ? MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.red,
                    minWidth: 120,
                    height: 50,
                    onPressed: (){
                      restart();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Restart',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ) : MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.red,
                    minWidth: 140,
                    height: 50,
                    onPressed: (){
                      levelUp();
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Next Level',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}
