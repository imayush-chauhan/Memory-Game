import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memory/screen/level.dart';

class Challenges extends StatefulWidget {
  @override
  _ChallengesState createState() => _ChallengesState();
}

class _ChallengesState extends State<Challenges> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool choose = false;
  int title = 0;

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
          title: Text("Challenges",
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
          height: MediaQuery.of(context).size.height*0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return Levels(
                          level: 1,
                          open: title,
                        );
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 140,
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
                                "3 X 4",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 20,
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return Levels(
                          level: 2,
                          open: title,
                        );
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 140,
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
                                "4 X 4",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
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
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return Levels(
                          level: 3,
                          open: title,
                        );
                      },));
                    },
                    child: Container(
                      height: 70,
                      width: 140,
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
                                "4 X 5",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 20,
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
                      snackBar("Game Mode coming soon");
                    },
                    child: Container(
                      height: 70,
                      width: 140,
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
                                "5 X 5",
                                style: TextStyle(
                                    color: Color(0xffDD2A7B),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    choose = true;
                  });
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 700),
                  width: choose == false ? MediaQuery.of(context).size.width*0.8 :
                  MediaQuery.of(context).size.width,
                  height: 80,
                  child: choose == false ?
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                      title == 1 ? "Pokemon" :
                      title == 2 ? "Emoji" :
                      title == 3 ? "Number" :
                      "Pokemon",
                      style: TextStyle(
                          color: Color(0xffDD2A7B),
                          fontSize: 21,
                          fontWeight: FontWeight.w600
                      ),),
                    ),
                  ) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            choose = false;
                            title = 1;
                          });
                        },
                        child: Container(
                          height: 65,
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
                                    "Pokemon",
                                    style: TextStyle(
                                        color: Color(0xffDD2A7B),
                                        fontSize: 17.5,
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
                          setState(() {
                            choose = false;
                            title = 2;
                          });
                        },
                        child: Container(
                          height: 65,
                          width: 110,
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
                                    "Emoji",
                                    style: TextStyle(
                                        color: Color(0xffDD2A7B),
                                        fontSize: 17.5,
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
                          setState(() {
                            choose = false;
                            title = 3;
                          });
                        },
                        child: Container(
                          height: 65,
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
                                    "Number",
                                    style: TextStyle(
                                        color: Color(0xffDD2A7B),
                                        fontSize: 17.5,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  snackBar("challenges will added soon");
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 80,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text("Challenges",
                        style: TextStyle(
                            color: Color(0xffDD2A7B),
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
