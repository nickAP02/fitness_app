import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_app/components/auth/signup_page.dart';
import 'package:fitness_app/models/user.dart';
import 'package:fitness_app/service/google_auth.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/images.dart';
// import 'package:fitness_app/components/home/home.dart';
// import 'package:fitness_app/components/home/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}):super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late GoogleSignInAccount googleAccount;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  dynamic user;
  late SharedPreferences prefs;
  final LocalStorage storage = LocalStorage();
  GoogleAuth googleAuth = GoogleAuth();
  Future<DocumentSnapshot<Map<String, dynamic>>> documents = FirebaseFirestore.instance.collection("users").doc().get();
  
  List getUserData(){
    List elements = [];
    documents.then(
      (value) =>{
        value.data()!.forEach((key, value) {
          elements.add(value);
        })
      }
    );
    return elements;
    // value as UserModel,
    // if(value.email==""){
    //   storage.saveUser(value);
    // }
    // else{
    //   Navigator.of(context).push(
    //     MaterialPageRoute(
    //       builder: (context)=> const Home()
    //     ),
    //   );
    // }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData().forEach((element) {
      print("element $element");
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity:0.5,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Color.fromRGBO(0, 0, 0, 0.606),
                          BlendMode.darken
                        ),
                        image: AssetImage(
                          AppImages.exerciceSample1
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
                          "De retour parmi la communauté des MyFiteurs !",
                          style: TextStyle(
                            fontSize: 28,
                            color: Colors.white
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top:38.0,left: 10),
                        child: Text(
                          "MyFitness",
                          style: TextStyle(
                            fontSize: 45,
                            color: Colors.white
                          ),
                        ),
                      ),
                      // // const Padding(
                      // //   padding: EdgeInsets.only(top:78.0,left: 10),
                      // //   child: Text(
                      // //     "Définissez des objectifs qui vous ressemblent",
                      // //     style: TextStyle(
                      // //       fontSize: 15,
                      // //       color: Colors.white
                      // //     ),
                      // //   ),
                      // // ),
                      // // const Padding(
                      // //   padding: EdgeInsets.all(8.0),
                      // //   child: Text(
                      // //       "Partagez votre progression avec vos amis",
                      // //       style: TextStyle(
                      // //         fontSize: 15,
                      // //         color: Colors.white
                      // //     ),
                      // //   ),
                      // // ),
                      // const Padding(
                      //   padding: EdgeInsets.all(8.0),
                      //   child: Text(
                      //       "Des astuces pour une bonne alimentation",
                      //       style: TextStyle(
                      //         fontSize: 15,
                      //         color: Colors.white
                      //     ),
                      //   ),
                      // ),
                      const Column(
                        children: [
                          Padding(
                           padding: EdgeInsets.only(left:15.0,top: 30),
                            child: Text(
                                "Trouvez les meilleurs coachs personnels ou centre sportifs les plus proches de chez vous💪.",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                                ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20.0,left: 15),
                            child: Center(
                              child: Text(
                                "Connectez-vous avec d'autres passionnés comme vous.",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:20.0,right: 80,left: 10),
                            child: Text(
                              "Surtout atteignez vos objectifs🔥.",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white
                                ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:8.0,right: 10,top: 50),
                        child: SizedBox(
                          width: 200,
                          height: MediaQuery.of(context).size.height/20,
                          child: ElevatedButton.icon(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(Colors.white),
                              shadowColor:  MaterialStateProperty.all(Colors.white),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            ),
                            label: const Text("Connexion"),
                            onPressed: () async => {
                              log("google login"),
                              // googleAuth.loginWithGoogle(context: context).then(
                              //   (value) => {
                              //     storage.saveUser(value as UserModel)
                              //     }
                              //   ),
                              // Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context)=> const Home()
                              //   ),
                              // )
                              
                              googleAuth.signInWithGoogle().then(
                                (value) => {
                                  log("user $value"),
                                  log("docs $documents"),
                                  // for(var i=0;i<documents.entries.length;i++){}
                                  value as UserModel,
                                    if(value.email==""){
                                      storage.saveUser(value),
                                      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.HOME, (route) => false)
                                    }
                                    else{
                                      print("login else ")
                                    }
                                  }
                              ),
                            }, 
                            icon: Image.asset(
                              AppImages.googleIcon,
                              height: 20,
                            ),
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
                      // Padding(
                      //   padding: const EdgeInsets.only(left:8.0,right: 10),
                      //   child: ElevatedButton.icon(
                      //     style: ButtonStyle(
                      //       overlayColor: MaterialStateProperty.all(Colors.white),
                      //       shadowColor:  MaterialStateProperty.all(Colors.white),
                      //       shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      //     ),
                      //     label: const Text("Connexion avec Instagram"),
                      //      onPressed: ()=>{
                      //       log("instagram login"),
                      //       Navigator.of(context).push(
                      //         MaterialPageRoute(
                      //           builder: (context)=> const Preference()
                      //         ),
                      //       ),
                      //     }, 
                      //     icon: Image.asset(
                      //       '${assetUrl}instagram.png',
                      //       height: 20,
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context)=> const SignUp()
                              ),
                            );
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
            ),
          ],
        ),
      ),
    );
  }
}