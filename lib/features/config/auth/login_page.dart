import 'dart:developer';

import 'package:fitness_app/features/config/auth/signup_page.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../application/auth_controller.dart';
import '../../../utils/constant.dart';
import '../../home/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}):super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late SharedPreferences prefs;
  final LocalStorage storage = LocalStorage();
  AuthController userController = AuthController();
  var account;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "De retour parmi la communauté des MyFiteurs !",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "MyFitness",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Trouvez les meilleurs coachs personnels ou centre sportifs les plus proches de chez vous💪.",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            "Connectez-vous avec d'autres passionnés comme vous.",
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                          Text(
                            "Surtout atteignez vos objectifs🔥.",
                            style: Theme.of(context).textTheme.headlineMedium,
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context)=> const Home()
                                ),
                              )
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
                                  fontSize: AppConstants.fontSize_15,
                                  color: Colors.white
                                ),
                              ),
                              Text(
                                "S'inscrire",
                                style: TextStyle(
                                  fontSize: AppConstants.fontSize_25,
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