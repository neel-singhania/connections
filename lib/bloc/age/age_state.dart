import 'package:meta/meta.dart';

@immutable
class AgeState{
  final bool isAgeEmpty;
  //final bool islnameEmpty;
  final bool isLocationEmpty;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormEmpty => isAgeEmpty ;

  AgeState(
  {this.isAgeEmpty,
  //this.islnameEmpty,
    this.isLocationEmpty,
  this.isSubmitting,
  this.isSuccess,
  this.isFailure}
  );

  factory AgeState.empty() {
    return AgeState(
      isAgeEmpty: false,
      //islnameEmpty: false,
      isLocationEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory AgeState.loading() {
    return AgeState(
      isAgeEmpty: false,
      isLocationEmpty: false,
      //islnameEmpty: false,
      isFailure: false,
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory AgeState.failure() {
    return AgeState(
      isAgeEmpty: false,
      isLocationEmpty: false,
      //islnameEmpty: false,
      isFailure: true,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory AgeState.success() {
    return AgeState(
      isAgeEmpty: false,
      isLocationEmpty: false,
      //islnameEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: true,
    );
  }

  AgeState update({
  bool isAgeEmpty,
    bool isLocationEmpty,
  //bool islnameEmpty,

  }) {
    return copyWith(
      isAgeEmpty: isAgeEmpty,
      isLocationEmpty: isLocationEmpty,
      //islnameEmpty: islnameEmpty,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  AgeState copyWith({
  bool isAgeEmpty,
    bool isLocationEmpty,
    //bool islnameEmpty,
    bool isFailure,
    bool isSuccess,
    bool isSubmitting,
}) {
    return AgeState(
        //islnameEmpty: islnameEmpty ?? this.islnameEmpty,
      isLocationEmpty: isLocationEmpty ?? this.isLocationEmpty,
        isAgeEmpty: isAgeEmpty ?? this.isAgeEmpty,
        isSuccess: isSuccess ?? this.isSuccess,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure
    );
  }

}