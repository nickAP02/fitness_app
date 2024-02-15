import 'package:flutter/material.dart';

import '../../components/reusable/menu_item.dart';

class HomePartner extends StatefulWidget {
  const HomePartner({super.key});

  @override
  State<HomePartner> createState() => _HomePartnerState();
}

class _HomePartnerState extends State<HomePartner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        children: [
          MenuCard(title: "Ajouter un exercice"),
          MenuCard(title: "Créer un entraînement"),
          MenuCard(title: "Ajouter un conseil diététique"),
        ],
      ),
    );
  }
}