abstract class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;

  SignUpEvent({
    required this.name,
    required this.email,
    required this.password,
  });
}

class SignInEvent extends AuthEvent {
  final String email;
  final String password;

  SignInEvent({
    required this.email,
    required this.password,
  });
}
class UpdateProfileEvent extends AuthEvent {
  final String uid;
  final String role;
  final String profilePic;

  UpdateProfileEvent({
    required this.uid,
    required this.role,
    required this.profilePic,
  });
}
