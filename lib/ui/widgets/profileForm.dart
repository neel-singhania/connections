import 'dart:io';
import 'package:connections_inc/bloc/profile/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
//import 'package:connections_inc/bloc/interest/bloc.dart';
//import 'package:connections_inc/bloc/profile/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:connections_inc/ui/widgets/tabs.dart';
//import 'package:connections_inc/ui/widgets/genderForm.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:geolocator/geolocator.dart';

// ignore: must_be_immutable
class ProfileForm extends StatefulWidget {
  String fname,lname,gender,personality,partner,interest;
  DateTime age;
  File avatar;
  //final UserRepository _userRepository;

  ProfileForm({Key key, @required this.avatar,@required this.fname,@required this.lname,
    @required this. age,@required this.gender,@required this.personality,@required this.partner,@required this.interest }): super(key:key);


  @override
  _ProfileFormState createState() => _ProfileFormState(avatar,fname,lname,age,gender,interest,personality,partner);
}

class _ProfileFormState extends State<ProfileForm> {
  String fname,lname,gender,personality,partner,interest;
  //GeoPoint location;
  DateTime age;
  File avatar;
  //InterestBloc _interestBloc;
  ProfileBloc _profileBloc;

  _ProfileFormState(this.avatar,this.fname,this.lname,this.age,this.gender,this.personality,this.partner,this.interest);


  bool isButtonEnabled(ProfileState state) {
    return !state.isSubmitting;
  }
//  _getLocation() async {
//    Position position = await Geolocator()
//        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//
//    location = GeoPoint(position.latitude, position.longitude);
//  }

  @override
  void initState() {
    //_interestBloc = BlocProvider.of<InterestBloc>(context);
    //_getLocation();
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    //_nameController.dispose();
    super.dispose();
  }


  _onSubmitted(){
    _profileBloc.add(
      Submitted(
        avatar: avatar,
        fname:fname,
        lname:lname,
        age:age,
        //location: location,
        gender: gender,
        interest: interest,
        personality: personality,
        partner: partner,
      )
    );
  }



  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocListener<ProfileBloc, ProfileState>(
      //bloc: _profileBloc,
      listener: (context, state) {
        if (state.isFailure) {
          print("Failed");
          Scaffold.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Interest Creation Unsuccesful'),
                  Icon(Icons.error)
                ],
              ),
            ),
          );
        }
        if (state.isSubmitting) {
          print("Submitting");
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Submitting'),
                    CircularProgressIndicator()
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          print("Success!");
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
    },

      child: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child:   Container(
              child:Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                  Widget>[
//                    Container(
//                      child: Stack(
//                        children: <Widget>[
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*100.0/780.0, 0.0, 0.0),
//                            child:Center(
//                              child: Text(
//                                'You are',
//                                style: TextStyle(
//                                  color: Colors.white,
//                                  fontSize: MediaQuery.of(context).size.height*55.0/780.0,
//                                  fontFamily: 'Pacifico',
//                                ),
//                              ),
//                            ),
//                          ),
//                          Container(
//                            padding: EdgeInsets.fromLTRB(0.0,
//                                MediaQuery.of(context).size.height*170.0/780.0,
//                                MediaQuery.of(context).size.width*10.0/360.0,
//                                MediaQuery.of(context).size.height*30.0/780.0),
//                            child:Center(
//                              child: Text(
//                                'Interested In?',
//                                style: TextStyle(
//                                    color: Colors.white,
//                                    fontSize: MediaQuery.of(context).size.height*55.0/780.0,
//                                    fontFamily: 'Pacifico'
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
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
//                        GestureDetector(
//                            onTap:  () {
//                              setState(() {
//                                interest = "Male";
//                              });
//                            },
//                            child:Container(
//                              height: MediaQuery.of(context).size.height*40.0/780.0,
//                             // color: Colors.transparent,
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                      color: interest == "Male" ?Colors.white:Colors.black,
//                                      style: BorderStyle.solid,
//                                      width: 2.0),
//                                  color: interest == "Male" ?Colors.pinkAccent[400]:Colors.transparent,
//                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
//
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Center(
//                                    child: Text( "Male" ,
//                                        style: TextStyle(
//                                            color: interest == "Male" ?Colors.white:Colors.black,
//                                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                                            //fontWeight: FontWeight.bold,
//                                            fontFamily: 'Pacifico')),
//                                  )
//                                ],
//                              ),
//                            )),
//                        SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
//                        GestureDetector(
//                            onTap:  () {
//                              setState(() {
//                                interest = "Female";
//                              });
//                            },
//                            child:Container(
//                              height: MediaQuery.of(context).size.height*40.0/780.0,
//                             // color: Colors.transparent,
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                      color: interest == "Female" ?Colors.white:Colors.black,
//                                      style: BorderStyle.solid,
//                                      width: 2.0),
//                                  color: interest == "Female" ?Colors.pinkAccent[400]:Colors.transparent,
//                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
//
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Center(
//                                    child: Text( "Female" ,
//                                        style: TextStyle(
//                                            color: interest == "Female" ?Colors.white:Colors.black,
//                                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                                            //fontWeight: FontWeight.bold,
//                                            fontFamily: 'Pacifico')),
//                                  )
//                                ],
//                              ),
//                            )),
//                        SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
//                        GestureDetector(
//                            onTap:  () {
//                              setState(() {
//                                interest = "Everyone";
//                              });
//                            },
//                            child:Container(
//                              height: MediaQuery.of(context).size.height*40.0/780.0,
//                              //color: Colors.transparent,
//                              decoration: BoxDecoration(
//                                  border: Border.all(
//                                      color: interest == "Everyone" ?Colors.white:Colors.black,
//                                      style: BorderStyle.solid,
//                                      width: 2.0),
//                                  color: interest == "Everyone" ?Colors.pinkAccent[400]:Colors.transparent,
//                                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
//
//                              child: Row(
//                                mainAxisAlignment: MainAxisAlignment.center,
//                                children: <Widget>[
//                                  Center(
//                                    child: Text( "Everyone" ,
//                                        style: TextStyle(
//                                            color: interest == "Everyone" ?Colors.white:Colors.black,
//                                            fontSize: MediaQuery.of(context).size.height*20.0/780.0,
//                                            //fontWeight: FontWeight.bold,
//                                            fontFamily: 'Pacifico')),
//                                  )
//                                ],
//                              ),
//                            )),
//                        SizedBox(height: MediaQuery.of(context).size.height*80.0/780.0),
                        GestureDetector(
                          //height: MediaQuery.of(context).size.height*40.0/780.0,
                          //color: Colors.pinkAccent[400],
                          onTap: () {
                            if (isButtonEnabled(state)) {
                              _onSubmitted();
                              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                                  builder: (context) => Tabs()),(Route<dynamic> route) => false);
                            } else {}
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: isButtonEnabled(state)?Colors.pinkAccent[400]:Colors.pinkAccent,
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
                          //color: Colors.transparent,
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
              ],
              ),
            ),
          );
          },
      ),
    );
  }
}