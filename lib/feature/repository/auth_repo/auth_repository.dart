import '../../../core/barrel/barrel.dart';


class AuthRepository {
  final AuthService _authService = AuthService();

  Future<String?> signUp({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.signUpWithEmail(
        name: name,
        email: email,
        password: password,
      );
      return user?.uid;
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<String?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _authService.signInWithEmail(
        email: email,
        password: password,
      );
      return user?.uid;
    } catch (e) {
      throw _handleError(e);
    }
  }



  String _handleError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'email-already-in-use':
          return 'Email already exists';
        case 'invalid-email':
          return 'Invalid email address';
        case 'weak-password':
          return 'Password is too weak';
        case 'user-not-found':
          return 'User not found';
        case 'network-request-failed':
          return 'Please check your internet connection';
        case 'wrong-password':
          return 'Incorrect password';
        default:
          return 'An error occurred';
      }
    }
    return 'An unexpected error occurred';
  }
}