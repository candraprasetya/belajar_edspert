part of 'registration_bloc.dart';

@immutable
abstract class RegistrationEvent {}

class SendRegisterData extends RegistrationEvent {
  final String name;
  final String email;
  final String password;

  SendRegisterData(this.name, this.email, this.password);
}
