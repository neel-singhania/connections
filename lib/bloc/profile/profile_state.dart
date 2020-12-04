import 'package:meta/meta.dart';

@immutable
class ProfileState {
  final bool isPhotoEmpty;
  final bool isFNameEmpty;
  final bool isLNameEmpty;
  final bool isAgeEmpty;
  final bool isGenderEmpty;
  final bool isInterestedInEmpty;
  final bool isPersonalityEmpty;
  final bool isPartnerEmpty;
//  final bool isLocationEmpty;
  final bool isFailure;
  final bool isSubmitting;
  final bool isSuccess;

  bool get isFormValid =>
      isPhotoEmpty &&
      isFNameEmpty &&
      isLNameEmpty &&
      isAgeEmpty &&
      isGenderEmpty &&
      isInterestedInEmpty&&
      isPersonalityEmpty&&
      isPartnerEmpty;

  ProfileState({
    @required this.isPhotoEmpty,
    @required this.isFNameEmpty,
    @required this.isLNameEmpty,
    @required this.isAgeEmpty,
    @required this.isGenderEmpty,
    @required this.isInterestedInEmpty,
//    @required this.isLocationEmpty,
    @required this.isFailure,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isPartnerEmpty,
    @required this.isPersonalityEmpty,
  });

  factory ProfileState.empty() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isFNameEmpty: false,
      isLNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isPersonalityEmpty: false,
      isPartnerEmpty: false,
//      isLocationEmpty: false,
    );
  }

  factory ProfileState.loading() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: false,
      isSubmitting: true,
      isFNameEmpty: false,
      isLNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isPartnerEmpty: false,
      isPersonalityEmpty: false,
//      isLocationEmpty: false,
    );
  }

  factory ProfileState.failure() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: true,
      isSuccess: false,
      isSubmitting: false,
      isFNameEmpty: false,
      isLNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isPartnerEmpty: false,
      isPersonalityEmpty: false,
//      isLocationEmpty: false,
    );
  }

  factory ProfileState.success() {
    return ProfileState(
      isPhotoEmpty: false,
      isFailure: false,
      isSuccess: true,
      isSubmitting: false,
      isFNameEmpty: false,
      isLNameEmpty: false,
      isAgeEmpty: false,
      isGenderEmpty: false,
      isInterestedInEmpty: false,
      isPartnerEmpty: false,
      isPersonalityEmpty: false,
//      isLocationEmpty: false,
    );
  }

  ProfileState update({
    bool isPhotoEmpty,
    bool isFNameEmpty,
    bool isLNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isPersonalityEmpty,
    bool isPartnerEmpty,
//    bool isLocationEmpty,
  }) {
    return copyWith(
      isFailure: false,
      isSuccess: false,
      isSubmitting: false,
      isPhotoEmpty: isPhotoEmpty,
      isFNameEmpty: isFNameEmpty,
      isLNameEmpty: isLNameEmpty,
      isAgeEmpty: isAgeEmpty,
      isGenderEmpty: isGenderEmpty,
      isInterestedInEmpty: isInterestedInEmpty,
      isPersonalityEmpty: isPersonalityEmpty,
      isPartnerEmpty: isPartnerEmpty,
//      isLocationEmpty: isLocationEmpty,
    );
  }

  ProfileState copyWith({
    bool isPhotoEmpty,
    bool isFNameEmpty,
    bool isLNameEmpty,
    bool isAgeEmpty,
    bool isGenderEmpty,
    bool isInterestedInEmpty,
    bool isPartnerEmpty,
    bool isPersonalityEmpty,
//    bool isLocationEmpty,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return ProfileState(
      isPhotoEmpty: isPhotoEmpty ?? this.isPhotoEmpty,
      isFNameEmpty: isFNameEmpty ?? this.isFNameEmpty,
      isLNameEmpty: isLNameEmpty ?? this.isLNameEmpty,
//      isLocationEmpty: isLocationEmpty ?? this.isLocationEmpty,
      isInterestedInEmpty: isInterestedInEmpty ?? this.isInterestedInEmpty,
      isGenderEmpty: isGenderEmpty ?? this.isGenderEmpty,
      isAgeEmpty: isAgeEmpty ?? this.isAgeEmpty,
      isPartnerEmpty: isPartnerEmpty ?? this.isPartnerEmpty,
      isPersonalityEmpty: isPersonalityEmpty ?? this.isPartnerEmpty,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }
}
