part of 'registration_bloc.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationIsLoading extends RegistrationState {}

class RegistrationIsFailed extends RegistrationState {
  final String message;

  RegistrationIsFailed(this.message);
}

class RegistrationIsSuccess extends RegistrationState {
  final String message;

  RegistrationIsSuccess(this.message);
}
