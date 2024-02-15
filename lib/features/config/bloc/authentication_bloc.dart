import 'package:fitness_app/features/config/domain/partner.dart';

import '../domain/user.dart';
import 'authentication_event.dart';
import 'authentication_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent,AuthState> {

  AuthBloc():super(AuthInitialState()){
    on<RegisterUserEvent>((event,emit){onRegisterUserEvent();});
    on<RegisterPartnerEvent>((event,emit){onRegisterPartnerEvent();});
    on<LoginUserEvent>((event,emit){onLoginUserEvent();});
    on<LoginPartnerEvent>((event,emit){onLoginPartnerEvent();});
    on<LogoutEvent>((event,emit){onLogoutEvent();});

  }
  UserEntity onRegisterUserEvent(){
    return UserEntity(
      userId: 1, 
      username: "username", 
      email: "email", 
      description: "description", 
      city: "city", 
      sex: "sex", 
      height: "height", 
      weight: 0, 
      isUser: false, 
      isMerchant: 0);
  }
  PartnerEntity onRegisterPartnerEvent(){
    return PartnerEntity(
      partnerId: 1, 
      name: "name", 
      phoneNumber: "phoneNumber", 
      description: "description", 
      city: "city", 
      isUser: false, 
      isMerchant: 1);
  }
  UserEntity onLoginUserEvent(){
    return UserEntity(
      userId: 1, 
      username: "username", 
      email: "email", 
      description: "description", 
      city: "city", 
      sex: "sex", 
      height: "height", 
      weight: 0, 
      isUser: false, 
      isMerchant: 0);
    
  }
  PartnerEntity onLoginPartnerEvent(){
    return PartnerEntity(
      partnerId: 1, 
      name: "name", 
      phoneNumber: "phoneNumber", 
      description: "description", 
      city: "city", 
      isUser: false, 
      isMerchant: 1);
  }
  void onLogoutEvent(){}
}