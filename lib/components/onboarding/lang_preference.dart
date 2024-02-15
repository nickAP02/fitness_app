import 'dart:developer';
import 'package:fitness_app/components/onboarding/plan_preference.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/local_storage.dart';
import '../../utils/colors.dart';

class LangPreference extends StatefulWidget {
  const LangPreference({super.key});

  @override
  State<LangPreference> createState() => _LangPreferenceState();
}

class _LangPreferenceState extends State<LangPreference> {
  // LocalStorage localStorage = LocalStorage();
  String username = "";
  String avatar = "";
  String email = "";
  String sexe = "";
  String telephone = "";
  int lang=0;
  var userData=[];
  var borderColor=AppColors.primaryColor;
  void getUserData() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username')??"";
    avatar = prefs.getString('avatar')??"";
    email = prefs.getString('email')??"";
    sexe = prefs.getString('sex')??"";
    telephone = prefs.getString('telephone')??"";
  }
  int borderWidth = 2;
  final LocalStorage storage = LocalStorage();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Column(
                  children: [
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
                      padding: EdgeInsets.all(50),
                      child: Text(
                          "Préférence de langue",
                          style: TextStyle(
                            fontSize: 20,
                            color: AppColors.primaryColor
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50,right: 20,top:80,bottom: 40),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                width: borderWidth.toDouble(),
                                color: borderColor,
                                style: BorderStyle.solid
                              ),
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: () async{
                                  setState(() {
                                    borderWidth=4;
                                    borderColor = AppColors.primaryTextColor;
                                  });
                                  log("lang en");
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  lang = 0;
                                  prefs.setInt("lang", lang);
                                },
                                behavior: HitTestBehavior.deferToChild,
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "EN",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                      )
                                    ),
                                    Text(
                                      "English",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 20,top:80,bottom: 40),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: borderWidth.toDouble(),
                                color: borderColor,
                                style: BorderStyle.solid,
                              ),
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: GestureDetector(
                                onTap: ()async{
                                  setState(() {
                                    borderWidth = 4;
                                    borderColor = AppColors.primaryTextColor;
                                  });
                                  log("lang fr");
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  lang = 1;
                                  prefs.setInt("lang", lang);
                                },
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      "FR",
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white
                                      ),
                                    ),
                                   Text(
                                      "French",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.white
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
                        shadowColor:  MaterialStateProperty.all(AppColors.primaryColor),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                      ),
                      child: const Text(
                          "Enregistrer",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white
                          ),
                        ),
                        onPressed: ()=>{
                        log("language pref"),
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context)=> const PlanPreferences()
                          ),
                        ),
                      }, 
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}