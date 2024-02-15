import 'package:fitness_app/features/config/domain/partner.dart';
import 'package:fitness_app/features/config/domain/user.dart';

abstract class AuthState {
  const AuthState();
}
class AuthInitialState implements AuthState {
  bool? authInitialized;
  AuthInitialState({this.authInitialized});
}
class AuthUserSuccessState implements AuthState {
  UserEntity? authUser;
  AuthUserSuccessState({required this.authUser});
}
class AuthUserErrorState implements AuthState {
  Exception userAuthException;
  AuthUserErrorState(this.userAuthException);
}
class AuthPartnerSuccessState implements AuthState {
  PartnerEntity? partner;
  AuthPartnerSuccessState(this.partner);
}
class AuthPartnerErrorState implements AuthState {
  Exception partnerAuthException;
  AuthPartnerErrorState(this.partnerAuthException);
}