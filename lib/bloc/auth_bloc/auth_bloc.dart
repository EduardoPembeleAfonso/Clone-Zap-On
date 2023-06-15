import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'dart:ffi';

// import my repositories
import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(UnAuthenticated()) {
    /**
     * Quando o user clicar no botao de login, enviaremos ou vamos ouvir o
     *  evento SignInRequested para o AuthBloc e emitir o estado da nossa app
     * como autenticado se a autenticacao for bem succedida 
     */
    on<SignInRequested>(((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signIn(
            callsign: event.callsign,
            phone: event.phone,
            password: event.passowrd);
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    }));

    /**
     * Quando o user clicar no botao de registro, ouviremos o evento 
     * SignUpRequested para o AuthBloc, e assim emitiremos o estado da nossa app
     * como Autenticado se a autenticacao for bem succedida, caso o contratrio
     * sera nao autenticado
     */
    on<SignUpRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signUp(
            callsign: event.callsign,
            phone: event.phone,
            numberZap: event.numberZap);
        emit(AuthentecatedConfirmation('id'));
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /**
     * Quando o user clica no botao de confirmar o numero
     * ouviremos o evento NumberConfirmationBeforeSignupRequested para o
     *  AuthBloc e vamos emitir o estado da nossa app como confirmado 
     */

    on<NumberConfirmationBeforeSignupRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.numberConfirmationBeforeSignup(
            acessCode: event.accessCode);
        emit(AuthentecatedPassword());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /**
     * Quando o user clica no botao de guardar a senha
     * ouviremos o evento CreatePasswordBeforeSignupRequested para o
     *  AuthBloc e vamos emitir o estado da nossa app como confirmado 
     */

    on<CreatePasswordBeforeSignupRequested>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.createPasswordBeforeSignup(
            password: event.password);
        emit(AuthentecatedSignUpFinishied());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /**
     * Quando o user clicar no botao de fazer login com o facebook 
     * ouviremos o evento SignInWithFacebook para o AuthBloc emitir o estado nao
     *  autenticado
     */
    on<SignInWithFacebook>((event, emit) async {
      emit(Loading());
      try {
        await authRepository.signWithFacebook();
        emit(Authenticated());
      } catch (e) {
        emit(AuthError(e.toString()));
        emit(UnAuthenticated());
      }
    });

    /**
     * Quando o user clicar no botao de logout, ouviremos o evento 
     * SingOutRequested para o AuthBloc emitir o estado nao autenticado
     */
    on<SignOutRequested>((event, emit) async {
      emit(Loading());
      await authRepository.signOut();
      emit(UnAuthenticated());
    });
  }
}
