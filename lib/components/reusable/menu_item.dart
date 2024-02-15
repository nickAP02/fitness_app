import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class MenuCard extends StatelessWidget{
  String? title;
  MenuCard({
    super.key,
    this.title
  });

  @override
  Widget build(BuildContext context){
    int borderWidth = 2;
    return Padding(
      padding: const EdgeInsets.only(left: 50,right: 20,top:80,bottom: 40),
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: borderWidth.toDouble(),
            // color: borderColor,
            style: BorderStyle.solid
          ),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () async{
              
            },
            behavior: HitTestBehavior.deferToChild,
            child: Text(
              title!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white
              )
            ),
          ),
        ),
      ),
    );
  }
  
}