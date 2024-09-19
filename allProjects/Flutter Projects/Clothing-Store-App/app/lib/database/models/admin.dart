class Admins {
  final String username;
  final String email;
  final String password;
  final String uid;
  final String? profileImageUrl;

  Admins(
      {required this.username,
      required this.email,
      required this.password,
      required this.uid,
      this.profileImageUrl});

  Map<String, dynamic> tojson() => {
        'adminName': username,
        'adminPassword': password,
        'adminEmail': email,
        'uid': uid,
        'profileImageUrl': profileImageUrl,
      };
}
