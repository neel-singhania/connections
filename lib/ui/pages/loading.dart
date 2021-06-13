import 'dart:async';
//import 'ouricon_icons.dart';
import 'package:flutter/material.dart';
//import 'package:flutkart/utils/flutkart.dart';
//import 'package:flutkart/utils/my_navigator.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
//}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home :Scaffold(
backgroundColor: Colors.orange[50],
      body:
        Container(
            decoration: BoxDecoration(
              image:DecorationImage(image: AssetImage('assets/logo-wobg.png')),
            ),
          ),
//        Stack(
//
//        fit: StackFit.expand,
//        children: <Widget>[
//          Container(
//            decoration: BoxDecoration(
//              image:DecorationImage(image: AssetImage("facebook.png"),fit: BoxFit.cover),
//            ),
//          ),
////          Container(
////            decoration: BoxDecoration(color: Colors.amber[50]),
////          ),
//          Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//
//              Expanded(
//                flex: 2,
//                child: Container(
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    //crossAxisAlignment: CrossAxisAlignment.center,
//                    children: <Widget>[
//                      Container(
//                        height: 170.0,
//                      ),
//                       Icon(
//                          Ouricon.connections_inc_,
//                          color: Colors.brown[900],
//                          size: 350.0,
//                        ),
//
////                      Padding(
////                        padding: EdgeInsets.only(top: 10.0),
////                      ),
//
//                    ],
//                  ),
//               ),
//             ),
//              Expanded(
//                flex: 1,
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: <Widget>[
//                    CircularProgressIndicator(
//                      //valueColor: Colors.brown[900],
//                    ),
////                    Padding(
////                      padding: EdgeInsets.only(top: 20.0),
////                    ),
//                    Text(
//                      'Connectons Inc.',
//                      softWrap: true,
//                      textAlign: TextAlign.center,
//                      style: TextStyle(
//                          fontWeight: FontWeight.bold,
//                          fontSize: 18.0,
//                          color: Colors.brown[900]),
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          )
//        ],
//      ),

    ));
  }
}