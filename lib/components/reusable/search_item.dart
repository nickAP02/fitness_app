import 'package:flutter/material.dart';
import 'dart:developer';

import '../../utils/colors.dart';
class SearchItem extends StatefulWidget {
  final String title;
  const SearchItem({
    super.key,
    required this.title
  });
  
  @override
  State<SearchItem> createState() =>SearchItemState();
}
class SearchItemState extends State<SearchItem>{
  bool isSelected=false;
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap:(){
        setState((){
          isSelected =!isSelected;
          log("bool value ${isSelected.toString()}");
        });
      },
      child:Container(
        width: MediaQuery.of(context).size.width/6,
        height: 20,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected?AppColors.secondaryColor.withOpacity(0.3):AppColors.primaryColor,
          border: Border.all(
            color: isSelected?AppColors.primaryColor:AppColors.secondaryColor
          ),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: isSelected?AppColors.primaryColor:AppColors.secondaryColor,
              fontSize: 12
            ),
          ),
        ),
    ),
    );
  }
}