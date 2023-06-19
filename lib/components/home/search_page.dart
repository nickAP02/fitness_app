import 'package:fitness_app/components/reusable/bottom_navbar.dart';
import 'package:fitness_app/utils/constant.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:45.0,right: 45,left: 45),
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: primaryColor
                ),
                borderRadius: BorderRadius.circular(30)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right:100,top: 10),
            child: Container(
              width: MediaQuery.of(context).size.width/6,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: primaryColor
                ),
                borderRadius: BorderRadius.circular(30)
              ),
              child: Text(
                "Pour toi",
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 10
                ),
                ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}