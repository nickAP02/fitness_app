import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/exercises/exercise_card.dart';
import 'package:fitness_app/components/plans/plan_card.dart';
import 'package:fitness_app/components/gyms/gym_center_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/utils/app_theme.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/exercise.dart';
import '../../models/partner.dart';
import '../../models/diet.dart';
import '../../models/category.dart';
import '../../utils/colors.dart';
import '../reusable/app_drawer.dart';
import '../reusable/search_bar.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselController _controller = CarouselController();
  bool loading = false;
  List<GymCenter> gyms = [];
  List<Exercice> exercices = [];
  List<Diet> diets = [];
  List<PartnerEntity> partnerEntities = [];
  List<ExerciseEntity> exerciseEntities = [];
  List<CategoryEntity> planEntities = [];
  List<DietEntity> dietEntities = [];
  int _current = 0;
  int notification_count=0;
  String username="";
  
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notification_count = prefs.getInt("notification_count")??0;
    username = prefs.getString("username")!;
  }
  @override
  void initState() async{
    super.initState();
    loading = true;
    partnerEntities.addAll(
      [
        PartnerEntity(
          partner_id: 1,
          name:'Oxy gym',
          description: 'Oxy gym est un centre de remise en forme lorum ipsum dolor aet idont know',
          avatar: AppImages.planSample1,
          is_merchant: false,
          subscription_id: 0,
          localisation: 'Klikamé'
        ),
        PartnerEntity(
          partner_id: 2,
          name:'Fitness lab',
          description: 'Espace de gymnatique-activité principales zumba, musculation, remise en forme etc ...',
          avatar: AppImages.planSample2,
          is_merchant: true,
          subscription_id: 0,
          localisation: 'Adidogomé'
        ),
      ]
    );
    for(var cpt=0;cpt<partnerEntities.length;cpt++){
      if(partnerEntities[cpt].is_merchant==false){
        gyms.add(
          GymCenter(
            title: partnerEntities[cpt].name!,
            description: partnerEntities[cpt].description!, 
            localisation: partnerEntities[cpt].localisation!, 
            longitude: "0xFbE4", 
            latitude: "0xB5H6", 
            image: partnerEntities[cpt].avatar!
          )
        );
      }
      else{
        gyms.add(
          GymCenter(
            title: partnerEntities[cpt].name!,
            description: partnerEntities[cpt].description!, 
            localisation: partnerEntities[cpt].localisation!, 
            longitude: "0xFbE4", 
            latitude: "0xB5H6", 
            image: partnerEntities[cpt].avatar!
          )
        );

      }
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("partners",partnerEntities.length);
    exerciseEntities.addAll(
      [
        ExerciseEntity(
          exercise_id:1,
          title:"Sprint rapide",
          description:"Maintien du corps",
          time: 5,
          illustration: AppImages.exerciceSample1,
          plan_id: CategoryEntity(
            category_id: 1,
            description: "Maintien du corps",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exercise_id:2,
          title:"Pompes",
          description:"Maintien du corps",
          time: 10,
          illustration: AppImages.exerciceSample2,
          plan_id: CategoryEntity(
            category_id: 1,
            description: "Maintien du corps",
            illustration: AppImages.exerciceSample1
          )
        ),
      ]
    );
    for (var i = 0; i < exerciseEntities.length; i++) {
      exercices.add(
        Exercice(
          description: exerciseEntities[i].description!,
          time: exerciseEntities[i].time, 
          category: exerciseEntities[i].plan_id!.description!, 
          image: exerciseEntities[i].illustration!
        )
      );
    }
    prefs.setInt("exercises", exerciseEntities.length);
    dietEntities.addAll(
      [
       DietEntity(
          diet_id: 1,
          title: "Salade viet",
          description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
          plan_id: CategoryEntity(
            category_id: 1, 
            description: "Maintien du corps", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
        DietEntity(
          diet_id: 2,
          title: "Salade viet",
          description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
          plan_id: CategoryEntity(
            category_id: 2, 
            description: "Perte du poids", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
      ]
    );
    for (var i = 0; i < dietEntities.length; i++) {
      diets.add(
        Diet(
          description: dietEntities[i].description!,
          calory: dietEntities[i].calory!,
          category: dietEntities[i].plan_id!.description!,
          image: dietEntities[i].illustration!,
        )
      );
    }
    prefs.setInt("diets",dietEntities.length);
    getUserData();
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
                    style: const TextStyle(
                      color: AppColors.primaryTextColor
                    ),
                    ),
                  )
                ),
              ),
            ]
          ):
          IconButton(
            icon:const Icon(
              Icons.notifications,
              color: AppColors.secondaryColor
            ),
            onPressed: (){
              log("zero notif");
              Navigator.of(context).pushNamed(AppRoutes.NOTIFICATION);
            },
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
            makeSearchOption(context,
            (){
              setState(() {
                
              });
            },
            (){
              setState(() {
                
              });
            }
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                  "Bienvenue $username parmi la communauté !",
                  style: const TextStyle(
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
                    Navigator.of(context).pushNamed(AppRoutes.EXERCICES);
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
                children: exercices.toList(),
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
              callback: (){
                const SnackBar(content: Text("Vous avez choisi de perdre du poids"));
              },
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
                children: diets.toList(),
              ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

