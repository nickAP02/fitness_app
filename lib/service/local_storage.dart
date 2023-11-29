import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;
  Future<LocalStorage> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  saveUser(userData) async {
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('user_id', userData.id.toString());
    prefs.setString('username', userData.username.toString());
    prefs.setString('avatar', userData.avatar.toString());//user profile image
    prefs.setString('email', userData.email.toString());
    prefs.setString('sex', userData.sex.toString());
    prefs.setString('telephone', userData.telephone.toString());
    prefs.setString('lang', userData.lang.toString());//user lang preference
    prefs.setString('height', userData.telephone.toString());//user height
    prefs.setString('weight', userData.telephone.toString());//user weight
    prefs.setString('goal', userData.telephone.toString());//user plan category id 
    prefs.setString('is_user', userData.isUser.toString());//user status wether partner or not
  }

  updateUser(userData) async{
    prefs.setString('user_id', userData["id"].toString());
    prefs.setString('avatar', userData["avatar"].toString());
    prefs.setString('telephone', userData["telephone"].toString());
    prefs.setString('lang', userData["lang"].toString());
    prefs.setString('height', userData["height"].toString());
    prefs.setString('weight', userData["weight"].toString());
    
  }

}