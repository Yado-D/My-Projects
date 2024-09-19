class UserModels {
  final String userName;
  final String userEmail;
  final String userPassword;
  final String userPhone;
  final String userEducationLevel; // having a degree,or diploma,phd....
  final String userUniversity;
  final String userCurrentStatus;
  final String userType;

  UserModels({
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userPhone,
    required this.userEducationLevel,
    required this.userUniversity,
    required this.userType,
    required this.userCurrentStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'userName': userName,
      'userEmail': userEmail,
      'userPassword': userPassword,
      'userEducationLevel': userEducationLevel,
      'userUniversity': userUniversity,
      'userType': userType,
      'userCurrentStatus': userCurrentStatus,
      'userPhone': userPhone,
    };
  }
}
