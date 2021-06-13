//import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class InterestEvent extends Equatable{
  const InterestEvent();

  @override
  List<Object> get props => [];

}

class InterestChanged extends InterestEvent{
  //final String lname;
  final String interest;

  InterestChanged({@required this.interest});

  @override
  List<Object> get props => [interest];
}

//class lnameChanged extends InterestEvent{
//  //final String lname;
//  final String lname;
//
//  lnameChanged({@required this.lname});
//
//  @override
//  List<Object> get props => [lname];
//}

class Submitted extends InterestEvent{
  final String gender;
  final String interest;
 // final String lname;

  Submitted({@required this.gender,@required this.interest});

  List<Object> get props => [gender,interest];
}
