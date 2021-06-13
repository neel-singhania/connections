import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connections_inc/bloc/age/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AgeBloc extends Bloc<AgeEvent,AgeState> {
//  UserRepository _userRepository;
//
//  AgeBloc({@required UserRepository userRepository})
//      :assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  AgeState get initialState => AgeState.empty();

  @override
  Stream<AgeState> mapEventToState(
      AgeEvent event,
      ) async*{
    if(event is AgeChanged){
      yield* _mapAgeChangedToState(event.age);
    }else  if(event is LocationChanged){
      yield* _mapLocationChangedToState(event.location);
//    }else if(event is Submitted){
//      final uid = await _userRepository.getUser();
//      yield* _mapSubmittedToState(
//        age: event.age,
//        location: event.location,
//        //fname: event.fname,
//        userId: uid,
//      );
    }
  }

  Stream<AgeState> _mapAgeChangedToState(DateTime age) async*{
    yield state.update(
      isAgeEmpty: age == null,
    );
  }

  Stream<AgeState> _mapLocationChangedToState(GeoPoint location) async*{
    yield state.update(
      isAgeEmpty: location == null,
    );
  }

//  Stream<AgeState> _maplnameChangedToState(String lname) async*{
//    yield state.update(
//      islnameEmpty: lname == null,
//    );
//  }


//  Stream<AgeState> _mapSubmittedToState({DateTime age, GeoPoint location, String userId}) async*{
//    yield AgeState.loading();
//    try{
//      await _userRepository.ageSetup(age, location, userId);
//      yield AgeState.success();
//    } catch(_){
//      yield AgeState.failure();
//    }
//  }


}