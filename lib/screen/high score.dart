import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/memoryGame.dart';

class HighScore extends StatefulWidget {
  @override
  _HighScoreState createState() => _HighScoreState();
}

class _HighScoreState extends State<HighScore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
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
          title: Text("High Score",
          style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w600,
          ),),
          leading: IconButton(
            color: Colors.white,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height*0.21,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    color: Color(0xffDD2A7B),
                    child: Stack(
                      children: [
                        Positioned(
                          top: 20,
                            left: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pokemon",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),),
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text("${Data.highScoreInPokemon} turns in ${Data.timeInPokemon}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                        ),
                        Positioned(
                          top: -35,
                            right: -30,
                            child: CircleAvatar(
                              radius: 90,
                              backgroundColor: Colors.white.withOpacity(0.12),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundColor: Colors.white.withOpacity(0.2),
                                child: CircleAvatar(
                                  radius: 52,
                                  backgroundColor: Colors.white.withOpacity(0.18),
                                  child: CircleAvatar(
                                    radius: 40,
                                    child: Image.asset("asset/images/3.png",
                                    width: 65,),
                                    backgroundColor: Color(0xffDD2A7B),
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                height: MediaQuery.of(context).size.height*0.21,
                width: MediaQuery.of(context).size.width*0.85,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  color: Color(0xffDD2A7B),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Emoji",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text("${Data.highScoreInEmoji} turns in ${Data.timeInEmoji}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -35,
                        right: -30,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white.withOpacity(0.12),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.white.withOpacity(0.18),
                              child: CircleAvatar(
                                radius: 40,
                                child: Text("😃",
                                style: TextStyle(
                                  fontSize: 45,
                                ),),
                                backgroundColor: Color(0xffDD2A7B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height*0.21,
                width: MediaQuery.of(context).size.width*0.85,
                color: Colors.transparent,
                child: Card(
                  margin: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 10,
                  color: Color(0xffDD2A7B),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 12,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Number",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text("${Data.highScoreInNumber} turns in ${Data.timeInNumber}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 21,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -35,
                        right: -30,
                        child: CircleAvatar(
                          radius: 90,
                          backgroundColor: Colors.white.withOpacity(0.12),
                          child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white.withOpacity(0.2),
                            child: CircleAvatar(
                              radius: 52,
                              backgroundColor: Colors.white.withOpacity(0.18),
                              child: CircleAvatar(
                                radius: 40,
                                child: Text("7",
                                style: TextStyle(
                                  fontSize: 45,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600
                                ),),
                                backgroundColor: Color(0xffDD2A7B),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                    return Memory();
                  }));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width*0.9,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xffDD2A7B),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text("Play",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 25
                    ),),
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
