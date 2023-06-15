part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object> get props => [];
}

//Ao fazer login chamamos esse evento e o nosso repositorio de
// autenticacao(AuthRepository)
class SignInRequested extends AuthEvent {
  final Int callsign;
  final Int phone;
  final String passowrd;

  SignInRequested(this.callsign, this.phone, this.passowrd);
}

// Ao fazer o registro de usuario chamamos esse evento e o nosso repositorio de
// autenticacao
class SignUpRequested extends AuthEvent {
  final Int callsign;
  final Int phone;
  final Int numberZap;

  SignUpRequested(this.callsign, this.phone, this.numberZap);
}

// Ao fazer o registro chamamos esse evento para confirmacao do numero
class NumberConfirmationBeforeSignupRequested extends AuthEvent {
  final Int accessCode;

  NumberConfirmationBeforeSignupRequested(this.accessCode);
}

// Ao fazer o registro chamamos esse evento para criar uma senha
class CreatePasswordBeforeSignupRequested extends AuthEvent {
  final String password;

  CreatePasswordBeforeSignupRequested(this.password);
}

// Ao fazer o logout chamamos esse evento
class SignOutRequested extends AuthEvent {}

// Ao fazer o login com o facebook chamamos esse evento
class SignInWithFacebook extends AuthEvent {}
