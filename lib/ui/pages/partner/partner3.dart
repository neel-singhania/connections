
import 'dart:io';

import 'package:connections_inc/repository/userRepository.dart';
import 'package:connections_inc/ui/pages/profile.dart';
import 'package:flutter/material.dart';

class Partner3 extends StatefulWidget {
  String fname,lname,gender,interest,personality,partner;
  File avatar;
  DateTime age;

  Partner3({Key key,@required this.fname,@required this.lname,@required this.age, @required this.gender,
    @required this.interest,@required this.avatar, @required this.personality,@required this.partner}):super(key:key);
  @override
  _Partner3State createState() => _Partner3State(avatar,fname,lname,age,gender,interest,personality,partner);
}

class _Partner3State extends State<Partner3> {
  String fname,lname,gender,interest,personality,partner;
  File avatar;
  DateTime age;
  UserRepository _userRepository;
  _Partner3State(this.avatar,this.fname,this.lname,this.age,this.gender,this.interest,this.personality,this.partner);
  int selected;
  bool is1 =false,is2 = false,is3 = false,is4 = false,is5 = false,is6 = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 100.0,),
              Container(
                padding:EdgeInsets.all(30.0) ,
                //margin: EdgeInsets.all(),
                child: Text(
                  "On a scale of 1-6, 1 being the most introverted and 6"
                      " being the most extroverted, how would you like your potential partner's orientation to be?",
                  style: TextStyle(
//                  color: ,
                    fontSize: 20.0,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              SizedBox(height: 60.0,),
              Divider(
                height: 20.0,
                color: Colors.grey,
                thickness: 1.0,
                indent: 55.0,
                endIndent: 60.0,

              ),
              SizedBox(height: 80.0,),
              //SizedBox(height: 80.0,),
              Container(
                //padding: EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap:(){
                        setState(() {
                          is1 = !is1;
                          selected = 1;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: is1?Colors.amber:Colors.white,
                            border: Border.all(
                              color: is1?Colors.transparent:Colors.black,
                              width: 2.0,
                              style: BorderStyle.solid,
                            )
                        ),
                        child: Text("1",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.0,
                            color: is1?Colors.white:Colors.black,
                          ),),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is2 = ! is2;
                          selected = 2;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            color: is2?Colors.amber:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: is2?Colors.transparent:Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid
                            )
                        ),
                        child: Text("2",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.5,
                            color: is2?Colors.white:Colors.black,
                          ),),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is3 =  !is3;
                          selected = 3;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: is3?Colors.amber:Colors.white,
                            border: Border.all(
                                color: is3?Colors.transparent:Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid
                            )
                        ),
                        child: Text("3",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.0,
                            color: is3? Colors.white:Colors.black,
                          ),),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is4 = !is4;
                          selected = 4;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            color: is4?Colors.amber:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: is4?Colors.transparent:Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid
                            )
                        ),
                        child: Text("4",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.0,
                            color: is4?Colors.white:Colors.black,
                          ),),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is5 = !is5;
                          selected = 5;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            color: is5? Colors.amber:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: is5?Colors.transparent:Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid
                            )
                        ),
                        child: Text("5",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.0,
                            color: is5? Colors.white:Colors.black,
                          ),),

                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          is6 = ! is6;
                          selected = 6;
                        });

                      },
                      child: Container(
                        height: 50.0,
                        width: 40.0,
                        decoration: BoxDecoration(
                            color: is6 ? Colors.amber:Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: is6? Colors.transparent:Colors.black,
                                width: 2.0,
                                style: BorderStyle.solid
                            )
                        ),
                        child: Text("6",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'PermanentMarker',
                            fontSize: 35.0,
                            color: is6? Colors.white:Colors.black,
                          ),),

                      ),
                    ),

                  ],
                ),
              ),
              SizedBox(height: 90.0,),
              GestureDetector(
                  onTap: (){
                    partner += selected<4 ? "I" : "E";
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Profile(
                        avatar: avatar,fname: fname,lname: lname,age: age,gender: gender,interest: interest,personality: personality, partner: partner,userRepository: _userRepository,)));
                  },
                  child: Container(

                    margin: EdgeInsets.fromLTRB(20.0,0.0,20.0,0.0),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    alignment: Alignment.center,
                    height: 40.0,
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
      ),
    );
  }
}