import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoCont extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController gender = TextEditingController();
  final TextEditingController age = TextEditingController();
  final TextEditingController number = TextEditingController();

  RxInt selectedGender = (-1).obs;
  RxInt selectedAge = 18.obs;

  @override
  void onInit() {
    super.onInit();
    name.text = "Muhammad Usman Tahir";
    email.text = "usman@gmail.com";
    gender.text = "Male";
    age.text = selectedAge.value.toString();
    number.text = "+923228908542";
  }
}
