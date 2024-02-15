import 'package:fitness_app/utils/colors.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../service/local_storage.dart';
import '../../features/config/auth/login_page.dart';
import '../reusable/custom_button.dart';

class UserPreference extends StatefulWidget {
  const UserPreference({super.key});

  @override
  State<UserPreference> createState() => _UserPreferenceState();
}

class _UserPreferenceState extends State<UserPreference> {
  List<String> tailles = [
    "1m40",
    "1m50",
    "1m60",
    "1m70",
    "1m80",
    "1m90",
    "2m",
    "2m10",
    "2m20",
    "2m30",
  ]; 
  bool isMaleChecked=false;
  bool isFemaleChecked=false;
  bool? isChecked;
  String? username;
  String? sexe;
  String? taille;
  double? poids;
  final formKey = GlobalKey<FormState>();
  TextEditingController textController = TextEditingController();
  final LocalStorage storage = LocalStorage();
  FocusNode focusNode = FocusNode();
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    sexe = prefs.getString("sexe");
    taille = prefs.getString("height");
    poids = prefs.getDouble("weight");
  }
  @override
  void initState(){
    super.initState();
    getUserData();
  }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Informations personnelles",
                style: Theme.of(context).textTheme.headlineSmall
              ),
              const SizedBox(height: AppConstants.padding_50,),
              Text("Quelle est votre taille ?",
              style: Theme.of(context).textTheme.headlineSmall
              ),
              const SizedBox(height: AppConstants.padding_20,),
              DropdownMenu(
                width: largeur,
                onSelected: (taille){},
                menuStyle: MenuStyle(
                  backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
                ),
                dropdownMenuEntries: tailles.map(
                  (item) => 
                  DropdownMenuEntry(
                    label:item,
                    value: item,
                    style: ButtonStyle(
                      textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.headlineSmall)
                    )
                  )
                ).toList()
              ),
              Text(
                "Quel est votre poids ?",
                style: Theme.of(context).textTheme.headlineSmall
              ),
              const SizedBox(height: AppConstants.padding_20,),
              SizedBox(
                // height: hauteur*0.2,
                width: largeur,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Entrez votre poids actuel",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(
                        color: AppColors.primaryColor
                      ),
                    )
                  ),
                  keyboardType: const TextInputType.numberWithOptions(),
                  controller: textController,
                  validator: (value) {
                    if(value!.isEmpty){
                      return "Renseigner votre poids";
                    }
                    if(value.characters.length<2){
                      return "Votre poids doit être supérieur à $value";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    value = textController.text;
                    if(value.isNotEmpty){
                      poids = double.parse(value);
                    }
                  },
                ),
              ),
              Text(
                "Quel est votre sexe ?",
                style: Theme.of(context).textTheme.headlineSmall
              ),
              const SizedBox(height: AppConstants.padding_20,),
              Padding(
                padding: const EdgeInsets.only(left:AppConstants.padding_10),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "F",
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                        Radio(
                          groupValue: sexe,
                          value: "F", 
                          onChanged: (value){
                            sexe = value;
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>const Login()
                              )
                            );
                          }
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "M",
                          style: Theme.of(context).textTheme.headlineSmall
                        ),
                        Radio(
                          groupValue: sexe,
                          value: "M", 
                          onChanged: (value){
                            sexe = value;
                            Navigator.push(
                              context, 
                              MaterialPageRoute(
                                builder: (context)=>const Login()
                              )
                            );
                          }
                        ),
                      ],
                    )
                  ],
                ),
              ),
              // BackButton(),
              Row(
                children: [
                  CustomButton(
                    focus:focusNode,
                    title: "Précédent",
                    size: MediaQuery.of(context).size.width, onPressed: (){
                      focusNode.requestFocus();
                    }
                  ),
                  CustomButton(
                    focus: focusNode,
                    title:"Suivant",
                    size: MediaQuery.of(context).size.width,
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                        // storage.saveHeight(taille);
                        // storage.saveWeight(poids);
                        // storage.saveUserSex(sexe);
                        // if (kDebugMode) {
                        //   print("sexe",prefs.getString("sexe")??"");
                        //   print("taille",prefs.getString("height")??"");
                        //   print("poids",prefs.getString("weight")??0);
                        // }
                        focusNode.requestFocus();
                        showDialog(
                          context: context, 
                          builder: ((context) => const SizedBox(
                            child: Column(
                              children: [
                                Icon(Icons.check_circle,color: AppColors.primaryColor,size: 100,),
                                Text(
                                  "Compte crée avec succès",
                                  style:TextStyle(color: Colors.white,fontSize: AppConstants.fontSize_10)
                                ),
                                BackButton()
                              ],
                            ),
                          )
                          )
                        );
                        // setState(() {
                        //   Navigator.push(
                        //     context, 
                        //     MaterialPageRoute(
                        //       builder: (context)=>const Login()
                        //     )
                        //   );
                          
                        // });

                      }
                    },
                  )
                ],
              ),
            ],
            ),
          ),
        )
      ),
    );
  }
  @override
  void dispose(){
    super.dispose();
    focusNode.dispose();
  }
}