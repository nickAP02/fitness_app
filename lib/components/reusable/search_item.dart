import 'package:flutter/material.dart';
import 'dart:developer';

import '../../utils/colors.dart';
class SearchItem extends StatefulWidget {
  int id=0;
  String title;
  bool isSelected;
  Function showItems;
  SearchItem({
    super.key,
    required this.id,
    this.isSelected=true,
    required this.title,
    required this.showItems
  });
  
  @override
  State<SearchItem> createState() =>SearchItemState();
}
class SearchItemState extends State<SearchItem>{
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // widget.isSelected = true;
    return  GestureDetector(
      onTap:(){
        setState((){
          widget.isSelected = !widget.isSelected;
          widget.showItems;
          log("bool value ${widget.isSelected.toString()}");
          log("fun ${widget.showItems.call()}");
        });
      },
      child:Container(
        width: MediaQuery.of(context).size.width/6,
        height: 20,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: widget.isSelected?AppColors.secondaryColor.withOpacity(0.3):AppColors.primaryColor,
          border: Border.all(
            color: widget.isSelected?AppColors.primaryColor:AppColors.secondaryColor
          ),
          borderRadius: BorderRadius.circular(30)
        ),
        child: Center(
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected!?AppColors.primaryColor:AppColors.secondaryColor,
              fontSize: 12
            ),
          ),
        ),
      ),
    );
  }
}