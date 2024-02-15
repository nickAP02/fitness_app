//the class that manage user auth flow & data
abstract class AuthEvent {
  const AuthEvent();
}
class RegisterUserEvent implements AuthEvent {
  //register user
  registerUser(){}
  
}
class RegisterPartnerEvent implements AuthEvent {
  //register partner
  registerPartner(){}
}
class LoginUserEvent implements AuthEvent {
  //login user
  loginUser(){}
  
}
class LoginPartnerEvent implements AuthEvent {
  //login partner
  loginPartner(){}
  
}
class LogoutEvent implements AuthEvent {
  //logout 
  void logout(){}
  
}