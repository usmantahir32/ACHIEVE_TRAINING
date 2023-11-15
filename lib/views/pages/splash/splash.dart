import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/auth.dart';
import 'package:training/utils/root.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/views/pages/auth/choose%20auth/choose_auth.dart';

import '../auth/login/login.dart';
import '../auth/subcription/subcription.dart';
import '../drawer/drawer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final cont = Get.put(AuthCont());

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () => getRoot());
  }

  getRoot() async {
    await cont.getUser();

    if (cont.userID == '') {
      Get.off(() => const ChooseAuthScreen(),
          transition: Transition.rightToLeft);
    } else if (!cont.userModel.value.isVerified!) {
      Get.off(() => LoginScreen(), transition: Transition.rightToLeft);
    } else if (!cont.userModel.value.isSubscribed!) {
      Get.off(() => SubcriptionScreen(), transition: Transition.rightToLeft);
    } else {
      Get.off(() => DrawerScreen(), transition: Transition.rightToLeft);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.heightMultiplier * 100,
        width: SizeConfig.widthMultiplier * 100,
        color: Colors.black,
        child: Center(
          child: Icon(
            Icons.sports_gymnastics_rounded,
            color: Colors.white,
            size: SizeConfig.imageSizeMultiplier * 10,
          ),
        ),
      ),
    );
  }
}
