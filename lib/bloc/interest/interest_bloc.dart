import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connections_inc/bloc/interest/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';

class InterestBloc extends Bloc<InterestEvent,InterestState> {
//  UserRepository _userRepository;
//
//  InterestBloc({@required UserRepository userRepository})
//      :assert(userRepository != null),
//        _userRepository = userRepository;

  @override
  InterestState get initialState => InterestState.empty();

  @override
  Stream<InterestState> mapEventToState(
      InterestEvent event,
      ) async*{
    if(event is InterestChanged){
      yield* _mapInterestChangedToState(event.interest);
//    }else if(event is Submitted){
//      final uid = await _userRepository.getUser();
//      yield* _mapSubmittedToState(
//        //lname: event.lname,
//        interest: event.interest,
//        userId: uid,
//      );
    }
  }

  Stream<InterestState> _mapInterestChangedToState(String interest) async*{
    yield state.update(
      isInterestEmpty: interest == null,
    );
  }

//  Stream<InterestState> _maplnameChangedToState(String lname) async*{
//    yield state.update(
//      islnameEmpty: lname == null,
//    );
//  }


//  Stream<InterestState> _mapSubmittedToState({String interest, String userId}) async*{
//    yield InterestState.loading();
//    try{
//      await _userRepository.interestSetup(interest, userId);
//      yield InterestState.success();
//    } catch(_){
//      yield InterestState.failure();
//    }
//  }


}