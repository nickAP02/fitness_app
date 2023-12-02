import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:flutter/material.dart';

class PartnerSignUp extends StatefulWidget {
  const PartnerSignUp({super.key});

  @override
  State<PartnerSignUp> createState() => _PartnerSignUpState();
}

class _PartnerSignUpState extends State<PartnerSignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Inscription", context),
      body: Center(
        child: Text("En cours de développement ")
      ),
    );
  }
}