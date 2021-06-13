import 'dart:io';

import 'package:connections_inc/bloc/authentication/authentication_bloc.dart';
import 'package:connections_inc/bloc/authentication/authentication_event.dart';
import 'package:connections_inc/bloc/age/bloc.dart';
import 'package:connections_inc/models/user.dart';
import 'package:connections_inc/repository/userRepository.dart';
//import 'package:connections_inc/ui/widgets/genderForm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
//import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
//import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import 'package:connections_inc/ui/pages/gender.dart';

class AgeForm extends StatefulWidget {
  //final UserRepository _userRepository;
  String fname,lname;
  File avatar;
  AgeForm({Key key,
    @required this.avatar,@required this.fname, @required this.lname}): super(key:key);



  @override
  _AgeFormState createState() => _AgeFormState(avatar,fname,lname);
}

class _AgeFormState extends State<AgeForm> {
  DateTime age;
  AgeBloc _ageBloc;
  final String fname,lname;
  final File avatar;
  _AgeFormState(this.avatar,this.fname,this.lname);

  bool get isFilled => age!=null;

  bool isButtonEnabled(AgeState state) {
    return isFilled && !state.isSubmitting;
  }


//  _onSubmitted() async{
//  await _getLocation();
//  _ageBloc.add(
//    Submitted(
//      age: age,
//      location: location,
//    )
//  );
//}

  @override
  void initState() {
    //_getLocation();
    _ageBloc = BlocProvider.of<AgeBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    //_nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<AgeBloc, AgeState>(
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
                    Text('Age Creation Unsuccesful'),
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
      child: BlocBuilder<AgeBloc, AgeState>(
        builder: (context, state) {
        return SingleChildScrollView(
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
                        //dateFormat: String,
                        onConfirm: (date) {
                          setState(() {
                            age = date;
                          });
                          print(age);
                        },
                      );
//                      DatePicker.showSimpleDatePicker(
//                      context,
//                      initialDate: DateTime(2000),
//                      firstDate: DateTime(1920),
//                      lastDate: DateTime(2004),
//                      dateFormat: "dd-MMMM-yyyy",
//                      locale: DateTimePickerLocale.en_us,
////                      onConfirm: (date) {
////                          setState(() {
////                            age = date;
////                          });
////                          print(age);
////                        },
//                      onChange: (age,_) =>
//                    );
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
                    if (isButtonEnabled(state)) {
                    //_onSubmitted();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder:  (context) =>  Gender( fname: fname,lname:lname, avatar: avatar, age: age)));
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
],),)
            ],
            ),
          ),
          );
        },
      ),
    );
  }
}