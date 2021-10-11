part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SignUpButtonPressed extends RegisterEvent{
    String email,password;
    SignUpButtonPressed({required this.email, required this.password});
}
