part of 'signup_bloc_bloc.dart';

sealed class SignupBlocEvent extends Equatable {
  const SignupBlocEvent();

  @override
  List<Object> get props => [];
}

class SignupEvent extends SignupBlocEvent {
  final RegisterModel signupModel;

  const SignupEvent({required this.signupModel});
  @override
  List<Object> get props => [signupModel];
}
