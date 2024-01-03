import 'dart:js_util';

import 'package:chattingapp/allConstants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../allModels/user_chat.dart';

enum Status{
  uninitialized,
  authenticated,
  authenticating,
  authenticateError,
  authenticateCancel
}

class AuthProvider extends ChangeNotifier{
  final GoogleSignIn googleSignIn;
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  final SharedPreferences sharedPreferences;

  Status _status = Status.uninitialized;

  Status get status => _status;

  AuthProvider({
    required this.sharedPreferences,
    required this.firebaseAuth,
    required this.googleSignIn,
    required this.firebaseFirestore
  });


  String? getUSerFirebaseId(){
    return sharedPreferences.getString(FirestoreConstants.id);
  }

  Future<bool> isLoggedIn()async{
    bool isLoggedIn = await googleSignIn.isSignedIn();

    if(isLoggedIn && sharedPreferences.getString(FirestoreConstants.id)?.isNotEmpty == true){
      return true;
    }else{
      return false;
    }

  }


  Future<bool> handleSignIn()async{
    _status = Status.authenticating;
    notifyListeners();

    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
    if(googleSignInAccount != null){
      GoogleSignInAuthentication? googleAuth = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken
      );

      User? firebaseUser = (await FirebaseAuth.instance.signInWithCredential(credential)).user;

      if(firebaseUser != null){
        final QuerySnapshot result = await firebaseFirestore.collection(FirestoreConstants.pathUserCollection)
            .where(FirestoreConstants.id,isEqualTo: firebaseUser.uid)
            .get();
        final List<DocumentSnapshot> document = result.docs;
        if(document.isEmpty){
          firebaseFirestore.collection(FirestoreConstants.pathUserCollection).doc(firebaseUser.uid).set({
            FirestoreConstants.nickname: firebaseUser.displayName,
            FirestoreConstants.photoUrl: firebaseUser.photoURL,
            FirestoreConstants.id:firebaseUser.uid,
            'createdAt':DateTime.now().millisecondsSinceEpoch.toString(),
            FirestoreConstants.chattingWith: null
          });

          User? currentUser = firebaseUser;
          await sharedPreferences.setString(FirestoreConstants.id, currentUser.uid);
          await sharedPreferences.setString(FirestoreConstants.nickname, currentUser.displayName ?? "");
          await sharedPreferences.setString(FirestoreConstants.photoUrl, currentUser.photoURL ?? "");
          await sharedPreferences.setString(FirestoreConstants.phoneNumber, currentUser.phoneNumber ?? "");

        }else{
          DocumentSnapshot documentSnapshot = document[0];
          UserChat userChat = UserChat.fromDocument(documentSnapshot);

          await sharedPreferences.setString(FirestoreConstants.id, userChat.id);
          await sharedPreferences.setString(FirestoreConstants.nickname, userChat.nickname);
          await sharedPreferences.setString(FirestoreConstants.aboutMe, userChat.aboutMe);
          await sharedPreferences.setString(FirestoreConstants.photoUrl, userChat.photoURL);
          await sharedPreferences.setString(FirestoreConstants.phoneNumber, userChat.phoneNumber);

        }
        _status = Status.authenticated;
        notifyListeners();
        return true;

      }else{
        _status = Status.authenticateError;
        notifyListeners();
        return false;
      }
    }else{
      _status = Status.authenticateCancel;
      notifyListeners();
      return false;
    }

  }


  Future<void> handleSignOut() async{
    _status = Status.uninitialized;
    await firebaseAuth.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
  }
}