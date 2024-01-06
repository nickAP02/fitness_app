import 'package:fitness_app/utils/colors.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../service/local_storage.dart';
import '../auth/view/login_page.dart';
import '../reusable/custom_button.dart';

class UserPreference extends StatefulWidget {
  const UserPreference({super.key});

  @override
  State<UserPreference> createState() => _UserPreferenceState();
}

class _UserPreferenceState extends State<UserPreference> {
  var items = [
    const DropdownMenuItem(child:Text("1m40")),
    const DropdownMenuItem(child:Text("1m50")),
    const DropdownMenuItem(child:Text("1m60")),
    const DropdownMenuItem(child:Text("1m70")),
    const DropdownMenuItem(child:Text("1m80")),
    const DropdownMenuItem(child:Text("1m90")),
    const DropdownMenuItem(child:Text("2m0")),
  ];
  List<String> tailles = [
    "1m40",
    "1m50",
    "1m60",
    "1m70",
    "1m80",
    "1m90",
    "2m"
  ]; 
  String taille="";
  String sexe="";
  double poids=0;
  bool isMaleChecked=true;
  bool isFemaleChecked=true;
  final formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  final LocalStorage storage = LocalStorage();
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child:SizedBox(
          height: hauteur,
          width: largeur,
          child: Form(
            key: formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left:AppConstants.padding_15,bottom: AppConstants.padding_50),
                child: Text(
                  "Informations personnelles",
                  style: TextStyle(
                      fontSize: AppConstants.fontSize_30,
                      color: Colors.white
                  )
                ),
              ),
              const SizedBox(height: AppConstants.padding_50,),
              const Text("Quelle est votre taille ?",
              style: TextStyle(
                  fontSize: AppConstants.fontSize_20,
                  color: Colors.white
                )
              ),
              const SizedBox(height: AppConstants.padding_20,),
              DropdownMenu(
                width: largeur,
                onSelected: (taille){
                  print("taille $taille");
                },
                // textStyle: const TextStyle(
                //   fontSize: 20,
                //   color: AppColors.primaryTextColor
                // ),
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                ),
                dropdownMenuEntries: tailles.map(
                  (item) => 
                  DropdownMenuEntry(
                    label:item,
                    value: item,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(TextStyle(
                        fontSize: AppConstants.fontSize_10
                      ))
                    )
                  )
                ).toList()
              ),
              const Text(
                "Quel est votre poids ?",
                style: TextStyle(
                  fontSize: AppConstants.fontSize_20,
                  color: Colors.white
                )
              ),
              const SizedBox(height: AppConstants.padding_20,),
              SizedBox(
                // height: hauteur*0.2,
                width: largeur,
                child: TextFormField(
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: textController,
                  validator: (value) {
                    if(value!.isNotEmpty){
                      return value;
                    }
                    return "Champ vide";
                  },
                  onChanged: (value) {
                    value = textController.text;
                    print("value $value");
                    if(value.isNotEmpty){
                      poids = double.parse(value);
                    }
                  },
                ),
              ),
              const Text(
                "Quel est votre sexe ?",
                style: TextStyle(
                  fontSize: AppConstants.fontSize_20,
                  color: Colors.white
                )
              ),
              const SizedBox(height: AppConstants.padding_20,),
              Padding(
                padding: const EdgeInsets.only(left:AppConstants.padding_10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text(
                          "F",
                          style: TextStyle(
                            fontSize: AppConstants.fontSize_20,
                            color: Colors.white
                          )
                        ),
                        Radio(
                          groupValue: !isFemaleChecked,
                          value: !isFemaleChecked, 
                          onChanged: (value){
                            setState(() {
                              isFemaleChecked = value!;
                              print("val $isFemaleChecked");
                              isFemaleChecked?!isFemaleChecked:isFemaleChecked;
                            });
                          }
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Text(
                          "M",
                          style: TextStyle(
                            fontSize: AppConstants.fontSize_20,
                            color: Colors.white
                          )
                        ),
                        Radio(
                          groupValue: !isMaleChecked,
                          value: !isMaleChecked, 
                          onChanged: (value){
                            setState(() {
                              isMaleChecked = value!;
                              print("val $isMaleChecked");
                              isMaleChecked?!isMaleChecked:isMaleChecked;
                            });
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
              CustomButton(title:"Suivant",
              onPressed: (){
                storage.saveHeight(taille);
                storage.saveWeight(poids);
                storage.saveUserSex(sexe);
                setState(() {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                        "Compte crée avec succès",
                        style:TextStyle(color: Colors.white)
                        )
                      )
                  );
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context)=>const Login()
                    )
                  );
                  
                });
              },)
            ],
                  ),
          ),
      )
      ),
    );
  }
}