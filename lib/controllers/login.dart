import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/extensions/error.dart';
import 'package:training/views/pages/auth/otp/otp.dart';
import 'package:training/views/pages/drawer/drawer.dart';
import '../views/pages/auth/subcription/subcription.dart';
import '../views/widgets/custom_snackbar.dart';
import 'auth.dart';

class LoginCont extends GetxController {
  final authCont = Get.find<AuthCont>();
  // Firebase
  final FirebaseAuth _auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  //LOGIN
  Future<void> onLogin() async {
    if (email.text.isEmpty || pass.text.isEmpty) {
      showCustomSnackbar(true, "Please Fill All The Details!");
    } else {
      try {
        authCont.isLoading.value = true;
        final result = await _auth.signInWithEmailAndPassword(
            email: email.text.trim(), password: pass.text);
        await authCont.saveUserIdInLocal(result.user!.uid);
        await authCont.getUser();
        if (!authCont.userModel.value.isVerified!) {
          authCont.sendOtpEmail(email.text);
          showCustomSnackbar(false, 'Plzz Check Your Email For OTP.');
          Get.to(() => OtpVerifyScreen(), transition: Transition.rightToLeft);
        } else if (!authCont.userModel.value.isSubscribed!) {
          Get.off(() => SubcriptionScreen(),
              transition: Transition.rightToLeft);
        } else {
          Get.off(() => DrawerScreen(), transition: Transition.rightToLeft);
        }

        clearValues();

        authCont.isLoading.value = false;
      } catch (e) {
        authCont.isLoading.value = false;
        print(e);
        showCustomSnackbar(true, e.toString().formatError);
      }
    }
  }

  // Future<void> onGoogleLogin() async {
  //   try {
  //     authCont.isLoading.value = true;
  //     GoogleSignIn _googleSignIn = GoogleSignIn(
  //       scopes: ['email'],
  //     );
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     if (googleSignInAccount != null) {
  //       final userEmail = googleSignInAccount.email;
  //       //print(userEmail);
  //       // Sign out the user
  //       await _googleSignIn.signOut();
  //       //MAKE LOGIN QUERY
  //       //GET USER
  //       final getUser = await firestore
  //           .collection('Users')
  //           .where('Email', isEqualTo: userEmail)
  //           .get();
  //       if (getUser.docs.isNotEmpty) {
  //         final user = getUser.docs.first;

  //         final result = await _auth.signInWithEmailAndPassword(
  //             email: user['Email'].trim(), password: user['Password']);
  //         await authCont.saveUserIdInLocal(result.user!.uid);
  //         await authCont.getUser();
  //         Get.offAll(() => BottomNavBarScreen(),
  //             transition: Transition.rightToLeft);
  //       } else {
  //         showCustomSnackbar(true, 'User not found!');
  //       }
  //     }

  //     authCont.isLoading.value = false;
  //   } catch (e) {
  //     authCont.isLoading.value = false;
  //   }
  // }

  // Future<void> onAppleLogin() async {
  //   try {
  //     authCont.isLoading.value = true;
  //     final credential = await SignInWithApple.getAppleIDCredential(
  //       scopes: [AppleIDAuthorizationScopes.email],
  //     );
  //     if (credential.email != null) {
  //       final userEmail = credential.email;

  //       //MAKE LOGIN QUERY
  //       //GET USER
  //       final getUser = await firestore
  //           .collection('Users')
  //           .where('Email', isEqualTo: userEmail)
  //           .get();
  //       if (getUser.docs.isNotEmpty) {
  //         final user = getUser.docs.first;

  //         final result = await _auth.signInWithEmailAndPassword(
  //             email: user['Email'].trim(), password: user['Password']);
  //         await authCont.saveUserIdInLocal(result.user!.uid);
  //         await authCont.getUser();
  //         Get.offAll(() => BottomNavBarScreen(),
  //             transition: Transition.rightToLeft);
  //       } else {
  //         showCustomSnackbar(true, 'User not found!');
  //       }
  //     } else {
  //       showCustomSnackbar(true, 'Something went wrong');
  //     }
  //     authCont.isLoading.value = false;
  //   } catch (e) {
  //     authCont.isLoading.value = false;
  //     //print(e);
  //   }
  // }

  @override
  void onClose() {
    super.onClose();
    clearValues();
    disposeValues();
  }

  disposeValues() {
    email.dispose();
    pass.dispose();
  }

  clearValues() {
    email.clear();
    pass.clear();
  }
}
