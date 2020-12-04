
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connections_inc/bloc/avatar/avatar_event.dart';
import 'package:connections_inc/bloc/avatar/avatar_state.dart';
import 'package:connections_inc/repository/userRepository.dart';

class AvatarBloc extends Bloc<AvatarEvent,AvatarState> {
  UserRepository _userRepository;

  AvatarBloc({@required UserRepository userRepository})
  :assert(userRepository != null),
  _userRepository = userRepository;

  @override
  AvatarState get initialState => AvatarState.empty();

  @override
  Stream<AvatarState> mapEventToState(
       AvatarEvent event,
      ) async*{
    if(event is AvatarChanged){
      yield* _mapAvatarChangedToState(event.avatar);
    }else if(event is Submitted){
      final uid = await _userRepository.getUser();
      yield* _mapSubmittedToState(
        avatar: event.avatar,
        userId: uid,
      );
    }
  }

  Stream<AvatarState> _mapAvatarChangedToState(File avatar) async*{
    yield state.update(
      isAvatarEmpty: avatar == null,
    );
  }

  Stream<AvatarState> _mapSubmittedToState({File avatar, String userId}) async*{
   yield AvatarState.loading();
   try{
     await _userRepository.avatarSetup(avatar, userId);
     yield AvatarState.success();
   } catch(_){
     yield AvatarState.failure();
   }
  }


}