import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitness_app/features/diet/diet_card.dart';
import 'package:fitness_app/features/diet/diet_list.dart';
import 'package:fitness_app/features/exercise/presentation/exercise_card.dart';
import 'package:fitness_app/features/plans/plan_card.dart';
import 'package:fitness_app/features/config/presentation/gym_center_card.dart';
import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:fitness_app/utils/images.dart';
import 'package:fitness_app/utils/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/domain/partner.dart';
import '../exercise/domain/exercise.dart';
import '../diet/domain/diet.dart';
import '../../models/category.dart';
import '../../utils/colors.dart';
import '../exercise/presentation/exercice_list.dart';



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
  int notificationCount=0;
  String username="";
  List exportData = [];
  String? welcomeText;
  var resultsData;
  List initialDietData = [];
  List initialExerciceData = [];
  List<Widget> results = [];
  TextEditingController controller = TextEditingController();
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notificationCount = prefs.getInt("notification_count")??0;
    username = prefs.getString("username")??"User";
  }
  @override
  void initState() {
    super.initState();
    results.clear();
    loading = true;
    partnerEntities.addAll(
      [
        PartnerEntity(
          partnerId: 1,
          name:'Oxy gym',
          description: 'Oxy gym est un centre de remise en forme lorum ipsum dolor aet idont know',
          avatar: AppImages.planSample1,
          isMerchant: 1,
          phoneNumber: "",
          subscriptionId: 0,
          city: 'Klikamé',
          isUser: true
        ),
        PartnerEntity(
          partnerId: 2,
          name:'Fitness lab',
          description: 'Espace de gymnatique-activité principales zumba, musculation, remise en forme etc ...',
          avatar: AppImages.planSample2,
          isMerchant: 1,
          phoneNumber: "",
          subscriptionId: 0,
          city: 'Adidogomé', 
          isUser: false
        ),
      ]
    );
    for(var cpt=0;cpt<partnerEntities.length;cpt++){
      if(partnerEntities[cpt].isMerchant==0){
        gyms.add(
          GymCenter(
            title: partnerEntities[cpt].name!,
            description: partnerEntities[cpt].description!, 
            localisation: partnerEntities[cpt].city!, 
            image: partnerEntities[cpt].avatar!
          )
        );
      }
      else{
        gyms.add(
          GymCenter(
            title: partnerEntities[cpt].name!,
            description: partnerEntities[cpt].description!, 
            localisation: partnerEntities[cpt].city!, 
            image: partnerEntities[cpt].avatar!
          )
        );

      }
    }
    
    exerciseEntities.addAll(
      [
        ExerciseEntity(
          exerciseId:1,
          title:"Sprint rapide",
          description:"Course rapide",
          time: 5,
          illustration: AppImages.exerciceSample1,
          planId: CategoryEntity(
            categoryId: 1,
            description: "Maintien du corps",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exerciseId:2,
          title:"Pompes",
          description:"Pompes alternées",
          time: 10,
          illustration: AppImages.exerciceSample2,
          planId: CategoryEntity(
            categoryId: 1,
            description: "Maintien du corps",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exerciseId:3,
          title:"Pompes",
          description:"Pompes avec bras largement étendues",
          time: 10,
          illustration: AppImages.exerciceSample2,
          planId: CategoryEntity(
            categoryId: 2,
            description: "Perte de poids",
            illustration: AppImages.exerciceSample1
          )
        ),
        ExerciseEntity(
          exerciseId:4,
          title:"Saut à la corde",
          description:"Saut à la corde pour améliorer le cardio",
          time: 10,
          illustration: AppImages.exerciceSample2,
          planId: CategoryEntity(
            categoryId: 2,
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
          dietId: 1,
          title: "Salade viet",
          description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
          planId: CategoryEntity(
            categoryId: 1, 
            description: "Maintien du corps", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
        DietEntity(
          dietId: 2,
          title: "Salade viet",
          description: "Salade viet composée de gingembre, d'oignons, de ciboule, de comcombre et de tomates fraiches", 
          planId: CategoryEntity(
            categoryId: 2, 
            description: "Perte du poids", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
        DietEntity(
          dietId: 3,
          title: "Plat 3",
          description: "Contenu plat 3", 
          planId: CategoryEntity(
            categoryId: 1, 
            description: "Maintien du corps", 
            illustration: AppImages.dietSample1
          ), 
          calory: 120, 
          illustration: AppImages.dietSample1
        ),
        DietEntity(
          dietId: 4,
          title: "Plat 4",
          description: "Contenu plat 4", 
          planId: CategoryEntity(
            categoryId: 2, 
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
          categoryId: 1,
          description:"Maintien du corps",
          illustration: AppImages.planSample1
        ),
        CategoryEntity(
          categoryId: 2,
          description:"Perte de poids",
          illustration: AppImages.planSample2
        ),
      ]
    );
    for (var i = 0; i < planEntities.length; i++) {
      for (var j = 0; j < exerciseEntities.length; j++) {
        if(exerciseEntities[j].planId?.categoryId==planEntities[i].categoryId){
          planExercises.add(exerciseEntities[j]);
        }
        
      }
      for (var k = 0; k < dietEntities.length; k++) {
        if(dietEntities[k].planId!.categoryId==planEntities[i].categoryId){
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
    welcomeText = "Bienvenue $username parmi la communauté !";
    double hauteur = MediaQuery.of(context).size.height;
    double largeur = MediaQuery.of(context).size.width;
    return Scaffold(
      
      // drawer: const Drawer(
      //   child: AppDrawer(),
      // ),
      body: loading? SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppConstants.padding_20),
              child: Text(
                  welcomeText!,
                  style: const TextStyle(
                    color: AppColors.primaryColor
                  ),
                ),
            ),
            notificationCount>0 ?
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
                      notificationCount.toString(),
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
          ),
          ],
        ),
        const SizedBox(height:20),
        Padding(
          padding: const EdgeInsets.only(top:15.0,right: 0,left: 0),
          child: SearchAnchor(
              builder: (context,searchController){
                return SearchBar(
                  leading: const Icon(Icons.search),
                  constraints: const BoxConstraints(minWidth: 10),
                  backgroundColor: MaterialStateProperty.all(AppColors.primaryTextColor),
                  hintStyle: MaterialStateProperty.all(
                    const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppConstants.fontSize_20
                    )
                  ),
                  elevation: MaterialStateProperty.all(largeur),
                  hintText: "Rechercher...",
                  // controller: searchController,
                  onTap: (){
                    searchController.openView();
                    results.clear();
                  },
                  onChanged: (search){
                    if(search.isNotEmpty){
                      if (kDebugMode) {
                        print("search $search");
                      }
                      if (kDebugMode) {
                        print("results ${results.length}");
                      }
                      // results.clear();
                      for (var element in dietEntities) {
                        if(element.title!.contains(search.toLowerCase())&&element.description!.contains(search.toLowerCase())){
                          results.add(
                            Diet(data: element)
                          );
                        }
                        if (kDebugMode) {
                          print("element $element");
                        }
                      }
                      for (var element in exerciseEntities) {
                        if(element.title!.contains(search.toLowerCase())&&element.description!.contains(search.toLowerCase())){
                          results.add(
                            Exercice(
                              exercise: element,
                            )
                          );
                          // print("element ${element}");
                          if (kDebugMode) {
                            print("results $results");
                          }
                        }
                      }
                    }else{
                      results=[];
                    }
                  },
                );
              },
              isFullScreen: false,
              viewElevation: hauteur,
              viewBackgroundColor: AppColors.primaryTextColor,
              suggestionsBuilder: (context,searchController)=>{
                results==[] ?
                const Center(
                  child: Text("Rien à afficher"),
                ):GridView.count(
                  crossAxisCount: 2,
                  scrollDirection: Axis.vertical,
                  children: results,
                )
              }
            )
        ),
        Padding(
          padding: const EdgeInsets.all(AppConstants.padding_10),
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
              padding: EdgeInsets.only(top:AppConstants.padding_10,left: AppConstants.padding_10),
              child: Text(
                "Exercices",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppConstants.fontSize_15,
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
                padding: EdgeInsets.all(AppConstants.padding_15),
                child: Text(
                  "Voir tout",
                  style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: AppConstants.fontSize_10,
                    ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: hauteur*0.2,
          width: largeur,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
            children: exercices.toList(),
          ),
        ),
        const SizedBox(
          height: AppConstants.padding_20,
        ),
        const Padding(
          padding: EdgeInsets.only(
            left: AppConstants.padding_10,
            right: AppConstants.padding_5,
            top: AppConstants.padding_10),
          child: Text(
            "Découvrez des entraînements",
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: AppConstants.fontSize_15,
            ),
          ),
        ),
        SizedBox(
          height: hauteur*0.2,
          width: largeur,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
            children: plans.toList(),
          ),
        ),
        const SizedBox(
          height: AppConstants.padding_20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                top:AppConstants.padding_10,
                left: AppConstants.padding_15),
              child: Text(
                "Nutrition",
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: AppConstants.fontSize_15,
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
                padding: EdgeInsets.all(AppConstants.padding_15),
                child: Text(
                  "Voir tout",
                  style: TextStyle(
                      color: Color.fromRGBO(229, 190, 236, 1),
                      fontSize: AppConstants.fontSize_10,
                    ),
                ),
              ),
            ),
            ],
          ),
          SizedBox(
            height: hauteur*0.2,
            width: largeur,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              // padding: const EdgeInsets.only(left: 10,right: 15,top: 10),
              children: diets.toList(),
            ),
          ),
          const SizedBox(
            height: AppConstants.padding_20,
          ),
        ],
        ),
      )
      :const Center(
        child: CircularProgressIndicator(color: AppColors.primaryColor,)
      ),
      bottomNavigationBar: BottomNavBar(isUser: true,),
    );
  }
}