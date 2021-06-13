//import 'dart:io';
//
//import 'package:connections_inc/bloc/name/bloc.dart';
//import 'package:connections_inc/repository/userRepository.dart';
////import 'package:chill/ui/constants.dart';
//import 'package:connections_inc/ui/widgets/name.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class Name extends StatelessWidget {
//  //final _userRepository;
////  final userId;
//  File avatar;
//
//  Name({Key key,@required this.avatar}): super(key:key);
////      : assert(userRepository != null && userId != null),
////        _userRepository = userRepository,
////        userId = userId;
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Colors.pinkAccent[400],
//
//        body: BlocProvider<NameBloc>(
//          create: (context) => NameBloc(),
//          child: Name(
//            avatar: avatar,
//          ),
//        ),
//      ),
//    );
//  }
//}





import 'dart:io';

import 'package:connections_inc/bloc/name/bloc.dart';
import 'package:flutter/material.dart';
import 'package:connections_inc/ui/pages/age.dart';

class Name extends StatefulWidget {
  //final UserRepository _userRepository;
  final File avatar;

  Name({Key key, @required this.avatar}): super (key:key);

  @override
  _NameState createState() => _NameState(avatar);
}

class _NameState extends State<Name> {
  final TextEditingController _fnameController = TextEditingController();
  final TextEditingController _lnameController = TextEditingController();


  String fname,lname;
  File avatar;
  _NameState(this.avatar);
  bool get isFilled =>  _fnameController.text.isNotEmpty && _lnameController.text.isNotEmpty;

  @override
  void dispose() {
    _fnameController.dispose();
    _lnameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;

          return SafeArea(
            child: Scaffold(
              backgroundColor: Colors.pinkAccent[400],
              body: SingleChildScrollView(
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
                          TextField(
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
                          TextField(
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
                              if (isFilled) {
                                fname=_fnameController.text;
                                lname=_lnameController.text;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder:  (context) =>  Age( fname: fname,lname:lname, avatar: avatar)
                                ));
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

                ]) ,

              ),
            ),
          );
  }
}