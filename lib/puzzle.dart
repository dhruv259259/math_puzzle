import 'package:flutter/material.dart';
import 'package:math_puzzle/continue.dart';
import 'package:shared_preferences/shared_preferences.dart';

class leval extends StatefulWidget {
  @override
  State<leval> createState() => _levalState();
}

class _levalState extends State<leval> {
  List num=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30];
  SharedPreferences? pref;
  List<String?> level=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  getdata()async{
    pref=await SharedPreferences.getInstance();

    for(int i=0;i<=29;i++)
    {
      String? t=pref!.getString("l${i+1}");

      if(t=="yes") {
        level.add(t);
      }
      else
      {
        level.add("no");
      }
      print("t=$t");
    }
    print(level);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
          future:getdata()
          ,builder: (context, snapshot) {
          if(snapshot.connectionState==ConnectionState.done){
            return Container(decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/wood.webp"))),
              child: Column(
                children: [
                  Text("Select Puzzle",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 40,fontStyle: FontStyle.italic),),

                  Expanded(
                    child: Container(
                      child: GridView.builder(
                        itemCount: 30,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing:10),
                        itemBuilder: (context, index) {
                          return (level[index]=="yes")?complete(index):(level[index]=="no")?lock():blank(index);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          else
          {
            return Center(child: CircularProgressIndicator());
          }
        },)
    );
  }

  complete(int index)
  {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return con(index);
        },));
      },
      child: Container(alignment: Alignment.center,
        child: Text("${num[index]}",style: TextStyle(color: Colors.white,fontFamily: "font1",fontSize: 50,fontWeight: FontWeight.bold),),
        height: 20,
        width: 20,
        decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/tick.png")),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white,)),
      ),
    );
  }
  lock()
  {
    return Container(alignment: Alignment.center,
      // child: Text("${num[index]}",style: TextStyle(color: Colors.white,fontFamily: "font1",fontSize: 50,fontWeight: FontWeight.bold),),
      height: 20,
      width: 20,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("image/lock.png")),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,)),
    );
  }
  blank(int index)
  {
    return Container(alignment: Alignment.center,
      child: Text("${num[index]}",style: TextStyle(color: Colors.white,fontFamily: "font1",fontSize: 50,fontWeight: FontWeight.bold),),
      height: 20,
      width: 20,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white,)),
    );
  }
}
