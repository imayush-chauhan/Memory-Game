import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/challenges.dart';
import 'package:memory/screen/high%20score.dart';
import 'package:memory/screen/memoryGame.dart';
import 'package:memory/screen/setting.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'help.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

AudioPlayer audioPlayer = AudioPlayer();

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver{

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final fireStore = Firebase.initializeApp();

  bool change = false;
  Timer timer;

  bool newGame = false;
  bool challenges = false;
  bool highScore = false;

  @override
  void initState() {
    super.initState();
    getHighScore();
    WidgetsBinding.instance.addObserver(this);
    musicName();
    timer = Timer.periodic(
        Duration(
        milliseconds: 2700), (timer) {
      setState(() {
        if(Data.play == true){
          playAgain();
        }
        change = !change;
      });
    });
  }

  musicName() async{
    fireStore.then((value) async {
      FirebaseFirestore.instance.
      collection("memory").doc("1")
          .get().then((result){
        Data.music = result.get("music");
      });
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state){
    super.didChangeAppLifecycleState(state);
    switch(state){
      case AppLifecycleState.paused :
        setState(() {
          audioPlayer.pause();
          Data.play = false;
        });
        break;
      case AppLifecycleState.resumed :
        setState(() {
          audioPlayer.resume();
          Data.play = true;
        });
        break;
      case AppLifecycleState.inactive :
        setState(() {
          audioPlayer.pause();
          Data.play = false;
        });
        break;
      case AppLifecycleState.detached :
        setState(() {
          audioPlayer.pause();
          Data.play = false;
        });
        break;
    }
  }

  playAgain() async{
    await audioPlayer.play(Data.music == "" ?
    "https://firebasestorage.googleapis.com/v0/b/memory-game-3236c.appspot.com/o/ES_Gentle%20Melody%20-%20Megan%20Wofford.mp3?alt=media&token=987b1275-673c-4cb2-9919-ec088b2c662a":
    Data.music);
  }

  getHighScore() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();

    if(myPrefs.getInt("hp") != null && myPrefs.getInt("tp") != null) {
      setState(() {
        Data.highScoreInPokemon = myPrefs.getInt("hp");
        Data.timeInPokemon = myPrefs.getInt("tp");
      });
    }

    if(myPrefs.getInt("he") != null && myPrefs.getInt("te") != null) {
      setState(() {
        Data.highScoreInEmoji = myPrefs.getInt("he");
        Data.timeInEmoji = myPrefs.getInt("te");
      });
    }

    if(myPrefs.getInt("hn") != null && myPrefs.getInt("tn") != null) {
      setState(() {
        Data.highScoreInNumber = myPrefs.getInt("hn");
        Data.timeInNumber = myPrefs.getInt("tn");
      });
    }

    if(myPrefs.getBool("play") != null) {
      setState(() {
        Data.play = myPrefs.getBool("play");
      });
    }
  }

  rate() async{
    try{
      fireStore.then((value) async {
        FirebaseFirestore.instance.
        collection("memory").doc("1")
            .get().then((result){
          launch(result.get("stars"));
        });
      });
    }catch (e){
      snackBar("Something went wrong");
    }
  }

  Future<void> share() async {
    try{
      fireStore.then((value) async {
        FirebaseFirestore.instance.
        collection("memory").doc("1")
            .get().then((result){
          Share.share(result.get("share"));
        });
      });
    }catch (e){
      snackBar("Something went wrong");
    }
  }

  snackBar(String s){
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.showSnackBar(
        SnackBar(duration: Duration(milliseconds: 2000),backgroundColor: Colors.white,
            padding: EdgeInsets.only(left: 25),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: Text(s,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),),
            behavior: SnackBarBehavior.floating));
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: AnimatedContainer(
        duration: Duration(milliseconds: 2500),
        decoration: BoxDecoration(

            gradient: LinearGradient(

                begin: change == false ? Alignment.topRight: Alignment.topLeft,
                end: change == false ? Alignment.bottomLeft : Alignment.bottomRight,

                stops: [0,
                  change == false ? 0.4 : 0.6,
                  1],

                colors: [
                  Color(0xffFFCC70),
                  Color(0xffC850C0),
                  Color(0xff4158D0),
                ]
            )
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height*0.14,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width*0.75,
                    child: Card(
                      margin: EdgeInsets.all(0),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 10,
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText("Memory Game",
                                speed: Duration(milliseconds: 450),
                                textStyle: TextStyle(
                                  fontSize: 29,
                                  fontFamily: "Source",
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xffDD2A7B),
                                )),
                          ],
                          repeatForever: true,
                          isRepeatingAnimation: true,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.12,
                  ),
                  GestureDetector(
                    onTap: (){
                      setState((){
                        Data.level = 1;
                      });
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Memory();
                      },));
                    },

                    onTapDown: (value){
                      setState(() {
                        newGame = true;
                      });
                    },

                    onTapUp: (value){
                      setState(() {
                        newGame = false;
                      });
                    },

                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      height: newGame == false ? 70 : 65,
                      width: newGame == false ? 215 : 200,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(
                            child: Text("New Game",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Source",
                            fontWeight: FontWeight.w600,
                            color: Color(0xffDD2A7B),
                          ),)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Challenges();
                      },));
                    },

                    onTapDown: (value){
                      setState(() {
                        challenges = true;
                      });
                    },

                    onTapUp: (value){
                      setState(() {
                        challenges = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      height: challenges == false ? 70 : 65,
                      width: challenges == false ? 215 : 200,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(child: Text("Levels",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Source",
                            fontWeight: FontWeight.w600,
                            color: Color(0xffDD2A7B),
                          ),)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return HighScore();
                      },));
                    },

                    onTapDown: (value){
                      setState(() {
                        highScore = true;
                      });
                    },

                    onTapUp: (value){
                      setState(() {
                        highScore = false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      height: highScore == false ? 70 : 65,
                      width: highScore == false ? 215 : 200,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(
                            child: Text("High Score",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Source",
                                fontWeight: FontWeight.w600,
                                color: Color(0xffDD2A7B),
                              ),)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Data.play == false ?
                        Icons.play_circle_outline :
                    Icons.pause_circle_outline),
                    iconSize: 28,
                    color: Colors.white,
                    onPressed: (){
                      setState(() {
                        if(Data.play == true){
                          audioPlayer.pause();
                          Data.play = false;
                        }else{
                          audioPlayer.resume();
                          Data.play = true;
                        }
                      });
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.help),
                    iconSize: 26,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Help();
                      }));
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.star),
                    iconSize: 26,
                    color: Colors.white,
                    onPressed: (){
                      rate();
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.share),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: (){
                      share();
                    },
                  ),

                  IconButton(
                    icon: Icon(Icons.settings),
                    iconSize: 25,
                    color: Colors.white,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Setting();
                      },));
                    },
                  ),
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
