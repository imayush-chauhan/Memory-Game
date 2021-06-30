import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/level.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Challenges extends StatefulWidget {
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool choose = false;
  bool pokeSlide = false;
  int title = 0;
  Timer timer;

  int poke1 = 3;
  int poke2 = 1;

  @override
  void initState() {
    super.initState();
    getPlayerLevel();
    timer = Timer.periodic(
        Duration(milliseconds: 1400), (timer) {
      setState(() {
        pokeSlide = !pokeSlide;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  getPlayerLevel() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(myPrefs.getInt("pl") != null) {
      setState(() {
        Data.playerLevel = myPrefs.getInt("pl");
      });
    }
  }

  snackBar(String s){
    // ignore: deprecated_member_use
    _scaffoldKey.currentState.hideCurrentSnackBar();
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
  Widget build(BuildContext context) {
    return Container(
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
        key: _scaffoldKey,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text("Levels",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Levels(
                          level: 1,
                          open: 1,
                        );
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 1",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 2){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 2,
                            open: 3,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 2 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 2",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                            child: Icon(
                              Icons.lock_outline,
                              color: Colors.white.withOpacity(0.8),
                              size: 27,
                            ),
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 3){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 3,
                            open: 1,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 3 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 3",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 4){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 4,
                            open: 2,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 4 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 4",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 5){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 5,
                            open: 3,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 5 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 5",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 6){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 6,
                            open: 2,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 6 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 6",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 7){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 7,
                            open: 3,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 7 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 7",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 8){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 8,
                            open: 1,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 8 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 8",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 9){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 9,
                            open: 2,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 9 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 9",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 10){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 10,
                            open: 4,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 10 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 10",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 11){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 11,
                            open: 1,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 11 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 11",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 12){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 12,
                            open: 3,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 12 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 12",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 13){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 13,
                            open: 2,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 13 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 13",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 14){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 14,
                            open: 1,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 14 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 14",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      if(Data.playerLevel >= 15){
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return Levels(
                            level: 15,
                            open: 4,
                          );
                        },));
                      }else{
                        snackBar("Complete level ${Data.playerLevel} to unlock this level");
                      }
                    },
                    child: Container(
                      height: 70,
                      width: 120,
                      child: Data.playerLevel >= 15 ?
                      Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Level 15",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 19,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ) : Card(
                          color: Color(0xff171717),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          elevation: 10,
                          child: Center(
                              child: Icon(
                                Icons.lock_outline,
                                color: Colors.white.withOpacity(0.8),
                                size: 27,
                              )
                          )
                      ),
                    ),
                  ),
                ],
              ),
              // GestureDetector(
              //   onTap: (){
              //     Navigator.push(context, MaterialPageRoute(builder: (context) {
              //       return ChooseChallenges();
              //     },));
              //     // snackBar("challenges will be added soon");
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width*0.8,
              //     height: 80,
              //     child: Card(
              //       elevation: 10,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(20),
              //       ),
              //       child: Center(
              //         child: Text("Challenges",
              //           style: TextStyle(
              //               color: Color(0xffDD2A7B),
              //               fontSize: 20,
              //               fontWeight: FontWeight.w600
              //           ),),
              //       ),
              //     ),
              //   ),
              // ),
              AnimatedContainer(
                duration: Duration(milliseconds: 1400),
                curve: Curves.easeInOut,
                color: Colors.transparent,
                height: 100,
                width: pokeSlide == false ?
                MediaQuery.of(context).size.width :
                MediaQuery.of(context).size.width*0.95,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails details){
                          setState(() {
                            if(poke1 == 10){
                              poke1 = 1;
                            }else{
                              poke1++;
                            }
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          color: Colors.transparent,
                          child: Card(
                            color: Colors.white,
                            elevation: 8,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                right: 35,
                                top: 10,
                                bottom: 10,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                child: Image.asset("asset/images/$poke1.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: GestureDetector(
                        onHorizontalDragEnd: (DragEndDetails details){
                          setState(() {
                            if(poke2 == 10){
                              poke2 = 1;
                            }else{
                              poke2++;
                            }
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 150,
                          color: Colors.transparent,
                          child: Card(
                            color: Colors.white,
                            elevation: 8,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                bottomLeft: Radius.circular(50),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 35,
                                top: 10,
                                bottom: 10,
                              ),
                              child: CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.transparent,
                                child: Image.asset("asset/images/$poke2.png"),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
