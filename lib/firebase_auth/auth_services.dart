import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../model/user_model.dart';
import 'firestore_helper.dart';

class AuthHelper {
  AuthHelper._();

  static final AuthHelper authHelper = AuthHelper._();

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<String?> signUpUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserData userData = UserData(
          id: userCredential.user!.uid,
          name: "${email.split("@")[0].capitalizeFirst}",
          email: email,
          password: password);

      await FireStoreHelper.fireStoreHelper
          .addUserInFireStoreDatabase(userData);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    }
    return null;
  }

  Future<String?> loginUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      AuthController.currentUser = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'usernotfound') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password ';
      } else {
        return 'Invalid Credential';
      }
    }
  }
}
