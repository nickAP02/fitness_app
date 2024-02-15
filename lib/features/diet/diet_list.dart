import 'package:fitness_app/features/diet/diet_card.dart';
import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:flutter/material.dart';

import 'domain/diet.dart';

// ignore: must_be_immutable
class Diets extends StatefulWidget {
  List<DietEntity> data;
  Diets({
    super.key,
    required this.data
  });

  @override
  State<Diets> createState() => _DietsState();
}

class _DietsState extends State<Diets> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Liste des diets", context),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: widget.data.length, 
        itemBuilder: (context, index) {
          return Diet(
            data: widget.data[index],
          );
        },
      ),
    );
  }
}