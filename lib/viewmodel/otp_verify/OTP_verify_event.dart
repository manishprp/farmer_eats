part of 'OTP_verify_bloc.dart';

sealed class OTPVerifyEvent extends Equatable {
  const OTPVerifyEvent();

  @override
  List<Object> get props => [];
}

class OTPVerifySendEvent extends OTPVerifyEvent {}
