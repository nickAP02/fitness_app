import 'package:fitness_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reusable/custom_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  late final SharedPreferences prefs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Notifications", context),
      body: ListView.builder(
        itemBuilder: (context, index){
          prefs.setInt("notification_count",index);
          return ListTile(
            title: Text("Notif ${index+1}"),
            subtitle: Text("Some shitty content"),
          );
        },
      ),
    );
  }
}