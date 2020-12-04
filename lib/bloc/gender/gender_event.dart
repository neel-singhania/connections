//import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class GenderEvent extends Equatable{
  const GenderEvent();

  @override
  List<Object> get props => [];

}

class GenderChanged extends GenderEvent{
  //final String lname;
  final String gender;

  GenderChanged({@required this.gender});

  @override
  List<Object> get props => [gender];
}

/*class lnameChanged extends GenderEvent{
  //final String lname;
  final String lname;

  lnameChanged({@required this.lname});

  @override
  List<Object> get props => [lname];
}*/

class Submitted extends GenderEvent{
  final String gender;

  Submitted({@required this.gender});

  List<Object> get props => [gender];
}
