import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../utils/colors.dart';
import 'local_storage.dart';

class GoogleAuth {

  static SnackBar customSnackBar({required String content}) {
    return SnackBar(
      backgroundColor: Colors.black,
      content: Text(
        content,
        style: const TextStyle(color: AppColors.errorColor, letterSpacing: 0.5),
      ),
    );
  }

  GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount?  signInAccount;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  Future signInWithGoogle()async{
    try {
      signInAccount = await googleSignIn.signIn();
      if(signInAccount!=null){
        CollectionReference ref = db.collection('users');
        ref.add({
          'id': ref.doc().id.substring(0,3),
          'username': signInAccount!.displayName,
          'email': signInAccount!.email,
          'avatar': signInAccount!.photoUrl,
          'lastSeen': DateTime.now()
        }).then((value) => log("user added"))
        .catchError((error)=> log("Failed to add user: $error"));
      }
      return signInAccount;
    } catch (e) {
      log("signin exception $e");
    }
  }

    Future<void> signOutWithGoogle({required BuildContext context}) async {
      try {
        googleSignIn.signOut();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
        GoogleAuth.customSnackBar(
          content: 'Erreur de déconnexion. Veuillez réessayer.',
        ),
      );
      }
      
    } 

    Future<GoogleSignInAccount?> getSignedInAccount(GoogleSignIn googleSignIn) async {
      GoogleSignInAccount? account = googleSignIn.currentUser;
      account ??= await googleSignIn.signInSilently();
      return account;
    }

    Future<User?>loginWithGoogle({required BuildContext context}) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      User? currentUser;
      if(googleSignInAccount != null){
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );
        try {
          UserCredential userCred = await auth.signInWithCredential(credential);
          currentUser = userCred.user!;
          
        }on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              GoogleAuth.customSnackBar(
                content:
                    'Le compte existe déjà avec des informations d\'identification différentes. Veuillez utiliser une autre méthode de connexion.',
              ),
            );
          } else if (e.code == 'invalid-credential') {
            ScaffoldMessenger.of(context).showSnackBar(
              GoogleAuth.customSnackBar(
                content:
                    'Les informations d\'identification fournies sont invalides. Veuillez saisir des informations valides.',
              ),
            );
          } 
        }
        catch (e) {
          log("google sign in exception $e");
        }
      }
      
      return currentUser;
    }
    User localSignIn(){
      var user;
      LocalStorage storage = LocalStorage();
      storage.getUser().then((value) => user = value);
      return user;
    }
}