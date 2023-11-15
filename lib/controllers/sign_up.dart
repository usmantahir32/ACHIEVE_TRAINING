import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:training/extensions/error.dart';
import 'package:training/views/pages/auth/otp/otp.dart';
import '../constants/firebase.dart';
import '../models/user.dart';
import '../services/auth.dart';
import '../views/widgets/custom_snackbar.dart';
import 'auth.dart';

class SignUpCont extends GetxController {
  final authCont = Get.find<AuthCont>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  //SIGNUP
  Future<void> onSignup() async {
    if (email.text.isEmpty ||
        pass.text.isEmpty ||
        fullName.text.isEmpty ||
        confirmPass.text.isEmpty) {
      showCustomSnackbar(true, "Please Fill All The Details!");
    } else if (pass.text != confirmPass.text) {
      showCustomSnackbar(true, "Password Doesnot Matched");
    } else {
      try {
        authCont.isLoading.value = true;

        final result = await firebaseAuth.createUserWithEmailAndPassword(
            email: email.text.trim(), password: pass.text);

        UserModel userData = UserModel(
          id: result.user!.uid,
          name: fullName.text,
          password: pass.text,
          email: email.text.trim(),
        );
        log("abc");
        await AuthService.createUser(userData);
        await authCont.saveUserIdInLocal(result.user!.uid);
        await authCont.getUser();
        authCont.sendOtpEmail(email.text);
        Get.off(() => OtpVerifyScreen(), transition: Transition.rightToLeft);
        clearValues();
        showCustomSnackbar(false, 'Plzz Check Your Email For OTP.');
        authCont.isLoading.value = false;
      } catch (e) {
        //print(e);
        authCont.isLoading.value = false;
        showCustomSnackbar(true, e.toString().formatError);
      }
    }
  }

// SIGNUP WITH GOOGLE
  Future<void> onGoogleSignup() async {
    try {
      authCont.isLoading.value = true;

      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtaining the GoogleSignInAuthentication object.
        GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        // Creating a new credential for Firebase.
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Signing in with the credential.
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        // Here you can retrieve user details if necessary.
        final userEmail = googleSignInAccount.email;
        final userName = googleSignInAccount.displayName;

        UserModel userData = UserModel(
          id: userCredential.user!.uid, // Use UID from UserCredential.
          name: userName,
          email: userEmail,
        );

        await AuthService.createUser(userData);
        // authCont.saveUserIdInLocal(signupData.user!.uid);
        authCont.sendOtpEmail(email.text);
        Get.off(() => OtpVerifyScreen(), transition: Transition.rightToLeft);
        clearValues();
      } else {
        showCustomSnackbar(
            true, 'Please read terms and privacy policy before signing up');
      }

      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      showCustomSnackbar(true, e.toString());
    }
  }

// APPLE SIGNUP
  Future<void> onAppleSignup() async {
    try {
      authCont.isLoading.value = true;

      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Create an OAuthCredential for signing in with Firebase
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        accessToken: appleCredential.authorizationCode,
      );

      // Sign in the user with Firebase
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      if (appleCredential.email != null || userCredential.user != null) {
        // Use email from Apple credential, or from Firebase user if null
        final userEmail = appleCredential.email ?? userCredential.user!.email;
        // Same for the name
        final userName = appleCredential.givenName ?? 'Unknown';

        // UserModel creation
        UserModel userData = UserModel(
          id: userCredential.user!.uid, // Use the UID from Firebase user
          name: userName,
          email: userEmail,
        );

        await AuthService.createUser(userData);
        // authCont.saveUserIdInLocal(userCredential.user!.uid);
        authCont.sendOtpEmail(email.text);
        Get.off(() => OtpVerifyScreen(), transition: Transition.rightToLeft);
        clearValues();
      } else {
        showCustomSnackbar(true, 'Something went wrong');
      }

      authCont.isLoading.value = false;
    } catch (e) {
      authCont.isLoading.value = false;
      showCustomSnackbar(true, 'Something went wrong: ${e.toString()}');
    }
  }

  @override
  void onClose() {
    super.onClose();
    clearValues();
    disposeValues();
  }

  disposeValues() {
    fullName.dispose();
    email.dispose();
    pass.dispose();
    confirmPass.dispose();
  }

  clearValues() {
    fullName.clear();
    email.clear();
    pass.clear();
    confirmPass.clear();
  }
}
