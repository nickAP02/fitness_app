import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/exercises/exercise_detail.dart';
import 'package:fitness_app/components/plans/plan_card.dart';
import 'package:fitness_app/components/gyms/gym_center.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/service/local_storage.dart';
import 'package:fitness_app/utils/app_theme.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/colors.dart';
import '../diets/diet_details.dart';
import '../reusable/app_drawer.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController _controller = CarouselController();
  bool loading = false;
  List<GymCenter> gyms = [];
  int _current = 0;
  int notification_count=0;
  void getUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notification_count = prefs.getInt("notification_count")!;
  }
  @override
  void initState() {
    super.initState();
    loading = true;
    gyms.addAll(
      [
      GymCenter(
        title: 'Oxy gym',
        description: 'Oxy gym est un centre de remise en forme lorum ipsum dolor aet idont know',
        localisation: 'Bè-klikamé 10m après le début des rails',
        longitude: '27"57"43ABCDE',
        latitude: '45UVWXZ34',
        image: AppImages.planSample1,
      ),
      GymCenter(
        title: 'Fitness lab',
        description: 'Espace de gymnatique-activité principales zumba, musculation, remise en forme etc ...',
        localisation: 'Adidogomé',
        longitude: 'azert1234àç_è',
        latitude: 'ydiuzu24567hkg',
        image: AppImages.planSample2,
      ),
    ]);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: AppTheme.theme.scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "MyFitness App",
          style: TextStyle(
            color: AppColors.primaryTextColor
          ),
        ),
        actions: [
          notification_count>0 ?
          Stack(
            children: [
              IconButton(
                onPressed: (){
                  log("icone notif");
                  Navigator.of(context).pushNamed(AppRoutes.NOTIFICATION);
                }, 
                icon:const Icon(
                  Icons.notifications,
                  color: AppColors.secondaryColor,
                )
              ),
              Positioned(
                top: 0,
                right: 3,
                child: Container(
                  padding: const EdgeInsets.only(top:2,right: 4,left: 4,bottom: 4),
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(
                    color: AppColors
                        .primaryColor, // Couleur du cercle de notification
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                    notification_count.toString(),
                    style: TextStyle(
                      color: AppColors.primaryTextColor
                    ),
                    ),
                  )
                ),
              ),
            ]
          ):
          const Icon(
            Icons.notifications,
            color: AppColors.secondaryColor,
          )
        ],
      ) ,
      drawer: const Drawer(
        child: AppDrawer(),
      ),
      body: loading? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const ListTile(
            //   leading: Icon(
            //       Icons.bolt,
            //       color: Colors.white,
            //   ),
            //   title: Text(
            //     "Objectif actuel",
            //     style: TextStyle(
            //       color: AppColors.primaryColor
            //     ),
            //   ),
            // ),
            // const Text(
            //     'Maintien du corps',
            //     style: TextStyle(
            //       color: AppColors.primaryColor
            //     ),
            //   ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                  "Gyms ou coachs personnels proches de vous",
                  style: TextStyle(
                    color: AppColors.primaryColor
                  ),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CarouselSlider(
                items: gyms,
                carouselController: _controller,
                options:CarouselOptions(
                  enlargeCenterPage: false,
                  autoPlay: true,
                  viewportFraction: 0.9,
                  autoPlayInterval:
                      const Duration(seconds: 5),
                  height: 180,
                  autoPlayAnimationDuration:
                      const Duration(seconds: 2),
                  aspectRatio: 2.0,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: gyms.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () =>
                      _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor.withOpacity(
                            _current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:8.0,left: 15),
                  child: Text(
                    "Exercices",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log("liste des exercices");
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.EXERCICES, (route) => false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Voir tout",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 8,
                        ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> ExerciseDetail(
                            description: "Sprint rapide",
                            time: 5,
                            category: "Maintien du corps",
                            image: AppImages.exerciceSample1,
                          )
                        ),
                      );
                    },
                    child: Exercice(
                      description: "Sprint rapide", 
                      time: 5, 
                      category: "Maintien du corps", 
                      image: AppImages.exerciceSample1
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> ExerciseDetail(
                            description: "Sprint rapide",
                            time: 10,
                            category: "Maintien du corps",
                            image:  AppImages.exerciceSample1,
                          )
                        ),
                      );
                    },
                    child: Exercice(
                      description: "Sprint rapide", 
                      time: 10, 
                      category: "Maintien du corps", 
                      image: AppImages.exerciceSample1
                    ),
                  ),
                ],
              ),
            ),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10,right: 5,top: 10),
                  child: Text(
                    "Plans",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log("liste des plans");
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Voir tout",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 8,
                        ),
                    ),
                  ),
                ),
              ],
            ),
            Plan(
              title: 'PERTE DE POIDS',
              image: AppImages.planSample2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top:8.0,left: 15),
                  child: Text(
                    "Nutrition",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 15,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log("liste des diets");
                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.NUTRITION, (route) => false);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      "Voir tout",
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 8,
                        ),
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: [
                  GestureDetector(
                    onTap:(){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context)=> DietDetails(
                            description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches",
                            calory: 120,
                            category: "Maintien du corps",
                            image:  AppImages.dietSample1,
                          )
                        ),
                      );
                    },
                    child: Diet(
                      description: "Salade viet", 
                      calory: 120, 
                      category: "Maintien du corps", 
                      image: AppImages.dietSample1
                    ),
                  ),
                  Diet(
                    description: "Salade viet", 
                    calory: 120, 
                    category: "Maintien du corps", 
                    image: AppImages.dietSample1
                  ),
                ],
              ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

