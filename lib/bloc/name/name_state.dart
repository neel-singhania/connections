import 'package:meta/meta.dart';

@immutable
class NameState{
  final bool isfnameEmpty;
  final bool islnameEmpty;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormEmpty => isfnameEmpty && islnameEmpty;

  NameState(
  {this.isfnameEmpty,
  this.islnameEmpty,
  this.isSubmitting,
  this.isSuccess,
  this.isFailure}
  );

  factory NameState.empty() {
    return NameState(
      isfnameEmpty: false,
      islnameEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory NameState.loading() {
    return NameState(
      isfnameEmpty: false,
      islnameEmpty: false,
      isFailure: false,
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory NameState.failure() {
    return NameState(
      isfnameEmpty: false,
      islnameEmpty: false,
      isFailure: true,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory NameState.success() {
    return NameState(
      isfnameEmpty: false,
      islnameEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: true,
    );
  }

  NameState update({
  bool isfnameEmpty,
  bool islnameEmpty,

  }) {
    return copyWith(
      isfnameEmpty: isfnameEmpty,
      islnameEmpty: islnameEmpty,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  NameState copyWith({
  bool isfnameEmpty,
    bool islnameEmpty,
    bool isFailure,
    bool isSuccess,
    bool isSubmitting,
}) {
    return NameState(
        islnameEmpty: islnameEmpty ?? this.islnameEmpty,
        isfnameEmpty: isfnameEmpty ?? this.isfnameEmpty,
        isSuccess: isSuccess ?? this.isSuccess,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure
    );
  }

}