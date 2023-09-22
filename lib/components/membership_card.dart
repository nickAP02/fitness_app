import 'package:fitness_app/components/reusable/custom_appbar.dart';
import 'package:fitness_app/utils/colors.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

class MembershipCard extends StatefulWidget {
  const MembershipCard({super.key});

  @override
  State<MembershipCard> createState() => _MembershipCardState();
}

class _MembershipCardState extends State<MembershipCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Carte de membre", context),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            FlipCard(
              front: buildCardFace(context),
              back: buildCardBack(context)
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCardFace(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.height/2,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: RadialGradient(
            radius: 0.8,
            colors: [
              AppColors.secondaryColor.withGreen(5),
              AppColors.primaryColor,
          ],
          )
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left:38.0,top: 18),
              child: Row(
                children: [
                  Text("Nom : ") ,
                  Text("Nicole")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:38.0,top: 18),
              child: Row(
                children: [
                  Text("Email : ") ,
                  Text("nicoleapaflo@gmail.com")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:38.0,top: 18),
              child: Row(
                children: [
                  Text("Localisation : ") ,
                  Text("Lomé, Togo")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:38.0,top: 18),
              child: Row(
                children: [
                  Text("Objectifs : ") ,
                  Text("Perte de poids")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left:220.0,top: 30),
              child: Row(
                children: [
                  Text("MyFit ",style: TextStyle(fontWeight: FontWeight.bold),) ,
                  Text("PREMIUM ",style: TextStyle(fontWeight: FontWeight.bold),) ,
                ],
              ),
            ),
          ],
        ),
      );
  }
}
Widget buildCardBack(BuildContext context) {
  return Container(
      height: 200,
      width: MediaQuery.of(context).size.height/2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: RadialGradient(
          radius: 0.8,
          colors: [
            AppColors.secondaryColor.withGreen(1),
            AppColors.primaryColor,
        ],
        )
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left:38.0,top: 18),
            child: Row(
              children: [
                Text("Taille : ") ,
                Text("1m80")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:38.0,top: 18),
            child: Row(
              children: [
                Text("Poids actuel : ") ,
                Text("100 kg")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:38.0,top: 18),
            child: Row(
              children: [
                Text("Dernier objectif atteint : ") ,
                Text("Perte de 20 kg")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:38.0,top: 18),
            child: Row(
              children: [
                Text("Dernier centre sportif visité : ") ,
                Text("Oxy gym")
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left:220.0,top: 30),
            child: Row(
              children: [
                Text("MyFit ",style: TextStyle(fontWeight: FontWeight.bold),) ,
                Text("PREMIUM ",style: TextStyle(fontWeight: FontWeight.bold),) ,
              ],
            ),
          ),
        ],
      ),
    );
}
