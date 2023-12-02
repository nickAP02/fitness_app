import 'dart:convert';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/components/diets/diet_card.dart';
import 'package:fitness_app/components/diets/diet_list.dart';
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
import '../exercises/exercice_list.dart';
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
  List<Exercice> exercices = [];
  List<Diet> diets = [];
  List<Plan> plans = [];
  List<PartnerEntity> partnerEntities = [];
  List<ExerciseEntity> exerciseEntities = [];
  List<CategoryEntity> planEntities = [];
  List<DietEntity> dietEntities = [];
  List<ExerciseEntity> planExercises = [];
  List<DietEntity> planDiets = [];
  int _current = 0;
  int notification_count=0;
  String username="";
  List exportData = [];
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notification_count = prefs.getInt("notification_count")??0;
    username = prefs.getString("username")??"User";
    prefs.setInt("partners",partnerEntities.length);
    prefs.setInt("exercises", exerciseEntities.length);
    prefs.setInt("diets",dietEntities.length);
    prefs.setString("exercice_list", json.encode(exerciseEntities));
    prefs.setString("diet_list", json.encode(dietEntities));
    prefs.setString("search_data", json.encode(exportData));
  }
  @override
  void initState() {
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
    
    exerciseEntities.addAll(
      [
        ExerciseEntity(
          exercise_id:1,
          title:"Sprint rapide",
          description:"Course rapide",
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
          description:"Pompes alternées",
          time: 10,
          illustration: AppImages.exerciceSample2,
          plan_id: CategoryEntity(
            category_id: 1,
            description: "Maintien du corps",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exercise_id:3,
          title:"Pompes",
          description:"Pompes avec bras largement étendues",
          time: 10,
          illustration: AppImages.exerciceSample2,
          plan_id: CategoryEntity(
            category_id: 2,
            description: "Perte de poids",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exercise_id:4,
          title:"Saut à la corde",
          description:"Saut à la corde pour améliorer le cardio",
          time: 10,
          illustration: AppImages.exerciceSample2,
          plan_id: CategoryEntity(
            category_id: 2,
            description: "Perte de poids",
            illustration: AppImages.exerciceSample1
          )
        ),
      ]
    );
    for (var i = 0; i < exerciseEntities.length; i++) {
      exercices.add(
        Exercice(
          exercise: exerciseEntities[i],
        )
      );
    }
    
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
        DietEntity(
          diet_id: 3,
          title: "Plat 3",
          description: "Contenu plat 3", 
          plan_id: CategoryEntity(
            category_id: 1, 
            description: "Maintien du corps", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
        DietEntity(
          diet_id: 4,
          title: "Plat 4",
          description: "Contenu plat 4", 
          plan_id: CategoryEntity(
            category_id: 2, 
            description: "Perte du poids", 
            illustration: AppImages.dietSample2
          ), 
          calory: 120, 
          illustration: AppImages.dietSample2
        ),
      ]
    );
    for (var i = 0; i < dietEntities.length; i++) {
      diets.add(
        Diet(
          data: dietEntities[i],
        )
      );
    }
    planEntities.addAll(
      [
        CategoryEntity(
          category_id: 1,
          description:"Maintien du corps",
          illustration: AppImages.planSample1
        ),
        CategoryEntity(
          category_id: 2,
          description:"Perte de poids",
          illustration: AppImages.planSample2
        ),
      ]
    );
    for (var i = 0; i < planEntities.length; i++) {
      for (var j = 0; j < exerciseEntities.length; j++) {
        if(exerciseEntities[j].plan_id?.category_id==planEntities[i].category_id){
          planExercises.add(exerciseEntities[j]);
        }
        
      }
      for (var k = 0; k < dietEntities.length; k++) {
        if(dietEntities[k].plan_id!.category_id==planEntities[i].category_id){
          planDiets.add(dietEntities[k]);
        }
      }
      plans.add(
        Plan(
          plan: planEntities[i], 
          exercices: planExercises, 
          diets: planDiets
        )
      );
    }
    exportData = [dietEntities,exerciseEntities];
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Exercices(
                        data: exerciseEntities,
                      ),)
                    );
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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: exercices.toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10,right: 5,top: 10),
              child: Text(
                "Découvrez des plans",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 15,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: plans.toList(),
              ),
            ),
            SizedBox(
              height: 20,
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
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Diets(
                        data: dietEntities,
                      ),)
                    );
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
            SizedBox(
              height: MediaQuery.of(context).size.height*0.2,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
                children: diets.toList(),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ):const Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

