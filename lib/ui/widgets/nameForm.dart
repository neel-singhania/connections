import 'dart:io';

import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
import 'package:connections_inc/bloc/name/bloc.dart';
import 'package:connections_inc/models/user.dart';
import 'package:connections_inc/repository/userRepository.dart';
//import 'package:connections_inc/ui/widgets/genderForm.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:connections_inc/ui/pages/age.dart';
//import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:geolocator/geolocator.dart';

class NameForm extends StatefulWidget {
  //final UserRepository _userRepository;
  File avatar;

  NameForm({Key key, @required this.avatar}): super (key:key);

//      : assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  _NameFormState createState() => _NameFormState(avatar);
}

class _NameFormState extends State<NameForm> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();


  String fname,lname;
  File avatar;
  NameBloc _nameBloc;
  _NameFormState(this.avatar);
  bool get isFilled =>  _fnameController.text.isNotEmpty && _lnameController.text.isNotEmpty;

  bool isButtonEnabled(NameState state) {
    return isFilled && !state.isSubmitting;
  }

//  _onSubmitted(){
//    _nameBloc.add(
//        Submitted(
//          fname: fname,
//          lname: lname,
//        )
//    );
//  }

  @override
  void initState() {
    _nameBloc = BlocProvider.of<NameBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

    return BlocListener<NameBloc, NameState>(
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
                      Text('Profile Creation Unsuccesful'),
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
        child: BlocBuilder<NameBloc, NameState>(
          builder: (context, state) {
            return SingleChildScrollView(
            //scrollDirection: Axis.horizontal,
             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                Widget>[
               Container(
                 child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*80.0/780.0,
                          0.0, MediaQuery.of(context).size.height*20.0/780.0),
                      child: Center(
                        child: Text(
                          'Tell us',
                          style:
                          TextStyle(fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(0.0, MediaQuery.of(context).size.height*145.0/780.0, 0.0,
                          MediaQuery.of(context).size.height*20.0/780.0),
                      child:Center(
                        child: Text(
                          'your name',
                          style:
                          TextStyle(fontSize: MediaQuery.of(context).size.height*60.0/780.0,
                            color: Colors.white,
                            fontFamily: 'Pacifico',
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*54.0/780.0),
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*36.0/780.0,
                      left: MediaQuery.of(context).size.width*20.0/360.0,
                      right: MediaQuery.of(context).size.width*20.0/360.0,
                      bottom: MediaQuery.of(context).size.height*35/780.0),
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
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'First  Name',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                             hintText: 'naam bataiye janab!!',
                             hintStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.pinkAccent[400]))),
                        controller: _fnameController,
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: 'Last Name',
                            labelStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            hintText: 'jaat bataiye janab!!',
                            hintStyle: TextStyle(
                                fontSize: MediaQuery.of(context).size.height*20.0/780.0,
                                fontFamily: 'Pacifico',
                                //fontWeight: FontWeight.bold,
                                color: Colors.grey),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.pinkAccent[400]))),
                        controller: _lnameController,
                      ),
                      //SizedBox(height: MediaQuery.of(context).size.height*10.0/780.0),
                      SizedBox(height: MediaQuery.of(context).size.height*95.0/780.0),
                      GestureDetector(
                        //height: MediaQuery.of(context).size.height*40.0/780.0,
                        //color: Colors.pinkAccent[400],
                        onTap: () {
                          if (isButtonEnabled(state)) {
                            fname=_fnameController.text;
                            lname=_lnameController.text;
                            Navigator.of(context).push(MaterialPageRoute(
                              builder:  (context) =>  Age( fname: fname,lname:lname, avatar: avatar)
                            ));
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

            ]) ,

            );
          },
        ),
    );
  }
}