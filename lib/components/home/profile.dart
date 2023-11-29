import 'dart:io';
import 'dart:typed_data';

import 'package:fitness_app/service/google_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../utils/colors.dart';
import '../reusable/bottom_navbar.dart';
import '../reusable/custom_appbar.dart';


class Profile extends StatefulWidget {

  const Profile({
    super.key,
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool loading = false;
  final GoogleAuth googleAuth = GoogleAuth();
  String username = "";
  String avatar = "";
  String email = "";
  String telephone = "";
  Uint8List _bytes = Uint8List(0);
  CroppedFile? _croppedFileToUpload;
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username") ??"";
    avatar = prefs.getString("avatar") ??"";
    email = prefs.getString("email") ??"";
    telephone = prefs.getString("telephone") ??"";
    setState(() {
      loading = true;
    });
    print("user prefs avatar $avatar telephone $telephone email $email username $username");
    
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

      _bytes = await cropped!.readAsBytes();
      _croppedFileToUpload = cropped;
      File _file = File(_croppedFileToUpload!.path);
      avatar = _file.path.toString();
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
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(avatar),
                  ),
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
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.person,color: Colors.white),
                              title: Text(
                                username,
                                style: const TextStyle(
                                  color: AppColors.primaryColor
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.email,color: Colors.white,),
                              title: Text(
                                email,
                                style:  const TextStyle(
                                  color: AppColors.primaryColor
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.phone,color: Colors.white),
                              title: Text(
                                telephone,
                                style: const TextStyle(
                                  color: AppColors.primaryColor
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: const Icon(Icons.info,color: Colors.white),
                              title: Text(
                                username,
                                style: const TextStyle(
                                  color: AppColors.primaryColor
                                )
                              ),
                            ),
                          ),
                          // const ListTile(
                          //   leading: Icon(Icons.apps,color: Colors.white),
                          //   title: Text(
                          //     // user.username!
                          //     "App",
                          //     style: TextStyle(
                          //       color: AppColors.primaryColor
                          //     )
                          //   ),
                          // ),
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}