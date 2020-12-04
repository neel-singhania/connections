import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connections_inc/bloc/gender/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';

class GenderBloc extends Bloc<GenderEvent,GenderState> {
//  UserRepository _userRepository;
//
//  GenderBloc({@required UserRepository userRepository})
//      :assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  GenderState get initialState => GenderState.empty();

  @override
  Stream<GenderState> mapEventToState(
      GenderEvent event,
      ) async*{
    if(event is GenderChanged){
      yield* _mapGenderChangedToState(event.gender);
//    }else if(event is Submitted){
//      final uid = await _userRepository.getUser();
//      yield* _mapSubmittedToState(
//        gender: event.gender,
//        userId: uid,
//      );
    }
  }

  Stream<GenderState> _mapGenderChangedToState(String gender) async*{
    yield state.update(
      isGenderEmpty: gender == null,
    );
  }

//  Stream<GenderState> _maplnameChangedToState(String lname) async*{
//    yield state.update(
//      islnameEmpty: lname == null,
//    );
//  }


//  Stream<GenderState> _mapSubmittedToState({String gender, String userId}) async*{
//    yield GenderState.loading();
//    try{
//      await _userRepository.genderSetup(gender, userId);
//      yield GenderState.success();
//    } catch(_){
//      yield GenderState.failure();
//    }
//  }


}