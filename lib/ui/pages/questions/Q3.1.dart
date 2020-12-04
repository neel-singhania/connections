import 'dart:async';
import 'dart:io';
import 'package:connections_inc/ui/pages/questions/Q3.2.dart';
import 'package:flutter/material.dart';

class Design extends StatefulWidget {
  final double intro,extro,uptight,easy,practical,emotional;
  String fname,lname,gender,interest;
  DateTime age;
  File avatar;

  Design({Key key,@required this.easy,@required this.emotional,@required this.extro, @required this.intro, @required this.practical,
    @required this.uptight,@required this.interest,@required this.gender,@required this.age,@required this.lname,@required this.fname,@required this.avatar}):super(key:key);

  @override
  _DesignState createState() => _DesignState(intro,emotional,easy,extro,uptight,practical,avatar,fname,lname,age,gender,interest);
}

class _DesignState extends State<Design> with TickerProviderStateMixin{
  String fname,lname,gender,interest;
  DateTime age;
  File avatar;
  double intro,extro,uptight,easy,practical,emotional;
  _DesignState(this.intro,this.emotional,this.easy,this.extro,this.uptight,
      this.practical, this.avatar,this.fname,this.lname,this.age,this.gender,this.interest);
  int flag1,flag2;
  var height1 = 2.0;
  var height = 2.0;
  var temp = 0.0;
  var width = 2.0;
  bool isSelected = false;
  bool isSelected2 = false;

  @override
  void initState(){
    super.initState();
    Timer(Duration(microseconds: 100), () =>  setState(() {

      height = MediaQuery.of(context).size.height*734/780.0;
      //width = MediaQuery.of(context).size.width*1;
    }));

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    String ques = "How do you decide whether to befriend a person or not?";
    String ans1 = "1.	You see how they feel about things and think about the world.";
    String ans2 = "2.	You see how they do things in reality, in life.";
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Column(mainAxisAlignment: MainAxisAlignment.center,
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
                  duration: new Duration(milliseconds: 2000),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSize(
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        height: height1,
                        width: size.width*10.0/360.0,
                        color: Colors.amber,
                      ),
                      vsync: this,
                      duration: new Duration(milliseconds: 2000),
                    ),
                    Container(
                      height: size.height*728.0/780.0,
                      width: size.width*340.0/360.0,
                    ),
                    AnimatedSize(
                      curve: Curves.fastOutSlowIn,
                      child: Container(
                        height: height1,
                        width: size.width*10.0/360.0,
                        color: Colors.amber,
                      ),
                      vsync: this,
                      duration: new Duration(milliseconds: 2000),
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
                  duration: new Duration(milliseconds: 2000),
                ),
              ],
            ),

            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedSize(

                    child: Container(
                      height: height,
                      alignment: Alignment.center,
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
                              "1",
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
                            padding: EdgeInsets.fromLTRB(size.width*85.0/360.0, size.height*65.0/780.0, 0.0, 0.0),
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
                                padding: EdgeInsets.fromLTRB(size.width*20.0/360.0, size.height*165.0/780.0, size.width*20.0/360.0, 0.0),
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
                              SizedBox(height: size.height*90.0/780.0,),
                              Divider(
                                height: size.height*20.0/780.0,
                                color: Colors.grey,
                                thickness: 1.0,
                                indent: 55.0,
                                endIndent: 60.0,

                              ),
                              SizedBox(height: size.height*80.0/780.0,),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    flag2 = 0;
                                    flag1 = 1;
                                    height1 = size.height*.2;
                                    width = size.width*.2;
                                    isSelected = !isSelected;
                                    isSelected2 = false;
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
                                    flag1 = 0;
                                    flag2 = 1;
                                    height1 = size.height*.2;
                                    width = size.width*.2;
                                    isSelected2 = !isSelected2;
                                    isSelected = false;
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
                              ),
                              SizedBox(height: size.height*65.0/780.0,),
                              GestureDetector(
                                  onTap: (){
                                  if(flag1==1)
                                    easy++;
                                  else
                                    uptight++;
                                  if(flag1 == 1|| flag2 == 1) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            Design2(intro: intro,
                                              easy: easy,
                                              emotional: emotional,
                                              extro: extro,
                                              uptight: uptight,
                                              practical: practical,
                                              avatar: avatar,fname: fname,lname: lname,age: age,gender: gender,interest: interest,)));
                                  }},
                                  child: Container(

                                    margin: EdgeInsets.all(size.width*20.0/360.0),
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

                        ],
                      ),
                    ),

                    vsync: this,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 4),
                  ),
                ]
            ),

          ],
        ),
      ),
    );
  }
}