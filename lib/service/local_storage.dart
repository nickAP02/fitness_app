import 'package:shared_preferences/shared_preferences.dart';
// class is used to persist data to shared preferences
class LocalStorage {
  late final SharedPreferences prefs;
  // initializes shared preferences instance
  Future<LocalStorage> init() async {
    prefs = await SharedPreferences.getInstance();
    return this;
  }
  //saves user id to local storage
  saveUserId(id) async {
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('user_id', id.toString());
  }
  // saves username to local storage
  saveUsername(username) async {
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('username', username.toString());
  }
  // saves user profile picture to local storage
  saveAvatar(avatar) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('avatar', avatar.toString());//user profile image
  }
  // saves user email to local storage
  saveEmail(email) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('email', email.toString());
  }
  // saves user gender to local storage
  saveUserSex(sex) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('sex', sex.toString());
  }
  // saves user phone number to storage
  savePhoneNumber(telephone) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('telephone', telephone.toString());
  }
  // saves user lang preferences to local storage
  saveLang(lang) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('lang', lang.toString());//user lang preference
  }
  // saves user height to local storage
  saveHeight(height) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('height', height.toString());//user height
  }
  // saves user weight to local storage
  saveWeight(weight) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setString('weight', weight.toString());//user weight
  }
  // saves user weight to local storage
  saveGoal(workout) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setInt('goal', workout);//user workout category id 
  }
  //saves user appointments
  saveAgenda(agenda) async{
    prefs  = await SharedPreferences.getInstance();
    prefs.setInt('agenda', agenda);//user appointments
  }
  // updates selected user data
  updateUser(userData) async{
    prefs.setString('user_id', userData["id"].toString());
    prefs.setString('avatar', userData["avatar"].toString());
    prefs.setString('telephone', userData["telephone"].toString());
    prefs.setString('lang', userData["lang"].toString());
    prefs.setString('height', userData["height"].toString());
    prefs.setString('weight', userData["weight"].toString());
    prefs.setString('goal', userData["goal"].toString());
    prefs.setString('agenda', userData["agenda"].toString());
  }

}