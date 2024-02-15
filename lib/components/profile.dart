import 'dart:io';

import 'package:fitness_app/service/google_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../features/config/application/auth_controller.dart';
import '../utils/colors.dart';
import '../utils/routes.dart';
import 'reusable/bottom_navbar.dart';
import 'reusable/custom_appbar.dart';


class Profile extends StatefulWidget {

  const Profile({
    super.key,
  });

  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  final GoogleAuth googleAuth = GoogleAuth();
  String username = "";
  String avatar = "";
  String email = "";
  String telephone = "";
  CroppedFile? _croppedFileToUpload;
  AuthController userController = AuthController();
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username") ??"";
    avatar = prefs.getString("avatar") ??"";
    email = prefs.getString("email") ??"";
    telephone = prefs.getString("telephone") ??"";
    setState(() {
      loading = true;
    });
    if (kDebugMode) {
      print("user prefs avatar $avatar telephone $telephone email $email username $username");
    }
    
  }
  
  @override
  void initState() {
    super.initState();
    getUserData();
  }
  
  void setProfilePhoto(ImageSource source) async{
    var img = await ImagePicker().pickImage(source: source);
    if (img != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: img.path,
        aspectRatioPresets: [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9
        ],
        compressQuality: 100,
        maxWidth: 700,
        maxHeight: 700,
        compressFormat: ImageCompressFormat.png,
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
            toolbarWidgetColor: Colors.white,
            toolbarColor: AppColors.primaryColor,
            toolbarTitle: "Rogner",
            statusBarColor: AppColors.primaryColor,
            backgroundColor: Colors.white,
          )
        ],
      );

      _croppedFileToUpload = cropped;
      File file = File(_croppedFileToUpload!.path);
      avatar = file.path.toString();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar("Profile", context),
      body:
      loading
      ?
      SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5,),
        child: Center(
          child:Column(
            children: [
              Stack(
                children: [
                  avatar.isEmpty?CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(avatar),
                  ):Image.file(File(avatar)),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                        setProfilePhoto(ImageSource.gallery);
                      }, 
                      icon:const Icon(
                        Icons.edit,color: AppColors.primaryColor,)
                      ),
                    ),
                ]
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0,right: 20,left: 20,bottom: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primaryColor.withOpacity(0.5),
                  ),
                  child: SizedBox(
                    height: 350,
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.only(top:28.0),
                      child: ListView(
                        children: [
                          ListTile(
                            leading: const Icon(Icons.person),
                            title: Text(
                              username,
                              style: Theme.of(context).textTheme.headlineMedium
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.email),
                            title: Text(
                              email,
                              style:  Theme.of(context).textTheme.headlineMedium
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.phone),
                            title: Text(
                              telephone,
                              style: Theme.of(context).textTheme.headlineMedium
                            ),
                          ),
                          ListTile(
                            leading: const Icon(Icons.info),
                            title: Text(
                              username,
                              style: Theme.of(context).textTheme.headlineMedium
                            ),
                          ),
                          ListTile(
                            onTap: (){
                              // userController.signOutWithGoogle(context: context);
                              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.LOGIN, (route) => false);
                            },
                            leading: const Icon(Icons.logout,color: AppColors.secondaryColor,),
                              title: const Text(
                                "Déconnexion",
                                // style: TextStyle(
                                //   color: AppColors.primaryColor
                                // )
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )
      :const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor,)
      ),
      bottomNavigationBar: BottomNavBar(isUser: true,),
    );
  }
}