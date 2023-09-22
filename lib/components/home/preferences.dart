import 'dart:developer';
import 'package:fitness_app/components/plans/plan.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class Preference extends StatefulWidget {
  const Preference({super.key});

  @override
  State<Preference> createState() => _PreferenceState();
}

class _PreferenceState extends State<Preference> {
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
                                color: AppColors.primaryColor
                              ),
                            ),
                            child: const Center(
                              child: Column(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 30,right: 20,top:80,bottom: 40),
                          child: Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Center(
                              child: Column(
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
                            builder: (context)=> const Plans()
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