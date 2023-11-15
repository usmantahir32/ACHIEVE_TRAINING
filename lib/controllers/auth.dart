import 'dart:convert';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:training/constants/controller.dart';
import 'package:training/extensions/error.dart';
import 'package:training/views/pages/auth/choose%20auth/choose_auth.dart';
import '../constants/firebase.dart';
import '../constants/local_db.dart';
import '../models/user.dart';
import '../views/widgets/custom_snackbar.dart';

class AuthCont extends GetxController {
  RxBool isLoading = false.obs;
//FOR USER UNIQUE ID
  RxString uid = ''.obs;
  String get userID => uid.value;

  final Rx<UserModel> userModel = UserModel().obs;
  UserModel get userInfo => userModel.value;
//HERE WE TAKE THE FIREBASE CURRENT USER IN OBSERVABLE
  User? get userss => firebaseAuth.currentUser;

//SEND GRID API
  final String sendGridAPI =
      "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";
  final String senderEmail = "usmantahir4911@gmail.com";
  RxString userOTP = "".obs;
  RxString generatedOTP = "".obs;
  String generateRandomOTP() {
    final random = Random();
    final otp = random.nextInt(9000) + 1000;
    print(otp);
    return otp.toString();
  }

  Future<void> sendOtpEmail(String email) async {
    generatedOTP.value = generateRandomOTP();
    final url = Uri.parse("https://api.sendgrid.com/v3/mail/send");

    final response = await http.post(url,
        headers: {
          'Authorization': 'Bearer $sendGridAPI',
          'Content-Type': 'application/json'
        },
        body: json.encode({
          "personalizations": [
            {
              "to": [
                {"email": email}
              ]
            }
          ],
          "from": {"email": senderEmail},
          "subject": 'OTP Verification',
          "content": [
            {
              "type": "text/html",
              "value": '<html>'
                  '<head>'
                  '<style>'
                  'body {font-family: Arial, sans-serif; margin: 0; padding: 0;}'
                  'h1 {font-size: 24px; font-weight: normal;}'
                  'p {font-size: 16px; line-height: 1.5;}'
                  'strong {font-weight: bold;}'
                  '</style>'
                  '</head>'
                  '<body>'
                  '<h1>Dear User,</h1>'
                  '<p>Your One-Time Password (OTP) for the Achieve Training App is: <strong>${generatedOTP.value}</strong></p>'
                  '<p>Please use this OTP to complete your login process.</p>'
                  '<p>Thank you,<br>The Solang.Ai Team</p>'
                  '</body>'
                  '</html>'
            }
          ]
        }));
    print(response.body);
  }

//UPDATE EMAIL
  Future<void> updateEmail(String newEmail) async {
    try {
      isLoading.value = true;
      // await userss!.sendEmailVerification();
      await userss!.updateEmail(newEmail);
      // Optionally, update the email in your user's Firestore document
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(userss!.uid)
          .update({'email': newEmail});
      isLoading.value = false;
      showCustomSnackbar(false, 'Email updated successfully');
    } catch (e) {
      isLoading.value = false;
      showCustomSnackbar(
          true, 'Error updating email: ${e.toString().formatError}');
      Logger().t('Error updating email: ${e.toString()}');
    }
  }

//UPDATE PASSWORD
  Future<void> updatePassword({oldPass, newPass}) async {
    if (oldPass != newPass) {
      showCustomSnackbar(true, "Passwords Doesnot Matched");
    } else {
      try {
        isLoading.value = true;
        var cred = EmailAuthProvider.credential(
            email: userss!.email!, password: oldPass);
        await userss!.reauthenticateWithCredential(cred);
        await userss!.updatePassword(newPass);
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        Logger().t('Error updating password: ${e.toString()}');
      }
    }
  }

  //SIGN OUT
  Future<void> signout() async {
    Get.back();
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(LocalDB.userID);

    Get.offAll(() => const ChooseAuthScreen());
    userModel.value = UserModel();
    await firebaseAuth.signOut();
  }

  //DELETE ACCOUNT
  Future<void> deleteAccount() async {
    try {
      isLoading.value = true;

      Logger().t(userss!.uid);

      Logger().t(userss);
      await firestore.collection('Users').doc(userss!.uid).delete();
      Logger().t("user deleted from collection");
      await userss!.delete();
      Logger().t("user auth deleted");

      Get.offAll(() => const ChooseAuthScreen());
      userModel.value = UserModel();
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      isLoading.value = false;
      showCustomSnackbar(false, 'Account Deleted!');
    } catch (e) {
      isLoading.value = false;
      showCustomSnackbar(true, 'Something went wrong');
    }
  }

  //SAVE USER ID IN LOCAL
  saveUserIdInLocal(String id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(LocalDB.userID, id);
    uid.value = id;
  }

  //GET USER ID FROM LOCAL
  getUserIdFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    uid.value = prefs.getString(LocalDB.userID) ?? '';
  }

  //GET CURRENT USER DATE
  Future<void> getUser() async {
    try {
      await getUserIdFromLocal();
      //It is getting data from the collection of "Users" which is in the database(uid is the unique id of each user in the app)
      print(userID);
      if (userID != '') {
        final DocumentSnapshot doc =
            await firestore.collection('Users').doc(userID).get();

        userModel.value = UserModel.fromDocumentSnapshot(doc);

        // await InAppPurchases.isSubscribed(getUserWorkPlace!.whichPkg!);
      }
    } catch (e) {
      //print(e);
      rethrow;
    }
  }

  @override
  onInit() {
    super.onInit();

    print("XXXX ${firebaseAuth.currentUser}");
  }
}
