import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

@immutable
class AvatarState{
  final bool isAvatarEmpty;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormValid => isAvatarEmpty;

  AvatarState({
  this.isAvatarEmpty,
  this.isSubmitting,
  this.isSuccess,
  this.isFailure}
  );

  factory AvatarState.empty() {
    return AvatarState(
      isAvatarEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory AvatarState.loading() {
    return AvatarState(
      isAvatarEmpty: false,
      isFailure: false,
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory AvatarState.failure() {
    return AvatarState(
      isAvatarEmpty: false,
      isFailure: true,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory AvatarState.success() {
    return AvatarState(
      isAvatarEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: true,
    );
  }
  AvatarState update({
    bool isAvatarEmpty,
    //bool islnameEmpty,

  }) {
    return copyWith(
      isAvatarEmpty: isAvatarEmpty,
      //islnameEmpty: islnameEmpty,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  AvatarState copyWith({
    bool isAvatarEmpty,
    //bool islnameEmpty,
    bool isFailure,
    bool isSuccess,
    bool isSubmitting,
  }) {
    return AvatarState(
        isAvatarEmpty: isAvatarEmpty ?? this.isAvatarEmpty,
        //isfnameEmpty: isfnameEmpty ?? this.isfnameEmpty,
        isSuccess: isSuccess ?? this.isSuccess,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure
    );
  }

}