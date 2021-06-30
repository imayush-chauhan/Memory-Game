import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ChallengesLevel extends StatefulWidget {
  int challenge = 1;
  ChallengesLevel({this.challenge});
  @override
  _ChallengesLevelState createState() => _ChallengesLevelState();
}

class _ChallengesLevelState extends State<ChallengesLevel> {

  final fireStore = Firebase.initializeApp();

  bool show = true;
  bool choose = false;
  bool restartG = false;
  bool allow = true;
  bool isLoaded = false;
  bool isLoadedIn = false;
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

  @override
  void initState() {
    super.initState();
    first();
    if(Data.showAds == true){
      bannerAds();
      loadReAds();
    }
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

  bannerAds() async{
    _ad = BannerAd(
      adUnitId: "ca-app-pub-3028010056599796/1626317951",
      size: AdSize.banner,
      request: AdRequest(),
      listener: AdListener(
          onAdLoaded: (_){
            setState(() {
              isLoaded = true;
            });
          },
          onAdFailedToLoad: (_ad,error){
          }
      ),
    );
  }

  checkForAd(){
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
  }

  RewardedAd _re;

  loadReAds(){
    if(Data.showAds == true){
      _re =  RewardedAd(
        adUnitId: 'ca-app-pub-3028010056599796/3446334882',
        request: AdRequest(
          keywords: ["amazon", "games", "land", "collage","toys","learn","coding","food"],
        ),
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
      if(widget.challenge == 1){
        myPrefs.setBool("c1", Data.challenge_1);
      }else if(widget.challenge == 2){
        myPrefs.setBool("c2", Data.challenge_2);
      }else if(widget.challenge == 3){
        myPrefs.setBool("c3", Data.challenge_3);

      }
    });
  }

  first(){
    for( int i = 1;
    widget.challenge == 1 ? i <= 8 :
    widget.challenge == 2 ? i <= 10 :
    widget.challenge == 3 ? i <= 10 :
    i <= 8; i++){
      a.add(i.toString());
      a.add(i.toString());
    }
    a.shuffle();
  }

  number(int index){
    if(index == i || y == index){
      return Image.asset("asset/images/${a[index]}.png",
        fit: BoxFit.contain,
        width: 60,
      );
    } else {
      return
        Image.asset("asset/images/3.png",
          width: 50,
          fit: BoxFit.contain,
          color: Color(0xffDD2A7B).withOpacity(0.85),
        );
    }
  }

  time(){
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        gameTime++;
        if(widget.challenge == 1){
          if(gameTime >=  20){
            setState(() {
              timer.cancel();
              allow = false;
              showWinDialog("Time is over");
            });
          }
        }else if(widget.challenge == 3){
          if(gameTime >=  28){
            setState(() {
              timer.cancel();
              allow = false;
              showWinDialog("Time is over");
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
            title: Text("challenge ${widget.challenge}",
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
                      child: Text( widget.challenge == 1 ?
                      "${20 - gameTime} " :
                      widget.challenge == 2 ?
                      "${38 - numberOfTurns} " :
                      widget.challenge == 3 ?
                      "${38 - numberOfTurns} turns &\n"
                          "${28 - gameTime} sec left" : "",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        widget.challenge == 1 ?
                        "sec left" :
                        widget.challenge == 2 ?
                        "turns left" :"",
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
                        widget.challenge == 1 ?
                        "Complete this level under 20 sec" :
                        widget.challenge == 2 ?
                        "Complete this level under 38 turns" :
                        widget.challenge == 3 ?
                        "complete the level in\n"
                            "    36 turns & 26 sec" : "",
                        style: TextStyle(
                          fontSize: 21,
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
                      crossAxisCount: 4,
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
                              if(Data.showAds == true){
                                _ad.load();
                              }
                              if(widget.challenge != 2){
                                time();
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
                          child: Center(
                            child: b.contains(a[index]) ?
                            Image.asset("asset/images/${a[index]}.png",
                              fit: BoxFit.contain,
                              width: 65,
                            ) :
                            number(index),
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
      if(widget.challenge == 1){
        setState(() {
          timer.cancel();
          Data.challenge_1 = true;
          setHighScore();
          showWinDialog("Challenge completed in \n "
              "        $gameTime seconds");
        });
      }else if(widget.challenge == 2){
        setState(() {
          Data.challenge_2 = true;
          setHighScore();
          showWinDialog("Challenge completed in \n "
              "             $numberOfTurns turns");
        });
      }else if(widget.challenge == 3){
        setState(() {
          timer.cancel();
          Data.challenge_3 = true;
          setHighScore();
          showWinDialog("Challenge completed in \n "
              "     $numberOfTurns turns & $gameTime sec");
        });
      }
    }

    if(numberOfTurns >= 36){
      if(widget.challenge == 3){
        setState(() {
          allow = false;
          showWinDialog("Turns are over");
        });
      }else if(widget.challenge == 2){
        if(numberOfTurns >= 38){
          setState(() {
            allow = false;
            showWinDialog("Turns are over");
          });
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
      allow = true;
      b = [];
      first();
      if(gameTime > 0){
        if(timer.isActive == true){
          timer.cancel();
        }
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
                  MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.red,
                    minWidth: 120,
                    height: 50,
                    onPressed: (){
                      if(Data.showAds == true){
                        showReAds();
                        loadReAds();
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
                  ),
                ],
              ),
            ],
          );
        }
    );
  }
}
