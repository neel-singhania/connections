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

class GenderForm extends StatefulWidget {
  //final UserRepository _userRepository;
 String fname,lname;
 File avatar;
 DateTime age;
 GeoPoint location;
  GenderForm({Key key, @required this.avatar,@required this.fname,
    @required this.lname, @required this.age,@required this.location}):super (key:key);


  @override
  _GenderFormState createState() => _GenderFormState(avatar,fname,lname,age,location);
}

class _GenderFormState extends State<GenderForm> {
  String fname,lname;
  File avatar;
  String gender;
  DateTime age;
  GeoPoint location;
  GenderBloc _genderBloc;
  _GenderFormState(this.avatar,this.fname,this.lname,this.age,this.location);
  bool get isFilled => gender!=null;

    bool isButtonEnabled(GenderState state) {
      return isFilled && !state.isSubmitting;
    }

//  _onSubmitted(){
//    _genderBloc.add(
//      Submitted(
//        gender: gender,
//      )
//    );
//  }
 UserRepository _userRepository = UserRepository();
  @override
  void initState() {
    //_getLocation();
    _genderBloc = BlocProvider.of<GenderBloc>(context);
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

    return BlocListener<GenderBloc, GenderState>(
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
                    Text('Gender Creation Unsuccesful'),
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
      child: BlocBuilder<GenderBloc, GenderState>(
        builder: (context, state) {
          return SingleChildScrollView(
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
                             if (isButtonEnabled(state)) {
                               Navigator.of(context).push(MaterialPageRoute(
                                   builder:  (context) =>  Interest(fname: fname,lname:lname, avatar: avatar, age: age, gender: gender)));
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
                   ])) ,
          );
          },
      ),
    );
  }
}