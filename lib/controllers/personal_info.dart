import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/controller.dart';
import 'package:training/extensions/error.dart';

import '../models/user.dart';
import '../services/auth.dart';
import '../views/widgets/custom_snackbar.dart';

class PersonalInfoCont extends GetxController {
  final TextEditingController name = TextEditingController();
  // final TextEditingController email = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController number = TextEditingController();

  RxInt selectedGender = (-1).obs;
  RxInt selectedAge = 18.obs;

  Future<void> updateUser() async {
    try {
      authCont.isLoading.value = true;
      UserModel userData = UserModel(
          id: authCont.userss!.uid,
          name: name.text,
          gender: gender.text,
          age: age.text,
          phone: number.text);

      await AuthService.updateUser(userData);
      await authCont.getUser();
      authCont.isLoading.value = false;
      showCustomSnackbar(false, "User Updated Succesfully");
    } catch (e) {
      authCont.isLoading.value = false;
      showCustomSnackbar(true, e.toString().formatError);
    }
  }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      name.text = authCont.userModel.value.name ?? "NO Name";
      // email.text = "usman@gmail.com";
      gender.text = authCont.userModel.value.gender == ""
          ? "N/A"
          : authCont.userModel.value.gender!;
      age.text = authCont.userModel.value.age == ""
          ? "N/A"
          : authCont.userModel.value.age!;
      number.text = authCont.userModel.value.phone == ""
          ? "N/A"
          : authCont.userModel.value.phone!;
    });
  }
}
