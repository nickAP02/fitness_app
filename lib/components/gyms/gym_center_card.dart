import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'gym_center_details.dart';

// ignore: must_be_immutable
class GymCenter extends StatelessWidget {
  String title;
  String description;
  String localisation;
  String longitude;
  String latitude;
  String image;
  GymCenter({
    super.key,
    required this.title,
    required this.description,
    required this.localisation,
    required this.longitude,
    required this.latitude,
    required this.image
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context)=> GymCenterDetails(
                title: title,
                desc: description,
                localisation: localisation,
                longitude:longitude ,
                latitude: latitude,
                image: image,
              )
            ),
          );
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10,right: 5),
        height: 180,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppColors.primaryColor
          ),
          image: DecorationImage(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5),
              BlendMode.darken,
            ),
            fit: BoxFit.cover,
            scale: 1,
            opacity: 1,
            image: AssetImage(image)
            // image: Image.network(image) as ImageProvider
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                description,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                localisation,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}