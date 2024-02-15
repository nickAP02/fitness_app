class Exception{
  String? message;
  TypeException error;
  Exception(this.message,this.error);
}
enum TypeException{
  userAuthenticationError,
  partnerAuthenticationError,
}