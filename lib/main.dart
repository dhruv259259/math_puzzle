
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';

import 'package:math_puzzle/continue.dart';
import 'package:math_puzzle/puzzle.dart';


void main() {
  runApp(MaterialApp(
    home: puzzle(),
    debugShowCheckedModeBanner: false,
  ));
}

class puzzle extends StatefulWidget {
  const puzzle({Key? key}) : super(key: key);

  @override
  State<puzzle> createState() => _puzzleState();
}

class _puzzleState extends State<puzzle> {
  bool d=false;
  bool d1=false;
  bool d2=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage("image/wood.webp"))),
        child: Column(children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 30),
                alignment: Alignment.center,
                child: Text(
                  "Math Puzzle",
                  style: TextStyle(
                      fontSize: 50,

                      color: Color(0XFFF0E68C),
                      fontWeight: FontWeight.bold,
                      fontFamily: "font3",
                      fontStyle: FontStyle.italic),
                ),
              )),
          Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: AssetImage("image/bord.png"))),
                child: Container(
                  margin: EdgeInsets.only(top: 120),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center,children: [
                    GestureDetector(onTapUp: (details) {
                      setState(() {
                        d=false;
                      });
                    },onTapDown: (details) {
                      setState(() {
                        d=true;
                      });
                    },onTapCancel: () {
                      setState(() {
                        d=false;
                      });
                    },child:  InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return con();
                      },));
                    },
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: (d==true)?Border.all(width: 3,color: Colors.tealAccent,style: BorderStyle.solid):null),margin: EdgeInsets.all(10),
                        child: Text(
                          "CONTINUE",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "font1",
                              fontSize: 28,
                              color:  Color(0xFFF5DEB3)),
                        ),
                      ),
                    ),),
                    GestureDetector(onTapUp: (details) {
                      setState(() {
                        d1=false;
                      });
                    },onTapDown: (details) {
                      setState(() {
                        d1=true;
                      });
                    },onTapCancel: () {
                      setState(() {
                        d1=false;
                      });
                    },child:  InkWell(onTap: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) {
                        return leval();
                      },));
                    },
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: (d1==true)?Border.all(width: 3,color: Colors.tealAccent,style: BorderStyle.solid):null),margin: EdgeInsets.all(10),
                        child: Text(
                          "PUZZLES",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "font1",
                              fontSize: 30,
                              color:  Color(0xFFF5DEB3)),
                        ),
                      ),
                    ),),
                    GestureDetector(onTapUp: (details) {
                      setState(() {
                        d2=false;
                      });
                    },onTapDown: (details) {
                      setState(() {
                        d2=true;
                      });
                    },onTapCancel: () {
                      setState(() {
                        d2=false;
                      });
                    },child:  InkWell(onTap: () {
                      showDialog(barrierDismissible: true,context: context, builder:(context) {
                        return AlertDialog(shape: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),actions: [
                          InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child: Container(alignment: Alignment.center,margin: EdgeInsets.all(10),
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                    gradient: LinearGradient(
                                        colors: [Colors.grey, Colors.white, Colors.grey])),
                                child: Text("BUY",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
                            ),
                          ),
                          InkWell(onTap: () {
                            Navigator.pop(context);
                          },
                            child: Container(alignment: Alignment.center,margin: EdgeInsets.all(10),
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                                    gradient: LinearGradient(
                                        colors: [Colors.grey, Colors.white, Colors.grey])),
                                child: Text("NO,THANKS",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17))
                            ),
                          ),
                        ],title: Text("Benefits of pro version",style: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold),),);
                      },);
                    },
                      child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: (d2==true)?Border.all(width: 3,color: Colors.tealAccent,style: BorderStyle.solid):null),margin: EdgeInsets.all(10),
                        child: Text(
                          "BUY PRO",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "font1",
                              fontSize: 30,
                              color: Color(0xFFF5DEB3)),
                        ),
                      ),
                    ),)
                  ]),
                ),
              )),
          Expanded(
              child: Container(
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  InkWell(onTap: () async {
                    await FlutterShare.share(
                        title: 'Example share',
                        text: 'Math puzzle',
                        linkUrl: 'https://flutter.dev/',
                        chooserTitle: 'Example Chooser Title'
                    );
                  },
                    child: Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey])),
                        child:  Icon(
                          Icons.share,
                          color: Colors.black,size: 40,
                        )
                    ),
                  ),
                  Container(width: 10,),
                  Container(height: 50,width: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),gradient: LinearGradient(colors: [Colors.grey,Colors.white,Colors.grey])),
                      child:  Icon(
                        Icons.email_outlined,
                        color: Colors.black,size: 40,
                      )
                  ),
                ]),
              )),
          Expanded(child: Container(child: Row(mainAxisAlignment: MainAxisAlignment.end,children: [
            Container(alignment: Alignment.center,height: 40,width: 110,child: Text(textAlign: TextAlign.center,"Privacy Policy",style: TextStyle(color: Color(0XFFF0E68C),fontWeight: FontWeight.bold),),decoration: BoxDecoration(color: Colors.transparent,border: Border.all(color: Color(0XFFF0E68C))),)
          ]),))
        ]),
      ),
    );
  }
}
