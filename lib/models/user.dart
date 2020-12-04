import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:io';

class User{
  String uid;
  String fname;
  String lname;
  String gender;
  String interest ;
  String avatar;
  Timestamp age;
  String partner;
  String personality;
  //GeoPoint location;

  User(
  {this.uid,
  this.fname,
  this.lname,
  this.gender,
  this.interest,
  this.avatar,
  this.age,
    this.partner,
    this.personality,
  //this.location
  }
  );



}