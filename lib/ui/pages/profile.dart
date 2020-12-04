import 'dart:io';

import 'package:connections_inc/bloc/profile/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
//import 'package:connections_inc/ui/constants.dart';
import 'package:connections_inc/ui/widgets/profileForm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Profile extends StatelessWidget {
  final _userRepository;
  final userId;
  String fname,lname,gender,interest,personality,partner;
  DateTime age;
  File avatar;

  Profile({@required UserRepository userRepository, String userId,@required this.avatar,this.partner,this.personality,this.interest,this.fname,this.lname,this.gender,this.age})
      : assert(userRepository != null && userId != null),
        _userRepository = userRepository,
        userId = userId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Setup"),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocProvider<ProfileBloc>(
        create: (context) => ProfileBloc(userRepository: _userRepository),
        child: ProfileForm(
          avatar: avatar,
          fname: fname,
          lname: lname,
          age: age,
          gender: gender,
          interest: interest,
          personality: personality,
          partner: partner,
          //userRepository: _userRepository,
        ),
      ),
    );
  }
}
