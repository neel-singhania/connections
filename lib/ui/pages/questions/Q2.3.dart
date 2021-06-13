import 'dart:async';
import 'dart:io';
import 'package:flutter/rendering.dart';
import 'package:connections_inc/ui/pages/questions/Q2.4.dart';
import 'package:flutter/material.dart';

class Design3 extends StatefulWidget {
  final double intro,extro,uptight,easy,practical,emotional;
  String fname,lname,gender,interest;
  DateTime age;
  File avatar;

  Design3({Key key,@required this.easy,@required this.emotional,@required this.extro, @required this.intro, @required this.practical,
    @required this.uptight,@required this.interest,@required this.gender,@required this.age,@required this.lname,@required this.fname,@required this.avatar}):super(key:key);

  @override
  _Design3State createState() => _Design3State(intro,emotional,easy,extro,uptight,practical,avatar,fname,lname,age,gender,interest);
}

class _Design3State extends State<Design3> with TickerProviderStateMixin{
  String fname,lname,gender,interest;
  DateTime age;
  File avatar;
  double intro,extro,uptight,easy,practical,emotional;
  _Design3State(this.intro,this.emotional,this.easy,this.extro,this.uptight,
      this.practical, this.avatar,this.fname,this.lname,this.age,this.gender,this.interest);
  double flag1,flag2;
  var height = 2.0;
  var width = 2.0;
  bool isSelected = false;
  bool isSelected2 = false;


  @override
  void initState(){
    super.initState();
    Timer(Duration(microseconds: 100), () =>  setState(() {
      height = MediaQuery.of(context).size.height*.4;
      width = MediaQuery.of(context).size.width*.4;
    }));

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String ques = "While going through a toll plaza, a driver changes lane immediately and cuts you up. What do you do?";
    String ans1 = "1.	 Don't think about it for a second and let them pass safely.";
    String ans2 = "2.	 Honk continuously and register with them that what they did was wrong.";
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children :<Widget> [
                AnimatedSize(
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    height: size.height*10.0/780.0,
                    width: width,
                    color: Colors.amber,
                  ),
                  vsync: this,
                  duration: new Duration(milliseconds: 3000),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSize(
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        height: height,
                        width: size.width*10.0/360.0,
                        color: Colors.amber,
                      ),
                      vsync: this,
                      duration: new Duration(milliseconds: 3000),
                    ),
                    Container(
                      height: size.height*728.0/780.0,
                      width: size.width*340.0/360.0,
                    ),
                    AnimatedSize(
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        height: height,
                        width: size.width*10.0/360.0,
                        color: Colors.amber,
                      ),
                      vsync: this,
                      duration: new Duration(milliseconds: 3000),
                    ),

                  ],
                ),
                AnimatedSize(
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    height: size.height*10.0/780.0,
                    width: width,
                    color: Colors.amber,
                  ),
                  vsync: this,
                  duration: new Duration(milliseconds: 3000),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.all(7.0),
              padding: EdgeInsets.only(top: size.height*30.0/780.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9.0),
              ),

              child: Stack(
                children: <Widget>[
                  Container(
                    //margin: EdgeInsets.all(7.0),
                    padding: EdgeInsets.fromLTRB(size.width*20.0/360.0, size.height*40.0/780.0, 0.0, 0.0),
                    child: Text(
                      "Q",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 45.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.all(7.0),
                    padding: EdgeInsets.fromLTRB(size.width*70.0/360.0, size.height*60.0/780.0, 0.0, 0.0),
                    child: Text(
                      "3",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber
                      ),
                    ),
                  ),
                  Container(
                    //margin: EdgeInsets.all(7.0),
                    padding: EdgeInsets.fromLTRB(size.width*89.0/360.0, size.height*65.0/780.0, 0.0, 0.0),
                    child: Text(
                      "/5",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25.0,
//                          fontWeight: FontWeight.bold,
//                          color: Colors.amber
                      ),
                    ),
                  ),
                  Column(
                    children:[
                      Container(
                        //margin: EdgeInsets.all(7.0),
                        padding: EdgeInsets.fromLTRB(size.width*25.0/360.0, size.height*135.0/780.0, size.width*20.0/360.0, 0.0),
                        child: Text(
                          ques,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 20.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.amber
                          ),
                        ),
                      ),
                      SizedBox(height: size.height*70.0/780.0,),
                      Divider(
                        height: size.height*20.0/780.0,
                        color: Colors.grey,
                        thickness: 1.0,
                        indent: 55.0,
                        endIndent: 60.0,

                      ),
                      SizedBox(height: size.height*60.0/780.0,),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            flag1 = 1;
                            flag2 = 0;
                            isSelected = !isSelected;
                            isSelected2 = false;
                            height = isSelected?size.height*.6:size.height*.4;
                            width = isSelected?size.width*.6:size.width*.4;

                          });
                        },
                        child: Container(
                          //margin: EdgeInsets.all(7.0),
                          margin: EdgeInsets.fromLTRB(size.width*20.0/360.0, .0, size.width*15/360.0, 0.0),
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isSelected?Colors.amber:Colors.transparent,
                              border: Border.all(
                                  color: isSelected?Colors.white:Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0
                              )
                          ),
                          child: Text(
                            ans1,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              color: isSelected?Colors.white:Colors.black,
                              fontWeight:isSelected? FontWeight.bold: FontWeight.normal,

//                    fontWeight: FontWeight.bold,
//                    color: Colors.amber
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: size.height*10.0/780.0,),

                      GestureDetector(
                        onTap: (){
                          setState(() {
                            flag2 = 1;
                            flag1 = 0;
                            isSelected2 = !isSelected2;
                            isSelected = false;
                            height = isSelected2?size.height*.6:size.height*.4;
                            width = isSelected2?size.width*.6:size.width*.4;

                          });
                        },
                        child: Container(
                          //margin: EdgeInsets.all(7.0),
                          margin: EdgeInsets.fromLTRB(size.width*20.0/360.0, .0, size.width*15/360.0, 0.0),
                          padding: EdgeInsets.all(7.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: isSelected2?Colors.amber:Colors.transparent,
                              border: Border.all(
                                  color: isSelected2?Colors.white:Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0
                              )
                          ),
                          child: Text(
                            ans2,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15.0,
                              color: isSelected2?Colors.white:Colors.black,
                              fontWeight:isSelected2? FontWeight.bold: FontWeight.normal,

//                    fontWeight: FontWeight.bold,
//                    color: Colors.amber
                            ),
                          ),
                        ),
                      )

                    ],
                  ),

                ],
              ),
            ),
            GestureDetector(
                onTap: (){
                  if(flag1==1)
                    easy++;
                  else
                    uptight++;
                  if(flag1 == 1 || flag2 == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          Design4(intro: intro,
                            extro: extro,
                            emotional: emotional,
                            easy: easy,
                            uptight: uptight,
                            practical: practical,
                            avatar: avatar,fname: fname,lname: lname,age: age,gender: gender,interest: interest,)));
                }},
                child: Container(

                  margin: EdgeInsets.fromLTRB(size.width*20.0/360.0,
                      size.height*635.0/780.0,
                      size.width*20.0/360.0,
                      0.0),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20.0)
                  ),
                  alignment: Alignment.center,
                  height: size.height*40.0/780.0,
                  width: size.width,
                  child: Text(
                    "Next",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}