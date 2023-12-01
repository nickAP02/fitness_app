import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/material.dart';

import '../auth/login_page.dart';
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
  String? taille;
  bool isChecked=true;
  @override
  Widget build(BuildContext context) {
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    TextEditingController textController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child:SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left:15.0,),
              child: Text(
                "Informations personnelles",
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white
                )
              ),
            ),
            const SizedBox(height: 50,),
            const Text("Quelle est votre taille ?",
            style: TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
            DropdownMenu(
              onSelected: (taille){
                print("taille $taille");
              },
              textStyle: const TextStyle(
                fontSize: 20,
                color: AppColors.primaryTextColor
              ),
              menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
              ),
              dropdownMenuEntries: tailles.map((item) => DropdownMenuEntry(label:item,value: item)).toList()
            ),
            const Text(
              "Quel est votre poids ?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
            Container(
              width: 500,
              child: TextField(
                // keyboardType: TextInputType.numberWithOptions(),
                controller: textController,
                onChanged: (value) {
                  // value = textController.text;
                  print("value $value");
                },
              ),
            ),
            const Text(
              "Quel est votre sexe ?",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
            Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Text(
                        "Féminin",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                      ),
                      Checkbox(
                        // tristate: isChecked,
                        value: isChecked, 
                        onChanged: (value){
                          isChecked = value!;
                          print("val $value");
                          print("checked $isChecked");
                        }
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Masculin",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        )
                      ),
                      Checkbox(
                        // tristate: isChecked,
                        value: isChecked, 
                        onChanged: (value){
                          isChecked = value!;
                          print("val $value");
                          print("checked $isChecked");
                        }
                      ),
                    ],
                  )
                ],
              ),
            ),
            CustomButton(title:"Suivant",onPressed: (){
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
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
                    builder: (context)=>Login()
                  )
                );
                
              });
            },)
          ],
        ),
      )
      ),
    );
  }
}