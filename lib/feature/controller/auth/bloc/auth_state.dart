abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}
class UpdateProfileSuccess extends AuthState {
  final String role;
  final String uid;

  UpdateProfileSuccess({required this.role,
    required this.uid
  });
}
class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}
