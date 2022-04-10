import 'dart:math';

import 'package:flutter/material.dart';

class BrainJam extends StatefulWidget {
  @override
  _BrainJamState createState() => _BrainJamState();
}

class _BrainJamState extends State<BrainJam> {
  
  int inx = -1;
  int tap = -1;
  
  List n = [];

  bool play = false;

  List ans = [];
  
  // @override
  // void initState() {
  //   super.initState();
  //   // put();
  // }
  
  put(){
    setState(() {
      n = [];
      ans = [];
    });
    for(int i = 0; i < 5; i++){
      setState(() {
        n.add(Random().nextInt(20));
      });
    }
    print(n);
    show(0);
  }

  show(int i){
   if(i <= 4){
     Future.delayed(const Duration(milliseconds: 400), () {
       setState(() {
         inx = n[i];
       });
       print(inx);
       // show(i+1);
     }).then((value) {
       Future.delayed(const Duration(milliseconds: 400), () {
         setState(() {
           inx = -1;
         });
         show(i+1);
       });
     });
   }else{
     Future.delayed(const Duration(milliseconds: 300), () {
       setState(() {
         inx = -1;
         play = true;
         print("ans");
       });
     });
   }
  }

  check(){
    for(int i = 0; i < 5; i++){
      if(n[i] != ans[i]){
        print("Try Again");
        showWinDialog("Try Again");
        break;
      }else if(i == 4){
        showWinDialog("Congrats");
        print("Congrats");
      }
    }
    setState(() {
      play = false;
    });
    print("n: $n");
    print("ans; $ans");
  }


  @override
  Widget build(BuildContext context) {
    double mediaQH = MediaQuery.of(context).size.height;
    double mediaQW = MediaQuery.of(context).size.width;
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
          centerTitle: true,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: (){
              Navigator.of(context).pop();
            },
          ),
          title: Text("Level 1",
            style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w600
            ),
          ),
          elevation: 0,
        ),
        body: Container(
          height: mediaQH,
          width: mediaQW,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(mediaQW*0.025),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.all(4.0),
                      child: GestureDetector(
                        onTap: (){
                          if(play == true){
                            setState(() {
                              ans.add(index);
                              print(index);
                              if(ans.length == 5){
                                check();
                              }
                            });
                          }
                        },

                        onTapDown: (_){
                          if(play == true){
                            setState(() {
                              tap = index;
                            });
                          }
                        },

                        onTapUp: (_){
                          if(play == true){
                            setState(() {
                              tap = -1;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: inx != index ?
                            tap != index ?
                            Colors.white : Colors.blue : Colors.red,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // child: Center(child: Text(index.toString())),
                        ),
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: (){
                  put();
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
                      child: Text("Start",
                        style: TextStyle(
                          color: Color(0xffDD2A7B),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
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

  showWinDialog(String yo) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text(
                  yo,
                )),
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            actions: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "cancel",
                        style: TextStyle(
                          fontSize: 21,
                          color: Color(0xff151515),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.14,
                  ),
                  MaterialButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.red,
                    minWidth: 120,
                    height: 50,
                    onPressed: () {
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
        });
  }

}
