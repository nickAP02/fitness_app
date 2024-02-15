import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:flutter/material.dart';

class UserParams extends StatefulWidget {
  const UserParams({super.key});

  @override
  State<UserParams> createState() => _UserParamsState();
}

class _UserParamsState extends State<UserParams> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Informations personnelles", context),
      body: Column(
        children: [
        Column(
          children: [
            ListTile(
              leading: const Icon(Icons.data_array_rounded),
              title:Text("Taille : ",
                style: Theme.of(context).textTheme.headlineMedium
              ),
            ),
            const Text("1m80"),
            ListTile(
              leading: const Icon(Icons.data_array_rounded),
              title:Text("Poids : ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const Text("80 kg"),
            ListTile(
            leading: const Icon(Icons.bolt),
            title: Text(
              "Objectif actuel",
              style:Theme.of(context).textTheme.headlineMedium),
            ),
            const Text("Perte de pois")
          ],
        ),
      ],
    )
  );
  }
}