import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory/data/data.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class Levels extends StatefulWidget {
  int level = 1;
  int open = 1;
  Levels({this.level,this.open});
  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {

  final fireStore = Firebase.initializeApp();

  bool show = true;
  bool choose = false;
  bool restartG = false;
  bool nextLevel = false;
  bool isLoaded = false;
  bool isLoadedIn = false;
  bool allow = true;
  int i;
  int ab = 2;
  int y;
  String q = "";
  String w = "";
  int numberOfTurns = 0;
  int sec = 700;
  int remainingTime = 0;
  int highScore = 0;
  int highScoreTime = 0;
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

  List<String> symbols =
  [
    "",
    "!",
    "@",
    "^",
    "&",
    "*",
    "%",
    "#",
    "?",
    ">",
    "<",
  ];

  @override
  void initState() {
    super.initState();
    getHighScore();
    first();
    Future.delayed(Duration(milliseconds: 5),(){
      timeLeft();
    });
    Future.delayed(Duration(milliseconds: 10),(){
      if(Data.showAds == true){
        bannerAds();
        loadInAd();
        loadReAds();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
    if(Data.showAds == true){
      _ad?.dispose();
    }
  }

  BannerAd _ad;

  bannerAds(){
    if(Data.showAds == true){
      _ad = BannerAd(
        adUnitId: "ca-app-pub-3028010056599796/1626317951",
        // adUnitId: BannerAd.testAdUnitId,
        size: AdSize.banner,
        request: AdRequest(),
        listener: AdListener(
            onAdLoaded: (_){
              setState(() {
                isLoaded = true;
              });
            },
            onAdFailedToLoad: (_ad,error){
              print("Ad failed to load on Error: $error");
            }
        ),
      );
    }
  }

  checkForAd(){
    if(Data.showAds == true){
      if(isLoaded == true){
        return Container(
          child: Center(
            child: AdWidget(
              ad: _ad,
            ),
          ),
          height: 50,
          width: 320,
          alignment: Alignment.center,
        );
      }else{
        return Container(
          height: 50,
          width: 320,
        );
      }
    }else{
      return Container(
        height: 50,
        width: 320,
      );
    }
  }

  InterstitialAd _in;

  loadInAd(){
    if(Data.showAds == true){
      _in = InterstitialAd(
        adUnitId: "ca-app-pub-3028010056599796/1055294705",
        // adUnitId: InterstitialAd.testAdUnitId,
        request: AdRequest(
          keywords: ["amazon", "games", "land", "collage","toys","learn","coding","food"],
        ),
        listener: AdListener(
            onAdLoaded: (_){
              setState(() {
                isLoadedIn = true;
              });
            },
            onAdFailedToLoad: (_ad,error){
              print("Ad failed to load on Error: $error");
            }
        ),
      );
      _in.load();
    }
  }

  showInAd(){
    if(isLoadedIn == true){
      _in.show();
    }
  }

  RewardedAd _re;

  loadReAds(){
    if(Data.showAds == true){
      _re =  RewardedAd(
        adUnitId: 'ca-app-pub-3028010056599796/3446334882',
        // adUnitId: RewardedAd.testAdUnitId,
        request: AdRequest(
          keywords: ["amazon", "games", "land", "collage","toys","learn","coding","food"],),
        listener: AdListener(
          onRewardedAdUserEarnedReward: (RewardedAd ad, RewardItem reward) {
          },
          onAdFailedToLoad: (Ad ad, LoadAdError error) {
          },
        ),
      );
      _re.load();
    }
  }

  showReAds(){
    if(Data.showAds == true){
      _re.show();
    }
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
      }else if(widget.level == 10){
        myPrefs.setInt("l10", numberOfTurns).then((value) {
          myPrefs.setInt("t10", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 11){
        myPrefs.setInt("l11", numberOfTurns).then((value) {
          myPrefs.setInt("t11", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 12){
        myPrefs.setInt("l12", numberOfTurns).then((value) {
          myPrefs.setInt("t12", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 13){
        myPrefs.setInt("l13", numberOfTurns).then((value) {
          myPrefs.setInt("t13", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 14){
        myPrefs.setInt("l14", numberOfTurns).then((value) {
          myPrefs.setInt("t14", gameTime).then((value) {
            getHighScore();
          });
        });
      }else if(widget.level == 15){
        myPrefs.setInt("l15", numberOfTurns).then((value) {
          myPrefs.setInt("t15", gameTime).then((value) {
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
    }else if(widget.level == 10){
      if(myPrefs.getInt("l10") != null && myPrefs.getInt("t10") != null) {
        setState(() {
          Data.level_10 = myPrefs.getInt("l10");
          Data.time_10 = myPrefs.getInt("t10");
        });
      }
    }else if(widget.level == 11){
      if(myPrefs.getInt("l11") != null && myPrefs.getInt("t11") != null) {
        setState(() {
          Data.level_11 = myPrefs.getInt("l11");
          Data.time_11 = myPrefs.getInt("t11");
        });
      }
    }else if(widget.level == 12){
      if(myPrefs.getInt("l12") != null && myPrefs.getInt("t12") != null) {
        setState(() {
          Data.level_12 = myPrefs.getInt("l12");
          Data.time_12 = myPrefs.getInt("t12");
        });
      }
    }else if(widget.level == 13){
      if(myPrefs.getInt("l13") != null && myPrefs.getInt("t13") != null) {
        setState(() {
          Data.level_13 = myPrefs.getInt("l13");
          Data.time_13 = myPrefs.getInt("t13");
        });
      }
    }else if(widget.level == 14){
      if(myPrefs.getInt("l14") != null && myPrefs.getInt("t14") != null) {
        setState(() {
          Data.level_14 = myPrefs.getInt("l14");
          Data.time_14 = myPrefs.getInt("t14");
        });
      }
    }else if(widget.level == 15){
      if(myPrefs.getInt("l15") != null && myPrefs.getInt("t15") != null) {
        setState(() {
          Data.level_15 = myPrefs.getInt("l15");
          Data.time_15 = myPrefs.getInt("t15");
        });
      }
    }
  }

  setRatingSharing() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    setState(() {
      myPrefs.setBool("rate", Data.rate);
      myPrefs.setBool("share", Data.share);
    });
  }

  getRatingSharing() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(myPrefs.getBool("rate") != null) {
      setState(() {
        Data.rate = myPrefs.getBool("rate");
      });
    }
    if(myPrefs.getBool("share") != null) {
      setState(() {
        Data.share = myPrefs.getBool("share");
      });
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
    // a.shuffle();
  }

  timeLeft(){
    if(widget.level == 1){
      setState(() {
        remainingTime = 18;
        highScore = Data.level_1;
        highScoreTime = Data.time_1;
      });
    }else if(widget.level == 2){
      setState(() {
        remainingTime = 15;
        highScore = Data.level_2;
        highScoreTime = Data.time_2;
      });
    }else if(widget.level == 3){
      setState(() {
        remainingTime = 20;
        highScore = Data.level_3;
        highScoreTime = Data.time_3;
      });
    }else if(widget.level == 4){
      setState(() {
        remainingTime = 15;
        highScore = Data.level_4;
        highScoreTime = Data.time_4;
      });
    }else if(widget.level == 5){
      setState(() {
        remainingTime = 18;
        highScore = Data.level_5;
        highScoreTime = Data.time_5;
      });
    }else if(widget.level == 6){
      setState(() {
        remainingTime = 22;
        highScore = Data.level_6;
        highScoreTime = Data.time_6;
      });
    }else if(widget.level == 7){
      setState(() {
        remainingTime = 24;
        highScore = Data.level_7;
        highScoreTime = Data.time_7;
      });
    }else if(widget.level == 8){
      setState(() {
        remainingTime = 30;
        highScore = Data.level_8;
        highScoreTime = Data.time_8;
      });
    }else if(widget.level == 9){
      setState(() {
        remainingTime = 34;
        highScore = Data.level_9;
        highScoreTime = Data.time_9;
      });
    }else if(widget.level == 10){
      setState(() {
        remainingTime = 35;
        highScore = Data.level_10;
        highScoreTime = Data.time_10;
      });
    }else if(widget.level == 11){
      setState(() {
        remainingTime = 28;
        highScore = Data.level_11;
        highScoreTime = Data.time_11;
      });
    }else if(widget.level == 12){
      setState(() {
        remainingTime = 24;
        highScore = Data.level_12;
        highScoreTime = Data.time_12;
      });
    }else if(widget.level == 13){
      setState(() {
        remainingTime = 28;
        highScore = Data.level_13;
        highScoreTime = Data.time_13;
      });
    }else if(widget.level == 14){
      setState(() {
        remainingTime = 26;
        highScore = Data.level_14;
        highScoreTime = Data.time_14;
      });
    }else if(widget.level == 15){
      setState(() {
        remainingTime = 30;
        highScore = Data.level_15;
        highScoreTime = Data.time_15;
      });
    }
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
          )) :
      widget.open == 3 ?
      Text(a[index],
          style: TextStyle(
            fontSize: 32,
            color: Colors.white,
          )) :
      widget.open == 4 ?
      Text(symbols[int.parse(a[index])],
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
        if(gameTime > 8){
          if(remainingTime - gameTime == 0){
            setState(() {
              allow = false;
              timer.cancel();
              showWinDialog("  Time is over\n"
                  "Restart the Game");
            });
          }
        }
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
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        remainingTime - gameTime != 0 ?
                        "${remainingTime - gameTime} sec left" :
                        "Game Over",
                        style: TextStyle(
                          fontSize: 30,
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
                        highScore == 0 ?
                        "Remaining time: $remainingTime sec" :
                        "High Score in Level ${widget.level}\n"
                            "   $highScore turns in $highScoreTime sec",
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
                          if(allow == true){
                            setState(() {
                              choose = false;
                            });
                            if(numberOfTurns == 0){
                              time();
                              if(Data.showAds == true){
                                _ad.load();
                              }
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
                          }
                        },
                        child: Card(
                          color: b.contains(a[index]) ? Colors.green : i == index || y == index ? Colors.red : Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          elevation: 8,
                          child: widget.open == 1 ?
                          Center(
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
                          widget.open == 4 ?
                          Center(
                            child: b.contains (a[index]) ? Text(
                              symbols[int.parse(a[index])],
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
              Positioned(
                bottom: 0,
                height: 50,
                width: 320,
                child: checkForAd(),
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
        if(widget.level <= 14){
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
      }else if(widget.level == 10){
        if(Data.level_10 != 0){
          if(numberOfTurns == Data.level_10){
            if(gameTime < Data.time_10){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_10){
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
      }else if(widget.level == 11){
        if(Data.level_11 != 0){
          if(numberOfTurns == Data.level_11){
            if(gameTime < Data.time_11){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_11){
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
      }else if(widget.level == 12){
        if(Data.level_12 != 0){
          if(numberOfTurns == Data.level_12){
            if(gameTime < Data.time_12){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_12){
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
      }else if(widget.level == 13){
        if(Data.level_13 != 0){
          if(numberOfTurns == Data.level_13){
            if(gameTime < Data.time_13){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_13){
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
      }else if(widget.level == 14){
        if(Data.level_14 != 0){
          if(numberOfTurns == Data.level_14){
            if(gameTime < Data.time_14){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_14){
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
      }else if(widget.level == 15){
        if(Data.level_15 != 0){
          if(numberOfTurns == Data.level_15){
            if(gameTime < Data.time_15){
              showWinDialog("   New High Score\n"
                  "$numberOfTurns Turns in $gameTime sec");
              setHighScore();
              timer.cancel();
            }else{
              showWinDialog("$numberOfTurns Turns in $gameTime sec");
              timer.cancel();
            }
          }else if(numberOfTurns < Data.level_15){
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
      timeLeft();
      if(gameTime > 0){
        timer.cancel();
        gameTime = 0;
      }
      gameTime = 0;
      allow = true;
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
      }else if(widget.level == 10){
        widget.open = 4;
      }else if(widget.level == 11){
        widget.open = 1;
      }else if(widget.level == 12){
        widget.open = 3;
      }else if(widget.level == 13){
        widget.open = 2;
      }else if(widget.level == 14){
        widget.open = 1;
      }else if(widget.level == 15){
        widget.open = 4;
      }
      i = null;
      ab = 2;
      y = null;
      q = "";
      w = "";
      numberOfTurns = 0;
      a = [];
      sec = 700;
      show = true;
      nextLevel = false;
      allow = true;
      b = [];
      first();
      timeLeft();
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
                    width: MediaQuery.of(context).size.width*0.11,
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
                      if(Data.showAds == true){
                        showInAd();
                        loadInAd();
                      }
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
                      if(Data.showAds == true){
                        showReAds();
                        loadReAds();
                      }
                      levelUp();
                      if(widget.level == 4 || widget.level == 10 || widget.level == 15){
                        if(widget.level == 4 || widget.level == 15){
                          getRatingSharing();
                          Future.delayed(Duration(milliseconds: 200),(){
                            setState(() {
                              if(Data.rate == false){
                                rate("If you like playing our\n"
                                    " game,Please consider\n"
                                    "  rating our game 5⭐\n");
                              }
                            });
                          });
                        }
                        if(widget.level == 10){
                          Future.delayed(Duration(milliseconds: 200),(){
                            setState(() {
                              if(Data.share == false){
                                share("  If you like playing,\n"
                                    "please consider shearing\n"
                                    "   it with friends");
                              }
                            });
                          });
                        }
                      }
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

  rate(String yo) {
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
                    width: MediaQuery.of(context).size.width*0.11,
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
                      setState(() {
                        Data.rate = true;
                        setRatingSharing();
                      });
                      launch("https://play.google.com/store/apps/details?id=com.blackhole.memory");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Rate ⭐',
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

  share(String yo) {
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
                    width: MediaQuery.of(context).size.width*0.11,
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
                      setState(() {
                        Data.share = true;
                        setRatingSharing();
                      });
                      Share.share("https://play.google.com/store/apps/details?id=com.blackhole.memory");
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'Share',
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
