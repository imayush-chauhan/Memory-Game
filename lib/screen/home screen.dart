import 'dart:async';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/challenges.dart';
import 'package:memory/screen/high%20score.dart';
import 'package:memory/screen/memoryGame.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'help.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final fireStore = Firebase.initializeApp();

  bool change = false;
  Timer timer;

  @override
  void initState() {
    super.initState();
    getHighScore();
    timer = Timer.periodic(Duration(
        milliseconds: 2500), (timer) {
      setState(() {
        change = !change;
      });
    });
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
              // print(result.data());
          Share.text('Notes', result.get("share"), 'text/plain');
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
                        child: Text("Memory Games",
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: "Source",
                            fontWeight: FontWeight.w600,
                            color: Color(0xffDD2A7B),
                          ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width*0.12,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Memory();
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 215,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(child: Text("New Game",
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
                        return Challenges();
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 215,
                      child: Card(
                        margin: EdgeInsets.all(0),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 10,
                        child: Center(child: Text("Challenges",
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
                    child: Container(
                      height: 70,
                      width: 215,
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
                ],
              ),
            )
          ],
        ),

      ),
    );
  }
}
