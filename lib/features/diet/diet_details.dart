import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../components/reusable/custom_appbar.dart';
import '../../components/reusable/header.dart';

// ignore: must_be_immutable
class DietDetails extends StatefulWidget {
  DietDetails({
    super.key,
    required this.title,
    required this.description,
    required this.calory,
    required this.category,
    required this.image
  });
  String title;
  String description;
  double calory;
  String category;
  String image;
  @override
  State<DietDetails> createState() => _DietDetailsState();
}

class _DietDetailsState extends State<DietDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:buildAppBar(widget.title, context),
      body:CustomScrollView(
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
                    text: "Calories",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        widget.calory.toString(),
                      ),
                      const Text(
                        "kCal",
                      ),
                    ],
                  ),
                  // ActionChip(
                  //   onPressed: () {
                  //     openMap(
                  //       double.parse(widget.latitude),
                  //       double.parse(widget.longitude),
                  //     );
                  //   },
                  //   avatar: const Icon(Icons.map_outlined),
                  //   label: const Text("Ouvrir dans Google Maps"),
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
    );
  }
}