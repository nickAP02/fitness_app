import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  TextEditingController no1Controller = TextEditingController();
  TextEditingController no2Controller = TextEditingController();
  TextEditingController no3Controller = TextEditingController();
  TextEditingController no4Controller = TextEditingController();
  TextEditingController no5Controller = TextEditingController();
  TextEditingController no6Controller = TextEditingController();
  GlobalKey<FormState> otpFormKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 100,),
          const Center(child: Text("Veuillez coller le code qui vous a été envoyé")),
          const SizedBox(height: 90,),
          Form(
            key: otpFormKey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(padding: EdgeInsets.only(top:50),),
                Padding(
                  padding: const EdgeInsets.only(top:15.0, left:15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no1Controller,
                      validator: (valeur1){
                        valeur1 = no1Controller.text;
                        if(valeur1.length==1){
                          return valeur1;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        if(value.length==1){
                          value = no1Controller.text;
                        }
                        null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0, left:15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no2Controller,
                      validator: (valeur2){
                        valeur2 = no2Controller.text;
                        if(valeur2.length==1){
                          return valeur2;
                        }
                        return null;
                      },
                      onChanged: (value){
                        if(value.length==1){
                          value = no2Controller.text;
                        }
                        null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0, left:15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no3Controller,
                      validator: (valeur3){
                        valeur3 = no3Controller.text;
                        return valeur3;
                      },
                      onChanged: (value){
                        if(value.length==1){
                          value = no3Controller.text;
                        }
                        null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0, left:15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no4Controller,
                      validator:(valeur4){
                        valeur4 = no4Controller.text;
                        return valeur4;
                      },
                      onChanged:(value){
                        if(value.length==1){
                          value = no4Controller.text;
                        }
                        null;
                      }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0, left:15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no5Controller,
                      validator:(valeur5){
                        valeur5 = no5Controller.text;
                        return valeur5;
                      },
                      onChanged:(value){
                        if(value.length==1){
                          value = no5Controller.text;
                        }
                        null;
                      }
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:15.0,left: 15),
                  child: Container(
                    height:50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AppColors.primaryTextColor,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: TextFormField(
                      style: const TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: AppConstants.fontSize_25
                      ),
                      keyboardType: TextInputType.number,
                      controller: no6Controller,
                      validator:(valeur6){
                        valeur6 = no6Controller.text;
                        return valeur6;
                      },
                      onChanged:(value){
                        if(value.length==1){
                          value = no6Controller.text;
                        }
                        null;
                      }
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30,),
          TextButton.icon(
            onPressed: (){
              if(otpFormKey.currentState!.validate()){
                //redirection vers la page d'accueil
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> pwdDefinition()
                  ),
                );
              }
              setState(() {
                if (kDebugMode) {
                  print("renvoyer");
                }
              });

            }, 
            label:const Text("Renvoyer le code"),
            icon: const Icon(Icons.replay),
          )
        ],
      )
    );
  }
  Widget pwdDefinition(){
    return const Column();
  }
}