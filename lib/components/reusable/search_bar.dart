import 'package:flutter/material.dart';

import '../../utils/colors.dart';

Widget makeSearchOption(BuildContext context, Function callback,Function searchableControl) {
  TextEditingController controller = TextEditingController();
    return Padding(
            padding: const EdgeInsets.only(top:15.0,right: 35,left: 35),
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search,color: AppColors.secondaryColor,),
                  // prefixText: "Rechercher exercices, astuces, gyms",
                  prefixStyle:const TextStyle(
                    color: AppColors.secondaryColor,
                    overflow: TextOverflow.clip
                  ),
                  label:const Text(
                    "Rechercher...",
                    style: TextStyle(
                    color: AppColors.primaryTextColor,
                    overflow: TextOverflow.clip
                  ),
                    ),
                  // constraints:const BoxConstraints(
                  //   maxWidth: 20,
                  //   maxHeight: 20,
                  // ),
                  border:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor
                    ),
                  )
                ),
                controller: controller,
                style:const TextStyle(
                  color: AppColors.primaryColor
                ),
                onChanged: (search){
                  searchableControl;
                },
              ),
            ),
          );
  }
