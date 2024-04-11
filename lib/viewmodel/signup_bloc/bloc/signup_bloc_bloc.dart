import 'dart:async';

import 'package:equatable/equatable.dart';
import '../../../model/datamodel/register_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_bloc_event.dart';
part 'signup_bloc_state.dart';

class SignupBlocBloc extends Bloc<SignupBlocEvent, SignupBlocState> {
  RegisterModel user = RegisterModel();
  SignupBlocBloc() : super(SignupBlocInitial(user: RegisterModel())) {
    on<SignupBlocEvent>((event, emit) {
      on<SignupEvent>(_signUpEvent);
    });
  }
  RegisterModel get sharedObject => user;

  FutureOr<void> _signUpEvent(
      SignupEvent event, Emitter<SignupBlocState> emit) {}
}
