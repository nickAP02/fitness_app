import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class RemoteStorage {
  RemoteStorage._();
  //db initialization
  final FirebaseFirestore db = FirebaseFirestore.instance;
  // data insertion
  Future<void> create(String table,data) async{
    CollectionReference ref = db.collection(table);
    ref.add(data).then((value) => log("$value added"))
    .catchError((error)=> log("Failed to add data: $error"));
  }
  // get data by id
  Future<dynamic> getDataById(int id,String table) async{
    CollectionReference ref = db.collection(table);
    return ref.doc(id.toString());
  }
  // update data by id
  Future<dynamic> update(int id,String table,updateData) async{
    CollectionReference ref = db.collection(table);
    return ref.doc(id.toString()).update(updateData);
    // .then((value) => log("user added"))
    // .catchError((error)=> log("Failed to add user: $error"));
  }
  // delete data by id
  Future<void> delete(int id,String table) async{
    CollectionReference ref = db.collection(table);
    ref.doc(id.toString()).delete();
    log("data deleted");
  }
}