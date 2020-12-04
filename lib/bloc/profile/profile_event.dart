import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class FNameChanged extends ProfileEvent {
  final String fname;

  FNameChanged({@required this.fname});

  @override
  List<Object> get props => [fname];
}

class LNameChanged extends ProfileEvent {
  final String lname;

  LNameChanged({@required this.lname});

  @override
  List<Object> get props => [lname];
}

class PhotoChanged extends ProfileEvent {
  final File avatar;

  PhotoChanged({@required this.avatar});

  @override
  List<Object> get props => [avatar];
}

class AgeChanged extends ProfileEvent {
  final DateTime age;

  AgeChanged({@required this.age});

  @override
  List<Object> get props => [age];
}

class GenderChanged extends ProfileEvent {
  final String gender;

  GenderChanged({@required this.gender});

  @override
  List<Object> get props => [gender];
}

class InterestedInChanged extends ProfileEvent {
  final String interest;

  InterestedInChanged({@required this.interest});

  @override
  List<Object> get props => [interest];
}

//class LocationChanged extends ProfileEvent {
//  final GeoPoint location;
//
//  LocationChanged({@required this.location});
//
//  @override
//  List<Object> get props => [location];
//}

class PersonalityChanged extends ProfileEvent {
  final String personality;

  PersonalityChanged({@required this.personality});

  @override
  List<Object> get props => [personality];
}

class PartnerChanged extends ProfileEvent {
  final String partner;

  PartnerChanged({@required this.partner});

  @override
  List<Object> get props => [partner];
}

class Submitted extends ProfileEvent {
  final String fname, lname, gender, interest,personality,partner;
  final DateTime age;
  //final GeoPoint location;
  final File avatar;

  Submitted(
      {@required this.fname,
        @required this.lname,
      @required this.gender,
      @required this.interest,
      @required this.age,
      //@required this.location,
      @required this.avatar,
      @required this.partner,
      @required this.personality});

  @override
  List<Object> get props => [ fname, lname, age, gender, interest, avatar,partner,personality];
}
