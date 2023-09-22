import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/colors.dart';

AppBar buildAppBar(String title,BuildContext context){
  return AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios)
        ),
        backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.primaryTextColor
          ),
        ),
      );
}