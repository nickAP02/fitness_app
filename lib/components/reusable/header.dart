import 'package:flutter/material.dart';

import '../../utils/colors.dart';

// ignore: must_be_immutable
class Header extends StatelessWidget {
  String text;
  Header({
    super.key,
    required this.text
    });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 50,
          child: Divider(
            color: AppColors.primaryColor,
            thickness: 2,
            indent: 10,
            endIndent: 10,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}