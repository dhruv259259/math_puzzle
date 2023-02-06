
import 'package:flutter/material.dart';
import 'package:math_puzzle/continue.dart';
import 'package:math_puzzle/main.dart';

class win extends StatefulWidget {

  int level;
  win(this.level);
  @override
  State<win> createState() => _winState();
}

class _winState extends State<win> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fill, image: AssetImage("image/wood.webp"))),
      child: Column(children: [
        Container(margin: EdgeInsets.all(30),
          alignment: Alignment.center,
          child: Text("PUZZLE ${widget.level} COMPLETED", style: TextStyle(fontSize: 23,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Colors.white),),),
        SizedBox(height: 20),
        Image.asset("image/8-2-trophy-free-png-image.png",height: MediaQuery.of(context).size.height*0.3,),
        SizedBox(height: 20),
        InkWell(onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return con();
          },));
        },
          child: Container(margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
                gradient: LinearGradient(colors: [Color(0xFF6B6A6A),
                  Colors.white,
                  Color(0xFF6B6A6A)]),
              ),child: Text("CONTINUE", style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),)),),
        InkWell(onTap: () {
          Navigator.push(context,MaterialPageRoute(builder: (context) {
            return puzzle();
          },));
        },
          child: Container(margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
                  gradient: LinearGradient(
                      colors: [Color(0xFF6B6A6A),
                        Colors.white,
                        Color(0xFF6B6A6A)])),
              child: Text("MAIN MENU", style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),)
          ),),
        InkWell(onTap: () {

        },
          child: Container(margin: EdgeInsets.all(5),
              alignment: Alignment.center,
              height: 50,
              width: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(19),
                  gradient: LinearGradient(
                      colors: [Color(0xFF6B6A6A),
                        Colors.white,
                        Color(0xFF6B6A6A)])),
              child: Text("BUY PRO", style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),)
          ),),
        SizedBox(height: 20),
        Text("SHARE  THIS  PUZZLE", style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
        Container(margin: EdgeInsets.all(10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13),
                gradient: LinearGradient(
                    colors: [Colors.grey, Colors.white, Colors.grey])),
            child: Icon(
              Icons.share,
              color: Colors.black, size: 30,
            )
        ),
      ]),));
  }
}
