import 'package:fitness_app/features/config/auth/otp_page.dart';
import 'package:fitness_app/components/reusable/custom_button.dart';
import 'package:fitness_app/utils/colors.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

class PartnerSignUp extends StatefulWidget {
  const PartnerSignUp({super.key});

  @override
  State<PartnerSignUp> createState() => _PartnerSignUpState();
}

class _PartnerSignUpState extends State<PartnerSignUp> {
  final partnerFormKey = GlobalKey<FormState>();
  TextEditingController phoneController = TextEditingController();
  FocusNode? focus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar("Inscription", context),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Form(
          key: partnerFormKey,
          child: Padding(
            padding: const EdgeInsets.only(top:50,left: 10),
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
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.primaryColor
                          )
                        ),
                        fillColor: AppColors.primaryColor,
                        prefixIcon: Icon(Icons.phone),
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
                        if(value!.isNotEmpty){
                          value = phoneController.text;
                          return null;
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
                const SizedBox(height: AppConstants.padding_40,),
                CustomButton(
                  size: MediaQuery.of(context).size.width,
                  title: "Créer un compte", 
                  onPressed: (){
                    if(partnerFormKey.currentState!.validate()){
                      //redirection vers la page de vérification otp
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> const Otp()
                        ),
                      );
                    }
                  }, focus: focus!,
                )
                // SizedBox(
                //   height: AppConstants.padding_50,
                //   width: MediaQuery.of(context).size.width*0.85,
                //   child: ElevatedButton(
                //   style: const ButtonStyle(),
                //     onPressed: () { 
                //       Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context)=> const Otp()
                //           ),
                //         );
                //       print(" load otp");
                //       },
                //       child: const Text("Créer un compte"),
                //     ),
                //   )
              ],
            ),
          ),
        ),
      ),
    );
  }
}