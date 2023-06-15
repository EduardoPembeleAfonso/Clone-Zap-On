part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

//Quando o usuario clica no botao de login ou resgitro muda o seu estado
// para carregamento da animacao o loading
class Loading extends AuthState {
  @override
  List<Object?> get props => [];
}

//Quando o usuario esta autenticado muda o seu estado para
// autenticado(Authenticated)
class Authenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

// Quando o usuario esta confirmando o seu numero mudados o estado para
// autenticacao de confirmacao
class AuthentecatedConfirmation extends AuthState {
  final String id;
  AuthentecatedConfirmation(this.id);
  @override
  List<String?> get props => [id];
}

// Quando o usuario esta confirmando o seu numero mudados o estado para
// autenticacao de registro com a password
class AuthentecatedPassword extends AuthState {
  @override
  List<String?> get props => [];
}

// Quando o usuario esta confirmando o seu numero mudados o estado para
// autenticacao do regsitro concluida
class AuthentecatedSignUpFinishied extends AuthState {
  @override
  List<String?> get props => [];
}

// Esse e o estado inicial da nossa app
// Quando o usuario nao esta autenticado ou quando ele faz o logout muda o seu
// para nao autenticado(UnAuthenticaded)
class UnAuthenticated extends AuthState {
  @override
  List<Object?> get props => [];
}

//E se occorrer um erro durante a autenticacao o estado muda para AuthError
class AuthError extends AuthState {
  final String error;
  AuthError(this.error);
  @override
  List<Object?> get props => [error];
}
