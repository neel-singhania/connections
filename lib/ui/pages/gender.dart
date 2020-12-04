//import 'dart:io';
//
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:connections_inc/bloc/gender/bloc.dart';
//import 'package:connections_inc/repository/userRepository.dart';
////import 'package:chill/ui/constants.dart';
//import 'package:connections_inc/ui/widgets/gender.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class Gender extends StatelessWidget {
//  //final _userRepository;
//  //final userId;
//  GeoPoint location;
//  String fname,lname;
//  DateTime age;
//  File avatar;
//
//  Gender({@required this.avatar,
//    @required this.fname, @required this.lname,@required this.location,@required this.age});
////      : assert(userRepository != null ),
////        _userRepository = userRepository;
//        //userId = userId;
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Colors.pinkAccent[400],
//
//        body: BlocProvider<GenderBloc>(
//          create: (context) => GenderBloc(),
//          child: Gender(
//            //userRepository: _userRepository,
//            avatar: avatar,
//            fname: fname,
//            lname: lname,
//            age: age,
//            location: location,
//          ),
//        ),
//      ),
//    );
//  }
//}



import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
import 'package:connections_inc/bloc/gender/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:connections_inc/ui/pages/interest.dart';
import 'package:connections_inc/ui/widgets/gender.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:geolocator/geolocator.dart';

class Gender extends StatefulWidget {
  //final UserRepository _userRepository;
  final String fname,lname;
  final File avatar;
  final DateTime age;
  Gender({Key key, @required this.avatar,@required this.fname,
    @required this.lname, @required this.age}):super (key:key);


  @override
  _GenderState createState() => _GenderState(avatar,fname,lname,age);
}

class _GenderState extends State<Gender> {
  String fname,lname;
  File avatar;
  String gender;
  DateTime age;
  _GenderState(this.avatar,this.fname,this.lname,this.age);
  bool get isFilled => gender!=null;

  //UserRepository _userRepository = UserRepository();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.pinkAccent[400],
              body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
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
                                    fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                                    fontFamily: 'Pacifico',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0,
                                  MediaQuery.of(context).size.height*170.0/780.0,
                                  MediaQuery.of(context).size.width*10.0/360.0,
                                  MediaQuery.of(context).size.height*30.0/780.0),
                              child:Center(
                                child: Text(
                                  'Gender',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.height*60.0/780.0,
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
                            children: <Widget>[
                              genderWidget(
                                  FontAwesomeIcons.venus, "Female", size, gender,
                                      () {
                                    setState(() {
                                      gender = "Female";
                                    });
                                  }),
                              SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                              genderWidget(
                                  FontAwesomeIcons.mars, "Male", size, gender, () {
                                setState(() {
                                  gender = "Male";
                                });
                              }),
                              SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                              genderWidget(
                                FontAwesomeIcons.transgender,
                                "Transgender",
                                size,
                                gender,
                                    () {
                                  setState(
                                        () {
                                      gender = "Transgender";
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: MediaQuery.of(context).size.height*80.0/780.0),
                              GestureDetector(
                                //height: MediaQuery.of(context).size.height*40.0/780.0,
                                //color: Colors.pinkAccent[400],
                                onTap: () {
                                  if (isFilled) {
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder:  (context) =>  Interest(fname: fname,lname:lname, avatar: avatar, age: age, gender: gender)));
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
//                             child: InkWell(
//                               onTap: () {
//                                 Navigator.of(context).pushNamed('/testpage');
//                                 },
                                  child:
                                  Center(
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
                            ],
                          )),
                    ])) ,
              ),
            ),
          );
  }
}