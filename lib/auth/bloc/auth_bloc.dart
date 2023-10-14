import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytask/auth/bloc/auth_event.dart';
import 'package:mytask/auth/bloc/auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthBloc() : super(AuthInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
    on<LogoutButtonPressed>(_onLogoutButtonPressed);
  }

  void _onLoginButtonPressed(LoginButtonPressed event, Emitter<AuthState> emit) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: event.email, password: event.password);
      emit(Authenticated(email: userCredential.user?.email ?? ''));
    } on FirebaseAuthException catch (e) {
      emit(Unauthenticated(errorMessage: e.message ?? 'Authentication failed'));
    }
  }

  void _onLogoutButtonPressed(LogoutButtonPressed event, Emitter<AuthState> emit) async {
    await _firebaseAuth.signOut();
    emit(Unauthenticated());
  }
}
