
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:math_puzzle/winer.dart';
import 'package:shared_preferences/shared_preferences.dart';


class con extends StatefulWidget {
  int lev;
  con([this.lev=-1]);
  @override
  State<con> createState() => _conState();
}

class _conState extends State<con> {
  String s="";
  // int ans=0;
  int mainLevel=1;

  List ans1=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
  List prin=["1","2","3","4","5","6","7","8","9","0"];
  bool c1=false;
  bool c2=false;
  bool c3=false;
  bool c4=false;
  bool c5=false;
  bool c6=false;
  bool c7=false;
  bool c8=false;
  bool c9=false;
  bool c10=false;
  bool sub=false;
  SharedPreferences? pref;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();

  }
  getData()async{
    if(widget.lev!=-1)
    {
      mainLevel=widget.lev;
    }
    else
    {
      pref=await SharedPreferences.getInstance();
      mainLevel=pref!.getInt("level")??0;
      print("cal=${mainLevel}");

    }


    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("image/gameplaybackground.jpg"))),
        child: Column(children: [
          Expanded(
              child: Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(onTap: () {
                        if(pref!.getString("skip_time")!=null)
                        {
                          DateTime dt=DateTime.now();
                          String past_time=pref!.getString("skip_time")??"";
                          DateTime dt1=DateTime.parse(past_time);
                          int sec=dt.difference(dt1).inSeconds;
                          if(sec>=30)
                          {
                            String skip_time=DateTime.now().toString();
                            pref!.setString("skip_time", skip_time);
                            print(skip_time);
                            pref!.setString("level_status$mainLevel", "skip");
                            setState(() {
                              mainLevel++;
                            });
                            pref!.setInt("levelno", mainLevel);
                          }
                          else
                          {
                            showDialog(context: context, builder:(context) {
                              return AlertDialog(title: Text("you can skip after 30 secound"),actions: [
                                TextButton(onPressed: () {
                                  Navigator.pop(context);
                                }, child: Text("ok"))
                              ],);
                            },);
                          }
                        }
                        else
                        {
                          String skip_time=DateTime.now().toString();
                          pref!.setString("skip_time", skip_time);
                          print(skip_time);
                          pref!.setString("level_status$mainLevel", "skip");
                          setState(() {
                            mainLevel++;
                          });
                          pref!.setInt("levelno", mainLevel);
                        }
                      },
                          child: Container(height: 73,width: 73,decoration: BoxDecoration(image: DecorationImage(image: AssetImage( "image/play.png"))),)
                      ),
                      InkWell(
                          child: Container(alignment: Alignment.center,child: Text("Puzzle  ${mainLevel+1}",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "font1",color: Colors.white,fontSize: 22),),height: 110,width: 170,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/level_board.png"))),)
                      ),
                      InkWell(onTap: () {
                        showDialog(context: context, builder: (context) {
                          return AlertDialog(title: Text("Hint",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),actions: [TextButton(onPressed:() {
                            Navigator.pop(context);
                          }, child: Text("OK",style: TextStyle(color: Colors.red),))],content:Text("Apply BODMAS",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),);
                        },);
                      },
                          child:Container(height: 55,width: 55,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("image/hint.png"))),)
                      ),
                    ]),
              )),
          Expanded(
              flex: 7,
              child: Container(
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("image/p${mainLevel+1}.png"))),
              )),
          Spacer(),
          Expanded(flex: 2,
              child: Container(
                child: Column(children: [
                  Expanded(
                      child: Container(
                        color: Colors.black,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
                          Expanded(
                            child: Container(alignment: Alignment.centerLeft,child: Text("$s",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                              margin: EdgeInsets.fromLTRB(10, 10, 0,10),
                              height: 100,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white),
                            ),
                          ),
                          InkWell(onTap: () {
                            setState(() {
                              if(s.length>0)
                              {
                                s=s.substring(0,s.length-1);
                              }
                            });
                          },child: Image(image: AssetImage("image/delete.png")),),
                          GestureDetector(onTapUp: (details) {
                            setState(() {
                              sub=false;
                            });
                          },onTapDown: (details) {
                            setState(() {
                              sub=true;
                            });
                          },onTapCancel: () {
                            setState(() {
                              sub=false;
                            });
                          },
                            child: TextButton(onPressed: () {
                              int a=int.parse(s);
                              if(ans1[mainLevel]==a)
                              { mainLevel++;
                              pref!.setInt("level", mainLevel);
                              pref!.setString("l$mainLevel", "yes");
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                return win(mainLevel);
                              },));
                              }
                              else
                              {

                                Fluttertoast.showToast(
                                    msg: "Wrong Ans",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.white,
                                    textColor: Colors.black,
                                    fontSize: 16.0
                                );

                              }
                            }, child:(sub==true) ?Text("SUBMIT",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,color: Colors.green),):Text("SUBMIT",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,color: Colors.white),)),
                          )
                        ]),
                      )),
                  Expanded (
                      child: Container(
                        //   child: GridView.builder(itemCount: prin.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10,mainAxisSpacing: 4,crossAxisSpacing: 4), itemBuilder: (context, index) {
                        //   return Expanded(child: InkWell(onTap: () => fun("${prin[index]}"),child: Container(alignment: Alignment.center,height: double.infinity,child: Text("${prin[index]}",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),),));
                        // },),
                        child: Row(children: [
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c1=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c1=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c1=false;
                              });
                            },child: InkWell(onTap: () => fun("1"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c1==true)? Text("1",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("1",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c1==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c2=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c2=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c2=false;
                              });
                            },child: InkWell(onTap: () => fun("2"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c2==true)? Text("2",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("2",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color:(c2==true)? Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c3=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c3=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c3=false;
                              });
                            },child: InkWell(onTap: () => fun("3"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child:(c3==true)? Text("3",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("3",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color:(c3==true)? Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c4=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c4=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c4=false;
                              });
                            },child: InkWell(onTap: () => fun("4"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child:(c4==true)?Text("4",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("4",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color:(c4==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c5=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c5=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c5=false;
                              });
                            },child: InkWell(onTap: () => fun("5"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c5==true)? Text("5",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("5",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color:(c5==true)?Colors.white: Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c6=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c6=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c6=false;
                              });
                            },child: InkWell(onTap: () => fun("6"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child:  (c6==true)? Text("6",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("6",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c6==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: (c6==true)? Border.all(color: Colors.black):Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c7=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c7=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c7=false;
                              });
                            },child: InkWell(onTap: () => fun("7"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c7==true)? Text("7",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("7",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c7==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border:(c7==true)? Border.all(color: Colors.black):Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c8=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c8=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c8=false;
                              });
                            },child: InkWell(onTap: () => fun("8"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child:(c8==true)?Text("8",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("8",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c8==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: (c8==true)?Border.all(color: Colors.black):Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c9=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c9=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c9=false;
                              });
                            },child: InkWell(onTap: () => fun("9"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c9==true)?Text("9",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("9",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c9==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border: (c9==true)?Border.all(color: Colors.black):Border.all(color: Colors.white)),))),
                          ),
                          Expanded(
                            child: GestureDetector(onTapUp: (details) {
                              setState(() {
                                c10=false;
                              });
                            },onTapDown: (details) {
                              setState(() {
                                c10=true;
                              });
                            },onTapCancel:() {
                              setState(() {
                                c10=false;
                              });
                            },child: InkWell(onTap: () => fun("0"),child: Container(alignment: Alignment.center,height: double.infinity,margin: EdgeInsets.all(4),child: (c10==true)?Text("0",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),):Text("0",style: TextStyle(color: Colors.white),),decoration: BoxDecoration(color: (c10==true)?Colors.white:Color(0xFF2C2A2A),borderRadius: BorderRadius.circular(5),border:(c10==true)?Border.all(color: Colors.black):Border.all(color: Colors.white)),))),
                          ),
                        ]),
                        color: Colors.black,
                      )),
                ]),
              ))
        ]),
      )),
    );
  }
  fun(String a)
  {
    setState(() {
      s=s+a;
    });
  }

}

