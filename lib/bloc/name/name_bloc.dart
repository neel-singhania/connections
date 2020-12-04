import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connections_inc/bloc/name/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';

class NameBloc extends Bloc<NameEvent,NameState> {
  //UserRepository _userRepository;

//  NameBloc({@required UserRepository userRepository})
//      :assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  NameState get initialState => NameState.empty();

  @override
  Stream<NameState> mapEventToState(
      NameEvent event,
      ) async*{
    if(event is fnameChanged){
      yield* _mapfnameChangedToState(event.fname);
    }else if(event is lnameChanged){
      yield* _maplnameChangedToState(event.lname);
//    }else if(event is Submitted){
//      final uid = await _userRepository.getUser();
//      yield* _mapSubmittedToState(
//        lname: event.lname,
//        fname: event.fname,
//        userId: uid,
//      );
    }
  }

  Stream<NameState> _mapfnameChangedToState(String fname) async*{
    yield state.update(
      isfnameEmpty: fname == null,
    );
  }

  Stream<NameState> _maplnameChangedToState(String lname) async*{
    yield state.update(
      islnameEmpty: lname == null,
    );
  }


//  Stream<NameState> _mapSubmittedToState({String fname, String lname, String userId}) async*{
//    yield NameState.loading();
//    try{
//      await _userRepository.nameSetup(fname, lname, userId);
//      yield NameState.success();
//    } catch(_){
//      yield NameState.failure();
//    }
//  }


}