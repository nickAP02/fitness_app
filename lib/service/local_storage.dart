import 'package:fitness_app/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  late final SharedPreferences prefs;
  Future<LocalStorage> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<UserModel> getUser() async {
    UserModel user = UserModel();
    prefs  = await SharedPreferences.getInstance();
    user.id= prefs.getString('user_id');
    user.avatar= prefs.getString('avatar');
    user.username= prefs.getString('username');
    user.email= prefs.getString('email');
    user.sex= prefs.getString('sex');
    user.country= prefs.getString('country');
    user.city= prefs.getString('city');
    return user;
  }

  saveUser(UserModel userModel) async {
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('user_id', userModel.id.toString());
    prefs.setString('username', userModel.username.toString());
    prefs.setString('avatar', userModel.avatar.toString());
    prefs.setString('email', userModel.email.toString());
    prefs.setString('sex', userModel.sex.toString());
    prefs.setString('country', userModel.country.toString());
    prefs.setString('city', userModel.city.toString());
  }

}