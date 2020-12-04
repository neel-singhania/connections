import 'package:meta/meta.dart';

@immutable
class InterestState{
  final bool isInterestEmpty;
  //inal bool islnameEmpty;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormEmpty => isInterestEmpty;

  InterestState(
  {this.isInterestEmpty,
  //this.islnameEmpty,
  this.isSubmitting,
  this.isSuccess,
  this.isFailure}
  );

  factory InterestState.empty() {
    return InterestState(
      isInterestEmpty: false,
      //islnameEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory InterestState.loading() {
    return InterestState(
      isInterestEmpty: false,
      //islnameEmpty: false,
      isFailure: false,
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory InterestState.failure() {
    return InterestState(
      isInterestEmpty: false,
      //islnameEmpty: false,
      isFailure: true,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory InterestState.success() {
    return InterestState(
      isInterestEmpty: false,
      //islnameEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: true,
    );
  }

  InterestState update({
  bool isInterestEmpty,
  //bool islnameEmpty,

  }) {
    return copyWith(
      isInterestEmpty: isInterestEmpty,
      //islnameEmpty: islnameEmpty,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  InterestState copyWith({
  bool isInterestEmpty,
    //bool islnameEmpty,
    bool isFailure,
    bool isSuccess,
    bool isSubmitting,
}) {
    return InterestState(
        //islnameEmpty: islnameEmpty ?? this.islnameEmpty,
        isInterestEmpty: isInterestEmpty ?? this.isInterestEmpty,
        isSuccess: isSuccess ?? this.isSuccess,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure
    );
  }

}