import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:exam_collector/Pages/SignUpPage/Bloc/signUpBlocEvent.dart';
import 'package:exam_collector/Pages/SignUpPage/Bloc/signUpBlocState.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpState()) {
    on<EmailEvent>(emailEvent);
    on<PasswordEvent>(passwordEvent);
    on<NameEvent>(nameEvent);
  }
  FutureOr<void> emailEvent(
    EmailEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(email: event.email));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> passwordEvent(
    PasswordEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(password: event.password));
    print(state.email);
    print(state.password);
  }

  FutureOr<void> nameEvent(
    NameEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(name: event.Name));
    print(state.name);
    print(state.email);
    print(state.password);
  }

  FutureOr<void> phoneEvent(
    NameEvent event,
    Emitter emit,
  ) async {
    emit(state.copyWith(name: event.Name));
    print(state.name);
    print(state.email);
    print(state.password);
  }
}
