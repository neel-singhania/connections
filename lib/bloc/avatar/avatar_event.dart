import 'dart:io';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AvatarEvent extends Equatable{
  const AvatarEvent();

  @override
  List<Object> get props => [];

}

class AvatarChanged extends AvatarEvent{
  final File avatar;

  AvatarChanged({@required this.avatar});

  @override
  List<Object> get props => [avatar];
}

class Submitted extends AvatarEvent{
  final File avatar;

  Submitted({@required this.avatar});

  List<Object> get props => [avatar];
}