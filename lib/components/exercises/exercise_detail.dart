import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExerciseDetail extends StatefulWidget {
  String description;
  double time;
  String category;
  String image;
  void timerDecount(timer) {
    timer = time;
    for (var i = 0; i < timer; i++) {
      timer--;
    }
  }
  ExerciseDetail({
    super.key,
    required this.description,
    required this.time,
    required this.category,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Exercice",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 15,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: primaryColor
                        ),
                        color: primaryColor,
                      ),
                      height: 30,
                      width: 68,
                      child: Center(
                        child: Text(
                          category,
                          style: const TextStyle(
                            // backgroundColor: primaryColor,
                            fontSize: 7,
                            color: Colors.white
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0,right: 10,left: 10),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                      fit: BoxFit.cover,
                      scale: 1,
                      opacity: 1,
                      image: AssetImage(assetUrl+image)
                    ),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top:95,),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5,top: 95),
                              child: Text(
                                time.toInt().toString(),
                                style: const TextStyle(
                                  // backgroundColor: primaryColor,
                                  fontSize: 80,
                                  color: primaryColor
                                ),
                              ),
                            ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 25,top: 95),
                            //   child: Text(
                            //     ":",
                            //     style: TextStyle(
                            //       // backgroundColor: primaryColor,
                            //       fontSize: 80,
                            //       color: primaryColor
                            //     ),
                            //   ),
                            // ),
                            // Padding(
                            //   padding: EdgeInsets.only(left: 25,top: 95),
                            //   child: Text(
                            //     "00",
                            //     style: TextStyle(
                            //       // backgroundColor: primaryColor,
                            //       fontSize: 80,
                            //       color: primaryColor
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomAppBar()
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}