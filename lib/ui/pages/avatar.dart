//import 'package:connections_inc/bloc/avatar/bloc.dart';
//import 'package:connections_inc/repository/userRepository.dart';
//
//import 'package:connections_inc/ui/widgets/avatar.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//
//class Avatar extends StatelessWidget {
//  final _userRepository;
//  final userId;
//
//  Avatar({@required UserRepository userRepository, String userId})
//      : assert(userRepository != null && userId != null),
//        _userRepository = userRepository,
//        userId = userId;
//
//  @override
//  Widget build(BuildContext context) {
//    return SafeArea(
//      child: Scaffold(
//        backgroundColor: Colors.pinkAccent[400],
//
//        body: BlocProvider<AvatarBloc>(
//          create: (context) => AvatarBloc(userRepository: _userRepository),
//          child: Avatar(
//            userRepository: _userRepository,
//          ),
//        ),
//      ),
//    );
//  }
//}
import 'dart:io';

import 'package:connections_inc/repository/userRepository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:connections_inc/ui/pages/name.dart';

class Avatar extends StatefulWidget {
  final UserRepository _userRepository;
  final userId;

  Avatar({@required UserRepository userRepository,@required String userId})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
          userId = userId;

  @override
  _AvatarState createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  File avatar;

  bool get isFilled => avatar!=null;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pinkAccent[400],
        body: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:  Container(
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
                                'Avatar',
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
                      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*40.0/780.0,
                          left: MediaQuery.of(context).size.width*20.0/360.0,
                          right: MediaQuery.of(context).size.width*20.0/360.0,
                          bottom: MediaQuery.of(context).size.height*74/780.0),
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
                          CircleAvatar(
                            radius: size.width * 0.3,
                            backgroundColor: Colors.transparent,
                            child: avatar == null
                                ? GestureDetector(
                              onTap: () async {
                                File getPic = await FilePicker.getFile(
                                    type: FileType.image);
                                if (getPic != null) {
                                  setState(() {
                                    avatar = getPic;
                                  });
                                }
                              },
                              child: Image.asset('assets/profilephoto.png'),
                            )
                                : GestureDetector(
                              onTap: () async {
                                File getPic = await FilePicker.getFile(
                                    type: FileType.image);
                                if (getPic != null) {
                                  setState(() {
                                    avatar = getPic;
                                  });
                                }
                              },
                              child: CircleAvatar(
                                radius: size.width * 0.3,
                                backgroundImage: FileImage(avatar),
                              ),
                            ),
                          ),

                          SizedBox(height: size.height*40.0/780.0,),

                          GestureDetector(
                            //height: MediaQuery.of(context).size.height*40.0/780.0,
                            //color: Colors.pinkAccent[400],
                            onTap: () {
                              if (isFilled) {
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Name( avatar : avatar)));
                              } else {}
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.pinkAccent[400],
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
//              Container(
//                height: MediaQuery.of(context).size.height*40.0/780.0,
//                color: Colors.transparent,
//                child: Container(
//                  decoration: BoxDecoration(
//                      border: Border.all(
//                          color: Colors.black,
//                          style: BorderStyle.solid,
//                          width: 2.0),
//                      color: Colors.transparent,
//                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width*20.0/360.0)),
//                  child: InkWell(
//                    onTap: () {
//                      Navigator.of(context).pop();
//                    },
//                    child:
//                    Center(
//                      child: Text('Go Back',
//                          style: TextStyle(
//                            fontSize: MediaQuery.of(context).size.width*20.0/360.0,
//                            color: Colors.black,
//                            //fontWeight: FontWeight.bold,
//                            fontFamily: 'Pacifico',
//                          )
//                      ),
//                    ),
//                  ),
//                ),
//              ),
                        ],),)
                  ],
                  ),
                ),
              ),
      ),
    );//single

  }
}