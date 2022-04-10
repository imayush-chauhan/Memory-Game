import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:memory/data/data.dart';
import 'package:memory/screen/high%20score.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'help.dart';
import 'home screen.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {

  bool isLoaded = false;

  @override
  void initState() {
    super.initState();
    if(Data.showAds == true){
      bannerAds();
    }
  }

  BannerAd _ad;

  bannerAds(){
    _ad = BannerAd(
      adUnitId: "ca-app-pub-3028010056599796/1626317951",
      size: AdSize.mediumRectangle,
      request: AdRequest(
        keywords: ["amazon", "games", "land", "collage","toys","learn","coding","food"],
      ),
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
    _ad.load();
  }

  checkForAd(){
    if(isLoaded == true){
      return Container(
        child: Center(
          child: AdWidget(
            ad: _ad,
          ),
        ),
        height: 250,
        width: 320,
        alignment: Alignment.center,
      );
    }else{
      return Container(
        height: 250,
        width: 320,
      );
    }
  }

  musicStop() async{
    SharedPreferences myPrefs = await SharedPreferences.getInstance();
    myPrefs.setBool("play", Data.neverPlay);
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
                            value: Data.neverPlay == false ? true : false,
                            onChanged: (value){
                              setState(() {
                                if(Data.neverPlay == false){
                                  setState(() {
                                    audioPlayer.pause();
                                    Data.neverPlay = true;
                                    musicStop();
                                  });
                                }else{
                                  setState(() {
                                    audioPlayer.resume();
                                    Data.neverPlay = false;
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
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HighScore();
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
                        child: Text("High Score",
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
              SizedBox(height: 15,),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width*0.9,
                color: Colors.transparent,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 10,
                  child: Center(
                    child: Text("    If Ads are bothering try playing\n"
                        " without internet. Subscription will\n"
                        "        be added soon. Thank you",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffDD2A7B),
                      ),),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              checkForAd(),
            ],
          ),
        ),
      ),
    );
  }
}
