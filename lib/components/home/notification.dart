import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reusable/custom_appbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  // ignore: non_constant_identifier_names
  int notif_count =0;
  void getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    notif_count = prefs.getInt("notification_count")??0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Notifications", context),
      body: notif_count!=0? ListView.builder(
        itemCount: notif_count,
        itemBuilder: (context, index){
          return ListTile(
            title: Text("Notif $index"),
            subtitle: Text("Contenu notif $index"),
            onTap: (){
              setState(() {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Notif $index cliqué")));
                
              });
            },
          );
        },
      ):
      const NoNotification(),
    );
  }
}
class NoNotification extends StatelessWidget {
  const NoNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Aucune notification pour le moment"));
  }
}