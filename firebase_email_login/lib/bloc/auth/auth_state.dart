part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthenticateState extends AuthState {
  User? user;

  AuthenticateState({required this.user});
}

class UnAuthenticateState extends AuthState {}
