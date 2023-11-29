import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Nous voulons mieux vous connaître"),
            const Text("Quelle est votre taille ?"),
            DropdownMenu(
              onSelected: (taille){
                print("taille $taille");
              },
              textStyle: const TextStyle(
                color: AppColors.primaryTextColor
              ),
              menuStyle: MenuStyle(
                backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
              ),
              dropdownMenuEntries: tailles.map((item) => DropdownMenuEntry(label:item,value: item)).toList()
            ),
            const Text("Quel est votre poids ?"),
            TextField(
              // keyboardType: TextInputType.numberWithOptions(),
              controller: textController,
              onChanged: (value) {
                // value = textController.text;
                print("value $value");
              },
            ),
            const Text("Quel est votre sexe ?"),
            Row(
              children: [
                Row(
                  children: [
                    const Text("Féminin"),
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
                    Text("Masculin"),
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
            
          ],
        ),
      ),
    );
  }
}