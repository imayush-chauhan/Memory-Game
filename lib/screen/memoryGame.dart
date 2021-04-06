import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:memory/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Memory extends StatefulWidget {
  @override
  _MemoryState createState() => _MemoryState();
}

class _MemoryState extends State<Memory> {

  int open = 0;
  bool show = true;
  bool choose = false;
  bool restartG = false;
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
      if(open == 0){
        myPrefs.setInt("hp", numberOfTurns).then((value) {
          myPrefs.setInt("tp", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(open == 1){
        myPrefs.setInt("he", numberOfTurns).then((value) {
          myPrefs.setInt("te", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(open == 2){
        myPrefs.setInt("hn", numberOfTurns).then((value) {
          myPrefs.setInt("tn", gameTime).then((value) {
            getHighScore();
          });
        });
      }
    });
  }

  getHighScore() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(open == 0){
      if(myPrefs.getInt("hp") != null && myPrefs.getInt("tp") != null) {
        setState(() {
          Data.highScoreInPokemon = myPrefs.getInt("hp");
          Data.timeInPokemon = myPrefs.getInt("tp");
        });
      }
    }else if(open == 1){
      if(myPrefs.getInt("he") != null && myPrefs.getInt("te") != null) {
        setState(() {
          Data.highScoreInEmoji = myPrefs.getInt("he");
          Data.timeInEmoji = myPrefs.getInt("te");
        });
        return Data.highScoreInEmoji;
      }
    }else if(open == 2){
      if(myPrefs.getInt("hn") != null && myPrefs.getInt("tn") != null) {
        setState(() {
          Data.highScoreInNumber = myPrefs.getInt("hn");
          Data.timeInNumber = myPrefs.getInt("tn");
        });
      }
    }
  }


  first(){

    for(int i = 1;
    Data.level == 1 ? i <= 2 :
    Data.level == 2 ? i <= 3 :
    Data.level == 3 ? i <= 6 :
    Data.level == 4 ? i <= 8 :
    Data.level == 5 ? i <= 10 :
    Data.level == 6 ? i <= 10 :
    i <= 10; i++){
      a.add(i.toString());
      a.add(i.toString());
    }
    a.shuffle();
  }

  number(int index){
    if(index == i || y == index){
      return open == 0 ?
      Image.asset("asset/images/${a[index]}.png",
        fit: BoxFit.contain,
        width:
        Data.level == 1 ? 110 :
        Data.level == 2 ? 90 :
        Data.level == 3 ? 70 :
        Data.level == 4 ? 50 :
        Data.level == 5 ? 50 : 50,
      ) :
      open == 1 ?
      Text(emoji[int.parse(a[index])],
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          )) : open == 2 ?
      Text(a[index],
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          )) :
      Image.asset("asset/images/${a[index]}.png",
        fit: BoxFit.contain,
        width:
        Data.level == 1 ? 110 :
        Data.level == 2 ? 90 :
        Data.level == 3 ? 70 :
        Data.level == 4 ? 50 :
        Data.level == 5 ? 50 : 50,
      );
    } else {
      return
        open == 0 ? Image.asset("asset/images/3.png",
          width:
          Data.level == 1 ? 110 :
          Data.level == 2 ? 85 :
          Data.level == 3 ? 70 :
          Data.level == 4 ? 50 :
          Data.level == 5 ? 50 : 50,
          fit: BoxFit.contain,
          color: Color(0xffDD2A7B).withOpacity(0.85),
        ) :
        Text("?",
            style: TextStyle(
                fontSize:
                Data.level == 1 ? 38 : 30,
                color: Color(0xffDD2A7B).withOpacity(0.85),
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
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
            title: Text("Level ${Data.level}",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w600
              ),
            ),
            elevation: 0,
            actions: [
              GestureDetector(
                onTap: (){
                  setState(() {
                    choose = !choose;
                  });
                },
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  width: 140,
                  child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            open == 0 ? "Pokemon" :
                            open == 1 ? "Emojis" :
                            open == 2 ? "Numbers" :
                            "Pokemon",
                            style: TextStyle(
                                color: Color(0xffDD2A7B),
                                fontSize: 16.5,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          choose == false ? Icon(Icons.keyboard_arrow_down,
                            color: Color(0xffDD2A7B),) :
                          Icon(Icons.keyboard_arrow_up,
                            color: Color(0xffDD2A7B),),
                        ],
                      )
                  ),
                ),
              ),
            ],
          ),
          body: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                top: MediaQuery.of(context).size.height*0.045,
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
                      child: Text(gameTime.toString(),
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
                        Data.highScoreInPokemon != 0 || Data.highScoreInNumber != 0 || Data.highScoreInEmoji != 0 ?
                        open == 0 ?
                        "High Score in Pokemon\n"
                            "     ${Data.highScoreInPokemon} turns in ${Data.timeInPokemon} sec" :
                        open == 1 ?
                        "High Score in Emoji\n"
                            "    ${Data.highScoreInEmoji} turns in ${Data.timeInEmoji} sec" :
                        open == 2 ?
                        "High Score in Number\n"
                            "      ${Data.highScoreInNumber} turns in ${Data.timeInNumber} sec"
                            :
                        "High Score in Game\n"
                            "     ${Data.highScoreInPokemon} turns in ${Data.timeInPokemon} sec" :
                        "Find Matching cards",
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
                MediaQuery.of(context).size.height*0.14 :
                MediaQuery.of(context).size.height*0.18,

                height: MediaQuery.of(context).size.height,

                width: Data.level == 1 ? MediaQuery.of(context).size.width :
                Data.level == 2 ? MediaQuery.of(context).size.width*0.8 :
                Data.level == 3 ? MediaQuery.of(context).size.width*0.93 :
                MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: a.length == null ? 0 : a.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                      Data.level == 1 || Data.level == 2 ? 2 :
                      Data.level == 3 ? 3 :
                      Data.level == 4 || Data.level == 5 ? 4 : 4,
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
                          child: open == 0 ? Center(
                            child: b.contains(a[index]) ?
                            Image.asset("asset/images/${a[index]}.png",
                              fit: BoxFit.contain,
                              width:
                              Data.level == 1 ? 120 :
                              Data.level == 2 ? 100 :
                              Data.level == 3 ? 80 :
                              Data.level == 4 ? 60 :
                              Data.level == 5 ? 60 : 60,
                            ) :
                            number(index),
                          ) : open == 1 ?
                          Center(
                            child: b.contains (a[index]) ? Text(
                              emoji[int.parse(a[index])],
                              style: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                            ) : number(index),
                          ) : open == 2 ?
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
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                bottom: choose ? 25 : -100,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          open = 0;
                          choose = false;
                          restart();
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 120,
                        child: Card(
                            elevation: 20,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8),
                                child: Text("Pokemon",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffDD2A7B),
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          open = 1;
                          choose = false;
                          restart();
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 120,
                        child: Card(
                            elevation: 20,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8),
                                child: Text("Emojis",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffDD2A7B),
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          open = 2;
                          choose = false;
                          restart();
                        });
                      },
                      child: Container(
                        height: 55,
                        width: 120,
                        child: Card(
                            elevation: 20,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8,right: 8),
                                child: Text("Numbers",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xffDD2A7B),
                                        fontWeight: FontWeight.bold)),
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  bottom: choose == false ? 30 : -100,
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: LinearProgressIndicator(
                      value: Data.level == 1 ? 0 : Data.level/6,
                      backgroundColor: Colors.black.withOpacity(0.15),
                      valueColor: AlwaysStoppedAnimation<Color>(Color(0xffDD2A7B)),
                    ),
                  )
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 300),
                bottom: choose == false ? 2 : -100,
                left: Data.level == 1 ?
                MediaQuery.of(context).size.width*0.005 :
                Data.level == 2 ?
                MediaQuery.of(context).size.width*0.25 :
                Data.level == 3 ?
                MediaQuery.of(context).size.width*0.4 :
                Data.level == 4 ?
                MediaQuery.of(context).size.width*0.54 :
                Data.level == 5 ?
                MediaQuery.of(context).size.width*0.7 :
                MediaQuery.of(context).size.width*0.8,
                child: CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.transparent,
                  child: Image.asset("asset/images/3.png"),
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

    if(b.length >= a.length && Data.level == 5){
      if(open == 0){
        if(Data.highScoreInPokemon != 0){
          if(numberOfTurns == Data.highScoreInPokemon){
            if(gameTime < Data.timeInPokemon){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.highScoreInPokemon){
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
      }else if(open == 1){
        if(numberOfTurns == Data.highScoreInEmoji){
          if(gameTime < Data.timeInEmoji){
            showWinDialog("   New High Score\n"
                "$numberOfTurns Turns in $gameTime sec");
            setHighScore();
            timer.cancel();
          }else{
            showWinDialog("$numberOfTurns Turns in $gameTime sec");
            timer.cancel();
          }
        }else if(Data.highScoreInEmoji != 0){
          if(numberOfTurns < Data.highScoreInEmoji){
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
      }else if(open == 2){
        if(Data.highScoreInNumber != 0){
          if(numberOfTurns == Data.highScoreInNumber){
            if(gameTime < Data.timeInNumber){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.highScoreInNumber){
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
    }else if(b.length >= a.length){
      Timer(Duration(milliseconds: 350), () {
        setState(() {
          Data.level++;
          nextLevel();
        });
      });
    }
  }

  restart(){
    setState(() {
      Data.level = 1;
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

  nextLevel(){
    setState(() {
      i = null;
      ab = 2;
      y = null;
      q = "";
      w = "";
      a = [];
      sec = 700;
      show = true;
      b = [];
      first();
    });
  }

  showWinDialog(String yo) {
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Center(child: Text(
              yo,
            )),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            actions: [
              Row(
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
                    width: MediaQuery.of(context).size.width*0.14,
                  ),
                  MaterialButton(
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
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}
