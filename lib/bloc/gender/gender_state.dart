import 'package:meta/meta.dart';

@immutable
class GenderState{
  final bool isGenderEmpty;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFormEmpty => isGenderEmpty;

  GenderState(
  {this.isGenderEmpty,
  this.isSubmitting,
  this.isSuccess,
  this.isFailure}
  );

  factory GenderState.empty() {
    return GenderState(
      isGenderEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory GenderState.loading() {
    return GenderState(
      isGenderEmpty: false,
      isFailure: false,
      isSubmitting: true,
      isSuccess: false,
    );
  }

  factory GenderState.failure() {
    return GenderState(
      isGenderEmpty: false,
      isFailure: true,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  factory GenderState.success() {
    return GenderState(
      isGenderEmpty: false,
      isFailure: false,
      isSubmitting: false,
      isSuccess: true,
    );
  }

  GenderState update({
  bool isGenderEmpty,

  }) {
    return copyWith(
      isGenderEmpty: isGenderEmpty,
      isFailure: false,
      isSubmitting: false,
      isSuccess: false,
    );
  }

  GenderState copyWith({
  bool isGenderEmpty,
    bool isFailure,
    bool isSuccess,
    bool isSubmitting,
}) {
    return GenderState(
        isGenderEmpty: isGenderEmpty ?? this.isGenderEmpty,
        isSuccess: isSuccess ?? this.isSuccess,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isFailure: isFailure ?? this.isFailure
    );
  }

}