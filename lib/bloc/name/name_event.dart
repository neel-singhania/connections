//import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class NameEvent extends Equatable{
  const NameEvent();

  @override
  List<Object> get props => [];

}

class fnameChanged extends NameEvent{
  //final String lname;
  final String fname;

  fnameChanged({@required this.fname});

  @override
  List<Object> get props => [fname];
}

class lnameChanged extends NameEvent{
  //final String lname;
  final String lname;

  lnameChanged({@required this.lname});

  @override
  List<Object> get props => [lname];
}

class Submitted extends NameEvent{
  final String fname;
  final String lname;

  Submitted({@required this.fname, @required this.lname});

  List<Object> get props => [fname,lname];
}
