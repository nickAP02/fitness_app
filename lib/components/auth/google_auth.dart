import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class GoogleAuth {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    GoogleSignIn googleSignIn = GoogleSignIn();
    Future<GoogleSignInAccount?> signInWithGoogle() =>googleSignIn.signIn();

    void updateFirestoreUser(GoogleSignInAccount signInAccount) async {
      CollectionReference ref = db.collection('users');
      ref.add({
        'uid': signInAccount.id,
        'username': signInAccount.displayName,
        'email': signInAccount.email,
        'avatar': signInAccount.photoUrl,
        'lastSeen': DateTime.now()
      }).then((value) => log("user added"))
      .catchError((error)=> log("Failed to add user: $error"));
    }

    Future<GoogleSignInAccount?> signOutWithGoogle() => googleSignIn.disconnect();

    Future<GoogleSignInAccount?> getSignedInAccount(GoogleSignIn googleSignIn) async {
      GoogleSignInAccount? account = googleSignIn.currentUser;
      account ??= await googleSignIn.signInSilently();
      return account;
    }

    Future<User>loginWithGoogle(GoogleSignInAccount? googleSignInAccount) async {
      FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken
      );
      UserCredential userCred = await auth.signInWithCredential(credential);
      final User currentUser = userCred.user!;
      return currentUser;
    }
}