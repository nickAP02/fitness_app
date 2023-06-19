import 'dart:developer';

import 'package:fitness_app/components/auth/google_auth.dart';
import 'package:fitness_app/components/home/preferences.dart';
// import 'package:fitness_app/components/home/home.dart';
// import 'package:fitness_app/components/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  dynamic user;
  GoogleAuth googleAuth = GoogleAuth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: const DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Color.fromRGBO(0, 0, 0, 0.606),
                        BlendMode.darken
                      ),
                      image: AssetImage(
                        '${assetUrl}exercice-2.jpg'
                      )
                  ),
                  boxShadow: [
                    BoxShadow(
                      color:Colors.black26.withOpacity(0.7),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3)
                    )
                  ]
                ),
              child: 
              Center(
                child: Column(
                  children: [
                    
                    const Padding(
                      padding: EdgeInsets.only(top:178.0,left: 10),
                      child: Text(
                        "Connexion",
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.white
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:78.0,left: 10),
                      child: Text(
                        "MyFitness",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top:78.0,left: 10),
                      child: Text(
                        "Définissez des objectifs qui vous ressemblent",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Partagez votre progression avec vos amis",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Des astuces pour une bonne alimentation",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Observez vous grandir chaque jour",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 10),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          shadowColor:  MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                        label: const Text("Connexion avec Google"),
                        onPressed: () async => {
                          log("google login"),
                          googleAccount = (await googleAuth.getSignedInAccount(googleSignIn))!,
                          // ignore: unnecessary_null_comparison
                          if(googleAccount != null){
                            googleAuth.getSignedInAccount(googleSignIn)
                            
                          }
                          else{
                            googleAuth.signInWithGoogle()
                          }
                        }, 
                        icon: Image.asset(
                          '${assetUrl}google.png',
                          height: 20,
                        ),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(
                      top:10,
                      bottom: 8,
                      right: 30,
                      left: 30
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 10),
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(Colors.white),
                          shadowColor:  MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        ),
                        label: const Text("Connexion avec Instagram"),
                         onPressed: ()=>{
                          log("instagram login"),
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context)=> const Preference()
                            ),
                          ),
                        }, 
                        icon: Image.asset(
                          '${assetUrl}instagram.png',
                          height: 20,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: GestureDetector(
                        onTap: (){
                          
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Pas de compte ? ",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white
                              ),
                            ),
                            Text(
                              "S'inscrire",
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}