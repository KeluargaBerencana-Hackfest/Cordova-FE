part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent {
  String email;
  String password;
  LoginEvent({
    required this.email,
    required this.password,
  });
}

class RegisterEvent extends AuthEvent {
  String name;
  String email;
  String password;
  String confirmationPassword;
  RegisterEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmationPassword,
  });
}
