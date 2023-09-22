import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../reusable/header.dart';

// ignore: must_be_immutable
class GymCenterDetails extends StatefulWidget {
  String title;
  String desc;
  String localisation;
  String longitude;
  String latitude;
  String image;
  GymCenterDetails({
    super.key,
    required this.title,
    required this.desc,
    required this.localisation,
    required this.longitude,
    required this.latitude,
    required this.image
  });

  @override
  State<GymCenterDetails> createState() => _GymCenterDetailsState();
}

class _GymCenterDetailsState extends State<GymCenterDetails> {
  ScrollController? _scrollController;
  openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    // if (await canLaunch(googleUrl)) {
    //   await launch(googleUrl);
    // } else {
    //   throw 'Impossible d\'ouvrir Google Maps';
    // }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              bottom:PreferredSize(
                preferredSize: const Size.fromHeight(1.0),
                child: Container(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ),
              elevation: 0,
              centerTitle: true,
              leading: IndexedSemantics(
                index: 0,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new,
                      color: AppColors.secondaryColor),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              backgroundColor:AppColors.primaryColor,
              pinned: true,
              expandedHeight: 275,
              title: Text(
                widget.title.length > 25
                    ? "${widget.title.substring(0, 25)}..."
                    : widget.title,
                style: const TextStyle(
                  color: AppColors.primaryTextColor
                ),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: Image.asset(widget.image)
                // Image.network(
                //   widget.image,
                //   fit: BoxFit.cover,
                //   height: 100,
                //   width: 100,
                // ),
              ),
            ),
          ];
        },
        body: CustomScrollView(
          scrollBehavior: const MaterialScrollBehavior(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              sliver: SliverToBoxAdapter(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(
                    text: "Localisation",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.localisation,
                  ),
                  ActionChip(
                    onPressed: () {
                      openMap(
                        double.parse(widget.latitude),
                        double.parse(widget.longitude),
                      );
                    },
                    avatar: const Icon(Icons.map_outlined),
                    label: const Text("Ouvrir dans Google Maps"),
                  ),
                  Header(
                    text: "Description",
                  ),
                  Container(
                    color: AppColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(widget.desc)
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
      ),

    );
  }
}