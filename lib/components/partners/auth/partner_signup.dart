import 'package:fitness_app/components/partners/auth/otp_page.dart';
import 'package:fitness_app/utils/colors.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

class PartnerSignUp extends StatefulWidget {
  const PartnerSignUp({super.key});

  @override
  State<PartnerSignUp> createState() => _PartnerSignUpState();
}

class _PartnerSignUpState extends State<PartnerSignUp> {
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      // appBar: buildAppBar("Inscription", context),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top:50,left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(AppConstants.padding_10),
                  child: Text(
                    "Centre de gym,coach sportif ou marchand",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: AppConstants.fontSize_20
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(AppConstants.padding_10),
                  child: Text(
                    "Profitez de tous les avantages en tant que professionnel",
                    style: TextStyle(
                      color: AppColors.primaryTextColor,
                      fontSize: AppConstants.fontSize_20
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppConstants.padding_30),
                    child: Text(
                      "Inscription",
                      style: TextStyle(
                        color: AppColors.primaryTextColor,
                        fontSize: AppConstants.fontSize_30
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:AppConstants.padding_20),
                  child: 
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        fillColor: AppColors.primaryColor,
                        icon: Icon(Icons.phone),
                        contentPadding: EdgeInsets.only(left: 10),
                        label: Text(
                          "Numero de téléphone",
                          style: TextStyle(
                            color: AppColors.primaryTextColor,
                            fontSize: AppConstants.fontSize_20
                          ),
                        ),
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if(value!=""){
                          value = phoneController.text;
                          return value;
                        }
                        if(phoneController.text.length<8 && phoneController.text.length>8){
                          value = phoneController.text;
                          return "Numero de téléphone non valide";
                        }
                        return "Le numero de téléphone ne doit pas être vide";
                      },
                      onChanged: (value) {
                        if(value.isNotEmpty){
                          value = phoneController.text;
                        }
                      },
                    ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:AppConstants.padding_20),
                  child: TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      fillColor: AppColors.primaryColor,
                      icon: Icon(Icons.password),
                      contentPadding: EdgeInsets.only(left: 10),
                      label: Text(
                        "Mot de passe",
                        style: TextStyle(
                          color: AppColors.primaryTextColor,
                          fontSize: AppConstants.fontSize_20
                        ),
                      )
                    ),
                    controller: pwdController,
                    validator: (value){
                      if(value!=""){
                        value = pwdController.text;
                        return value;
                      }
                      return "Le mot de passe ne doit pas être vide";
                    },
                  ),
                ),
                SizedBox(height: AppConstants.padding_40,),
                SizedBox(
                  height: AppConstants.padding_50,
                  width: MediaQuery.of(context).size.width*0.85,
                  child: ElevatedButton(
                  style: ButtonStyle(),
                    onPressed: () { 
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> const Otp()
                          ),
                        );
                      // print(" clicik");
                      },
                      child: Text("Créer un compte"),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}