part of 'OTP_verify_bloc.dart';

sealed class OTPVerifyState extends Equatable {
  const OTPVerifyState();

  @override
  List<Object> get props => [];
}

final class OTPVerifyInitial extends OTPVerifyState {}

final class OTPVerifySuccess extends OTPVerifyState {}

final class OTPVerifydFailure extends OTPVerifyState {}

final class OTPVerifyLoading extends OTPVerifyState {}
