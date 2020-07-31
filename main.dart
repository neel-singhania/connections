import 'package:flutter/material.dart';
import 'package:mate_up/login.dart';

import 'signup.dart';
import 'profile1.dart';
import 'profile2.dart';
import 'loading.dart';
//import 'intraextra.dart';
import 'testpage.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/loading': (BuildContext context) => new Loading(),
        '/login': (BuildContext context) => new LoginPage(),
        '/signup': (BuildContext context) => new SignupPage(),
        '/profile1': (BuildContext context) => new ProfilePage(),
        '/profile2': (BuildContext context) => new Profile2Page(),
        '/testpage': (BuildContext context) => new IntraExtra(),

      },
      home: Loading()
    );
  }
}

