
import 'package:flutter/material.dart';
// ignore: must_be_immutable
class CustomButton extends StatelessWidget{
  String title;
  double? size;
  Function() onPressed;
  FocusNode focus;
  CustomButton({
    super.key,
    required this.title,
    required size,
    required this.onPressed,
    required this.focus
  });
  @override
  Widget build(BuildContext context) {
    return
    Padding(
      padding: const EdgeInsets.only(left:8.0,right: 10,top: 50),
      child: SizedBox(
        width: size,
        height: 50,
        child: ElevatedButton(
          focusNode:focus,
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.white),
            // shadowColor:  MaterialStateProperty.all(Colors.white),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.transparent)
              )
            ),
          ),
          onPressed: onPressed,
          child: Text(title),
        ),
      )
    );
  }
}