import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitness_app/service/remote_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../agenda/domain/appointment.dart';
import '../../../service/google_auth.dart';
import '../../../service/local_storage.dart';
import '../domain/user.dart';

class AuthController {
  //this controller describes all the user role actions
  late RemoteStorage remoteStorage;
  late GoogleSignInAccount? signInAccount;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  late SharedPreferences prefs;
  final LocalStorage storage = LocalStorage();
  String table = "users";
  dynamic data;
  UserEntity? authUser;
  FirebaseAuth auth = FirebaseAuth.instance;
  // static SnackBar customSnackBar({required String content}) {
  //   return SnackBar(
  //     backgroundColor: Colors.black,
  //     content: Text(
  //       content,
  //       style: const TextStyle(color: AppColors.errorColor, letterSpacing: 0.5),
  //     ),
  //   );
  // }
  // signup user
  Future signUpWithGoogle(BuildContext context) async{
    try {
      signInAccount = await googleSignIn.signIn();
      if(signInAccount!=null){
        data = signInAccount;
        remoteStorage.create(table, data);
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          GoogleAuth.customSnackBar(
            content:'Vous êtes connecté avec succès',
          ),
        );
        log("user added");
      }
      return signInAccount;
    } catch (e) {
      log("signin exception $e");
    }
  }
  // auth user with phone number
  Future<void> authWithPhoneNumber(String phone) async{
    await auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (phoneAuthCredential) {
        
      }, 
      verificationFailed: (error) {
        if(error.code =="invalid-phone-number"){
          print("Numero de téléphone invalide");
        }
      }, 
      codeSent: (verificationId, forceResendingToken) {
        
      }, 
      codeAutoRetrievalTimeout: (verificationId) {
        
      },
    );
  }
  //  send OTP to user phone number
  Future<void> sendOTP(String phone) async{
    await auth.verifyPhoneNumber(
      phoneNumber:phone,
      codeSent : (String verificationId,int? resendToken) async{
        String? smsCode;
        PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId:verificationId,
          smsCode:smsCode!
        );
        await auth.signInWithCredential(cred);
      },
      codeAutoRetrievalTimeout: (verificationId) {
        
      },
      timeout: const Duration(seconds: 60),
      verificationFailed:(FirebaseAuthException e){
        
      },
      verificationCompleted:(PhoneAuthCredential credential) async{
        await auth.signInWithCredential(credential);
      }
    );
  }
  // signin user
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
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            GoogleAuth.customSnackBar(
              content:
                  'Le compte existe déjà avec des informations d\'identification différentes. Veuillez utiliser une autre méthode de connexion.',
            ),
          );
        } else if (e.code == 'invalid-credential') {
          // ignore: use_build_context_synchronously
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
  // update user data to db
  Future<void> updateUserData(int id,data,BuildContext context)async {
    try {
      remoteStorage.update(id, table, data);
      // ScaffoldMessenger.of(context).showSnackBar(
      //   customSnackBar(
      //     content:'Informations du compte modifié avec succès',
      //   ),
      // );
    } catch (e) {
      log("error while updating user data $e");
      // ScaffoldMessenger.of(context).showSnackBar(
      //   customSnackBar(
      //     content:'Erreur pendant la modification',
      //   ),
      // );
    }
  }
  // get user data
  Future<dynamic> getSignedInAccount(int id) async {
    remoteStorage.getDataById(id, table);
  }
  // delte user data
  Future deleteAccount(BuildContext context,int id)async{
    remoteStorage.delete(id, table);
    // ScaffoldMessenger.of(context).showSnackBar(
    //   customSnackBar(
    //     content:'Compte supprimé avec succès',
    //   ),
    // );
  }
  // take an appointment
  Future takeAppointMent(int id,Appointment rdv)async{
    data = {
      "agenda":rdv
    };
    remoteStorage.update(id, table,data);
    table = "appointments";
    remoteStorage.create(table, rdv);
  }
  // signout user
  Future<void> signOutWithGoogle() async {
    try {
      googleSignIn.signOut();
      // ScaffoldMessenger.of(context).showSnackBar(
      //   customSnackBar(
      //     content:'Vous avez été deconnecté avec succès',
      //   ),
      // );
    } catch (e) {
      // ScaffoldMessenger.of(context).showSnackBar(
      //   customSnackBar(
      //     content: 'Erreur de déconnexion. Veuillez réessayer.',
      //   ),
      // );
    }
    
  } 
}