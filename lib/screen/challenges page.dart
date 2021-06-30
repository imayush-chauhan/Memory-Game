import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/Challenges%20level.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChooseChallenges extends StatefulWidget {
  @override
  _ChooseChallengesState createState() => _ChooseChallengesState();
}

class _ChooseChallengesState extends State<ChooseChallenges> {

  @override
  void initState() {
    super.initState();
    getHighScore();
  }

  getHighScore() async {
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    if(myPrefs.getBool("c1") != null) {
      setState(() {
        Data.challenge_1 = myPrefs.getBool("c1");
      });
    }
    if(myPrefs.getBool("c2") != null) {
      setState(() {
        Data.challenge_2 = myPrefs.getBool("c2");
      });
    }
    if(myPrefs.getBool("c3") != null) {
      setState(() {
        Data.challenge_3 = myPrefs.getBool("c3");
      });
    }
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
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Challenges",
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
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChallengesLevel(challenge: 1,);
                  },));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.21,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    color: Data.challenge_1 == false ?
                    Color(0xffDD2A7B) : Colors.green,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 18,
                          left: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Challenges ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "१",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("complete the level\n"
                                    "in given time",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
                                  child: Text("20",
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  backgroundColor: Data.challenge_1 == false ?
                                  Color(0xffDD2A7B) : Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChallengesLevel(challenge: 2,);
                  },));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.21,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    color: Data.challenge_2 == false ?
                    Color(0xffDD2A7B) : Colors.green,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 18,
                          left: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Challenges ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "२",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("complete the level\n"
                                    "in given turns",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
                                  child: Text("38",
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  backgroundColor: Data.challenge_2 == false ?
                                  Color(0xffDD2A7B) : Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChallengesLevel(challenge: 3,);
                  },));
                },
                child: Container(
                  height: MediaQuery.of(context).size.height*0.21,
                  width: MediaQuery.of(context).size.width*0.85,
                  color: Colors.transparent,
                  child: Card(
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    elevation: 10,
                    color: Data.challenge_3 == false ?
                    Color(0xffDD2A7B) : Colors.green,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 18,
                          left: 12,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: "Challenges ",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "३",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 26,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text("complete the level\n"
                                    "in given time &\n"
                                    "turn",
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
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
                                  child: Text("36",
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600
                                    ),),
                                  backgroundColor: Data.challenge_3 == false ?
                                  Color(0xffDD2A7B) : Colors.green,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
