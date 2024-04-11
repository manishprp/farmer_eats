part of 'signup_bloc_bloc.dart';

sealed class SignupBlocState extends Equatable {
  const SignupBlocState();

  @override
  List<Object> get props => [];
}

final class SignupBlocInitial extends SignupBlocState {
  final RegisterModel user;

  const SignupBlocInitial({required this.user});
}

final class SignupLoading extends SignupBlocState {}

final class SignupSuccess extends SignupBlocState {
  final String token;

  const SignupSuccess({required this.token});

  @override
  List<Object> get props => [token];
}

final class SignupFailed extends SignupBlocState {}
