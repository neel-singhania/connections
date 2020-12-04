import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:connections_inc/repository/userRepository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import './bloc.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  UserRepository _userRepository;

  ProfileBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileState get initialState => ProfileState.empty();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FNameChanged) {
      yield* _mapFNameChangedToState(event.fname);
    } else if (event is LNameChanged) {
      yield* _mapLNameChangedToState(event.lname);
    } else if (event is AgeChanged) {
      yield* _mapAgeChangedToState(event.age);
    } else if (event is GenderChanged) {
      yield* _mapGenderChangedToState(event.gender);
    } else if (event is InterestedInChanged) {
      yield* _mapInterestedInChangedToState(event.interest);
//    } else if (event is LocationChanged) {
//      yield* _mapLocationChangedToState(event.location);
    } else if (event is PhotoChanged) {
      yield* _mapPhotoChangedToState(event.avatar);
    } else if (event is PersonalityChanged) {
      yield* _mapPersonalityChangedToState(event.personality);
    } else if (event is PartnerChanged) {
      yield* _mapPartnerChangedToState(event.partner);
    } else if (event is Submitted) {
      final uid = await _userRepository.getUser();
      yield* _mapSubmittedToState(
          avatar: event.avatar,
          fname: event.fname,
          lname: event.lname,
          gender: event.gender,
          userId: uid,
          age: event.age,
          personality:event.personality,
          partner:event.partner,
        //location: event.location,
          interest: event.interest);
    }
  }

  Stream<ProfileState> _mapFNameChangedToState(String fname) async* {
    yield state.update(
      isFNameEmpty: fname == null,
    );
  }

  Stream<ProfileState> _mapLNameChangedToState(String lname) async* {
    yield state.update(
      isLNameEmpty: lname == null,
    );
  }

  Stream<ProfileState> _mapPhotoChangedToState(File avatar) async* {
    yield state.update(
      isPhotoEmpty: avatar == null,
    );
  }

  Stream<ProfileState> _mapAgeChangedToState(DateTime age) async* {
    yield state.update(
      isAgeEmpty: age == null,
    );
  }

  Stream<ProfileState> _mapGenderChangedToState(String gender) async* {
    yield state.update(
      isGenderEmpty: gender == null,
    );
  }

  Stream<ProfileState> _mapInterestedInChangedToState(
      String interestedIn) async* {
  yield state.update(
  isInterestedInEmpty: interestedIn == null,
  );
  }

  Stream<ProfileState> _mapPersonalityChangedToState(
      String personality) async* {
    yield state.update(
      isPersonalityEmpty: personality == null,
    );
  }

  Stream<ProfileState> _mapPartnerChangedToState(
      String partner) async* {
    yield state.update(
      isPartnerEmpty: partner == null,
    );
  }

//  Stream<ProfileState> _mapLocationChangedToState(GeoPoint location) async* {
//    yield state.update(
//      isLocationEmpty: location == null,
//    );
//  }

  Stream<ProfileState> _mapSubmittedToState(
      {File avatar,
      String gender,
      String fname,
        String lname,
      String userId,
      DateTime age,
        String partner,
        String personality,
      //GeoPoint location,
      String interest}) async* {
    yield ProfileState.loading();
    try {
      await _userRepository.profileSetup(
          avatar, userId, fname,lname, gender, interest, age,personality,partner
          //location
      );
      yield ProfileState.success();
    } catch (_) {
      yield ProfileState.failure();
    }
  }
}
