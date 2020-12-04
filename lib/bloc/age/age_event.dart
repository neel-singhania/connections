//import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AgeEvent extends Equatable{
  const AgeEvent();

  @override
  List<Object> get props => [];

}

class AgeChanged extends AgeEvent{
  //final String lname;
  final DateTime age;

  AgeChanged({@required this.age});

  @override
  List<Object> get props => [age];
}

class LocationChanged extends AgeEvent {
  final GeoPoint location;

  LocationChanged({@required this.location});

  @override
  List<Object> get props => [location];
}

//class lnameChanged extends AgeEvent{
//  //final String lname;
//  final String lname;
//
//  lnameChanged({@required this.lname});
//
//  @override
//  List<Object> get props => [lname];
//}

class Submitted extends AgeEvent{
  final DateTime age;
  final GeoPoint location;
  //final String lname;

  Submitted({@required this.age,@required this.location});

  List<Object> get props => [age,location];
}
