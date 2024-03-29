import 'dart:async';
import 'dart:developer';

import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../components/reusable/bottom_navbar.dart';
import '../../../components/reusable/custom_appbar.dart';

// ignore: must_be_immutable
class ExerciseStartup extends StatefulWidget {
  String description;
  dynamic time;
  String category;
  String image;
 
  ExerciseStartup({
    super.key,
    required this.description,
    required this.time,
    required this.category,
    required this.image,
  });
  @override
  State<ExerciseStartup> createState() => ExerciseStartupState();
}
class ExerciseStartupState extends State<ExerciseStartup> {
  int minute=0;
  int sec=0;
  bool isRunning=false;
  Timer? timer;
  
  void startTimer(){
    setState(() {
      isRunning=true;
    });
    timer = Timer.periodic(const Duration(seconds: 1), (timer) { 
      setState(() {
        if(sec>0){
          sec--;
        }else{
          if(widget.time>0){
            widget.time--;
            sec=59;
          }else{
            isRunning=false;
            timer.cancel();
          }
        }
      });
    });
  }
  void pauseTimer(){
    setState(() {
      isRunning = false;
    });
    timer?.cancel();
  }
  void cancelTimer(){
    setState(() {
      widget.time = 0;
      sec = 0;
      isRunning = false;
    });
    timer?.cancel();
  }


  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(widget.description, context),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:5,left: 20,right: 20,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 30,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: const Center(
                        child: Text(
                          "Sprint rapide",
                          style: TextStyle(
                            fontSize: AppConstants.fontSize_10,
                            color: AppColors.primaryColor
                          )
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          widget.category,
                          style: const TextStyle(
                            // backgroundColor: primaryColor,
                            fontSize: AppConstants.fontSize_10,
                            color: Colors.white
                          ),
                      ),
                        // const Text(
                        //   "250 kCal",
                        //   style: TextStyle(
                        //     fontSize: 20,
                        //     color: AppColors.primaryColor
                        //   )
                        // ),
                      ],
                    ),
                        
                    ],
                  ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:20.0,right: 10,left: 10),
                child: Container(
                  height: 500,
                  width: 400,
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5),
                          BlendMode.darken,
                        ),
                      fit: BoxFit.cover,
                      scale: 1,
                      opacity: 1,
                      image: AssetImage(widget.image)
                    ),
                  ),
                  child:Padding(
                    padding: const EdgeInsets.only(top:95,),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            log("tap");
                            if (isRunning) {
                              pauseTimer();
                            } else {
                              startTimer();
                            }
                          },
                          onDoubleTap: (){
                            log("double tap");
                            if (isRunning) {
                              pauseTimer();
                            } else {
                              cancelTimer();
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 5,top: 95),
                                child: Text(
                                  '${widget.time.toString().padLeft(2,'0')}:${sec.toString().padLeft(2,'0')}',
                                  style: const TextStyle(
                                    // backgroundColor: primaryColor,
                                    fontSize: AppConstants.fontSize_80,
                                    color: AppColors.primaryColor
                                  ),
                                ),
                              ),
                            ],
                          ),
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
      bottomNavigationBar: BottomNavBar(isUser: true,)
    );
  }
  @override
  void dispose() {
    if (timer != null) {
      timer!.cancel();
    }
    super.dispose();
  }
}