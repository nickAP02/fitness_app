import 'dart:developer';

import 'package:flutter/material.dart';
class CustomButton extends StatefulWidget {
  String title;
  Function() onPressed;
  CustomButton({
    super.key,
    required this.title,
    required this.onPressed
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(left:8.0,right: 10,top: 50),
      child: SizedBox(
        width: 200,
        height: MediaQuery.of(context).size.height/20,
        child: ElevatedButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white),
            shadowColor:  MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          ),
          child: Text(widget.title),
          onPressed: widget.onPressed,
        ),
      )
    );
  }
}