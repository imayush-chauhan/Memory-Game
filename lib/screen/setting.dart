import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:memory/data/data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'help.dart';
import 'home screen.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  musicStop() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool("play", Data.play);
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
          backgroundColor: Colors.transparent,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text("Settings",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),),
          elevation: 0,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width*0.9,
                  color: Colors.transparent,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Music",
                          style: TextStyle(
                            color: Color(0xffDD2A7B),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),),
                          Switch(
                            value: Data.play == true ? true : false,
                            onChanged: (value){
                              setState(() {
                                if(Data.play == true){
                                  setState(() {
                                    audioPlayer.pause();
                                    Data.play = false;
                                    musicStop();
                                  });
                                }else{
                                  setState(() {
                                    audioPlayer.resume();
                                    Data.play = true;
                                    musicStop();
                                  });
                                }
                              });
                            },
                            activeTrackColor: Color(0xffDD2A7B),
                            activeColor: Colors.white,
                            inactiveTrackColor: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return Help();
                    },));
                  },
                  child: Container(
                    color: Colors.transparent,
                    height: 60,
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      color: Colors.white,
                      child: Center(
                        child: Text("About us",
                          style: TextStyle(
                            color: Color(0xffDD2A7B),
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),),
                      ),
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
