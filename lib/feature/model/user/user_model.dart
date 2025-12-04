class UserModel {
  final String uid;
  final String name;
  final String email;
  final String? profilePic;
  final String role;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.profilePic,
    required this.role,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      profilePic: map['profilePic'],
      role: map['role'] ?? '',
    );
  }
}