abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final String email;

  Authenticated({required this.email});
}

class Unauthenticated extends AuthState {
  final String errorMessage;

  Unauthenticated({this.errorMessage = ''});
}
