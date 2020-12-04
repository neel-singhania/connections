//import 'dart:io';
//
//import 'package:connections_inc/bloc/age/bloc.dart';
//import 'package:connections_inc/repository/userRepository.dart';
////import 'package:chill/ui/constants.dart';
//import 'package:connections_inc/ui/widgets/age.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class Age extends StatelessWidget {
// // final _userRepository;
//  //final userId;
//  String fname,lname;
//  File avatar;
//
//  Age({@required this.fname,@required this.lname, @required this.avatar});
//
//        //userId = userId;
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Colors.pinkAccent[400],
//        body: BlocProvider<AgeBloc>(
//          create: (context) => AgeBloc(),
//          child: Age(
//            //userRepository: _userRepository,
//            avatar:  avatar,
//            fname: fname,
//            lname: lname,
//          ),
//        ),
//      ),
//    );
//  }
//}


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:connections_inc/ui/pages/gender.dart';

class Age extends StatefulWidget {
  //final UserRepository _userRepository;
  final String fname,lname;
  final File avatar;
  Age({Key key,
    @required this.avatar,@required this.fname, @required this.lname}): super(key:key);



  @override
  _AgeState createState() => _AgeState(avatar,fname,lname);
}

class _AgeState extends State<Age> {
  DateTime age;
  String fname,lname;
  File avatar;
  _AgeState(this.avatar,this.fname,this.lname);

  bool get isFilled => age!=null;





  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

         return SafeArea(
           child: Scaffold(
             backgroundColor: Colors.pinkAccent[400],
             body: SingleChildScrollView(
                //scrollDirection: Axis.vertical,
                child:   Container(
                  child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                      Widget>[
                    Container(
                      child: Stack(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*100.0/780.0, 0.0, 0.0),
                            child:Center(
                              child: Text(
                                'Select Your',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height*55.0/780.0,
                                  fontFamily: 'Pacifico',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(0.0,
                                MediaQuery.of(context).size.height*170.0/780.0,
                                MediaQuery.of(context).size.width*10.0/360.0,
                                MediaQuery.of(context).size.height*80.0/780.0),
                            child:Center(
                              child: Text(
                                'Date of Birth',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: MediaQuery.of(context).size.height*55.0/780.0,
                                    fontFamily: 'Pacifico'
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*20.0/780.0),
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*80.0/780.0,
                          left: MediaQuery.of(context).size.width*20.0/360.0,
                          right: MediaQuery.of(context).size.width*20.0/360.0,
                          bottom: MediaQuery.of(context).size.height*65/780.0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height*20.0/780.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey[700],
                                blurRadius: 9.0
                            )
                          ]
                      ),
                      child: Column(
                        children:<Widget>[ GestureDetector(
                          onTap: (){
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime(1950,1,1),
                              maxTime: DateTime(DateTime.now().year - 17, 1, 1),
                              onConfirm: (date) {
                                setState(() {
                                  age = date;
                                });
                                print(age);
                              },
                            );
                          },
                          child: Text(
                            age==null?"YYYY/MM/DD":age.toString().substring(0,10),
                            textAlign:TextAlign.center,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width * 25.0/360.0,
                                fontFamily: 'Montserrat'
                            ),
                          ),
                        ),
                          SizedBox(height: size.height*60.0/780.0,),

                          GestureDetector(
                            //height: MediaQuery.of(context).size.height*40.0/780.0,
                            //color: Colors.pinkAccent[400],
                            onTap: () {
                              if (isFilled) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder:  (context) =>  Gender( fname: fname,lname:lname, avatar: avatar, age: age)));
                              } else {}
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: isFilled?Colors.pinkAccent[400]:Colors.pinkAccent,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.pinkAccent,
                                        blurRadius: 3.5
                                    )
                                  ]
                              ),
                              child: Center(
                                child: Text('Continue',
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*22.0/360.0,
                                      color: Colors.white,
                                      //fontWeight: FontWeight.bold,
                                      fontFamily: 'Pacifico',
                                    )
                                ),
                              ),

                            ),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                          Container(
                            height: MediaQuery.of(context).size.height*40.0/780.0,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black,
                                      style: BorderStyle.solid,
                                      width: 2.0),
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child:
                                Center(
                                  child: Text('Go Back',
                                      style: TextStyle(
                                        fontSize: MediaQuery.of(context).size.width*20.0/360.0,
                                        color: Colors.black,
                                        //fontWeight: FontWeight.bold,
                                        fontFamily: 'Pacifico',
                                      )
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],),)
                  ],
                  ),
                ),
              ),
           ),
         );//single
  }
}