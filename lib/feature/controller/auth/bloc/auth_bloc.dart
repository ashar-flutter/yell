import 'package:yell/core/barrel/barrel.dart';
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthInitial()) {
    on<SignUpEvent>(_onSignUp);
    on<SignInEvent>(_onSignIn);
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final uid = await _authRepository.signUp(
        name: event.name,
        email: event.email,
        password: event.password,
      );
      if (uid != null) {
        emit(AuthSuccess(uid: uid));
      } else {
        emit(AuthError(message: 'Sign up failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> _onSignIn(SignInEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final uid = await _authRepository.signIn(
        email: event.email,
        password: event.password,
      );
      if (uid != null) {
        emit(AuthSuccess(uid: uid));
      } else {
        emit(AuthError(message: 'Sign in failed'));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}