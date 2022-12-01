
abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class ChangeVisibilityState extends LoginStates{}


class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final String uId;

  LoginSuccessState(this.uId);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}

class ChangePasswordVisibilityState extends LoginStates {}


class GetAdminsLoadingState extends LoginStates{}

class GetAdminsSuccessState extends LoginStates{}

class GetAdminsErrorState extends LoginStates
{
  final error;
  GetAdminsErrorState(this.error);
}