
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../reusable/bottom_navbar.dart';
import '../reusable/custom_appbar.dart';
import '../reusable/header.dart';

// ignore: must_be_immutable
class ExerciseDetail extends StatefulWidget {
  String title;
  String description;
  dynamic time;
  String category;
  String image;
 
  ExerciseDetail({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.category,
    required this.image,
  });
  @override
  State<ExerciseDetail> createState() => ExerciseDetailState();
}
class ExerciseDetailState extends State<ExerciseDetail> {
  
  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(widget.title, context),
      body: CustomScrollView(
          scrollBehavior: const MaterialScrollBehavior(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              sliver: SliverToBoxAdapter(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(widget.image),
                  Header(
                    text: "Catégorie",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.category.toString(),
                  ),
                  Header(
                    text: "Durée",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${widget.time} min',
                  ),
                  // Header(
                  //   text: "Calories",
                  // ),
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       widget.calory.toString(),
                  //     ),
                  //     const Text(
                  //       "kCal",
                  //     ),
                  //   ],
                  // ),
                  Header(
                    text: "Description",
                  ),
                  Container(
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(widget.description)
                      // HtmlWidget(
                      //   widget.desc,
                      // ),
                    ),
                  )
                ],
              )),
            ),
          ],
        ),
      bottomNavigationBar: BottomNavBar(isUser: true,)
    );
  }
}