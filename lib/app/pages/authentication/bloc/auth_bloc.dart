import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../data/repositories/auth_repository/auth_repo.dart'; // Adjust with the correct path

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  StreamSubscription<AuthState>? _authSubscription;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) async {
      print("SignUpEvent received: $event");
      emit(AuthLoading());

      try {
        await authRepository.signUp(
          event.name,
          event.email,
          event.password,
          event.confirmPassword,
        );

        emit(AuthSignedIn());
        print("sudah signed in");
      } catch (e) {
        emit(AuthError("Error: $e"));
        print("error lamao");
      }
    });

    on<SignInEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signInWithEmailAndPasswordRepository(
          event.email,
          event.password,
        );
        emit(AuthSignedIn());
      } catch (e) {
        emit(AuthError("Sign in failed"));
        print(e.toString());
      }
    });

    on<SignInWithGoogleEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.signInWithGoogle();
        emit(AuthSignedIn());
      } catch (e) {
        emit(AuthError("Sign in with Google failed"));
      }
    });

    on<SignOutEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await authRepository.logOut();
        emit(AuthSignedOut());
      } catch (e) {
        emit(AuthError("Sign out failed"));
      }
    });
  }

  @override
  Future<void> close() {
    _authSubscription?.cancel();
    return super.close();
  }
}
