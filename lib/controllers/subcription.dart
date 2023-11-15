import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/views/pages/drawer/drawer.dart';
import '../views/widgets/custom_snackbar.dart';
import 'auth.dart';

class SubcriptionCont extends GetxController {
  final authCont = Get.find<AuthCont>();

  RxInt selectedOffer = 0.obs;
  PageController pagecont =
      PageController(viewportFraction: 0.7, keepPage: true);

  void subcriptionStatus() async {
    try {
      authCont.isLoading.value = true;
      if (false) {
      } else {
        // Update Firestore document
        await FirebaseFirestore.instance
            .collection('Users')
            .doc(authCont.userModel.value.id)
            .update({'isSubscribed': true});

        // Update local UserModel instance
        authCont.userModel.value.isSubscribed = true;

        showCustomSnackbar(false, 'Subcription Subscribed Succesfully');
        Get.to(() => DrawerScreen(), transition: Transition.rightToLeft);
        authCont.isLoading.value = false;
      }
    } catch (e) {
      authCont.isLoading.value = false;
      print(e.toString());
    }
  }
}
