part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthSignUp extends AuthEvent {
  final String name;
  final String email;
  final String pass;

  AuthSignUp({required this.name, required this.email, required this.pass});
}

final class AuthLogin extends AuthEvent {
  final String email;
  final String pass;

  AuthLogin({required this.email, required this.pass});
}

final class AuthIsUserLoggedIn extends AuthEvent {}
