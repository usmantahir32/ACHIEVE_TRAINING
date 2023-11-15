import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/views/pages/auth/choose%20auth/choose_auth.dart';
import 'package:training/views/pages/auth/forgot/forgot.dart';
import 'package:training/views/pages/auth/login/login.dart';
import 'package:training/views/pages/auth/sign%20up/sign_up.dart';
import 'package:training/views/pages/auth/subcription/subcription.dart';
import 'package:training/views/pages/bottom%20nav%20bar/bottom_nav_bar.dart';
import 'package:training/views/pages/bottom%20nav%20bar/article/article.dart';
import 'package:training/views/pages/bottom%20nav%20bar/leaderboard/leaderboard.dart';
import 'package:training/views/pages/bottom%20nav%20bar/video/video.dart';
import 'package:training/views/pages/bottom%20nav%20bar/workout/workout.dart';
import 'package:training/views/pages/bottom%20nav%20bar/community/community.dart';
import 'package:training/views/pages/drawer/drawer.dart';
import 'package:training/views/pages/html/html.dart';
import 'package:training/views/pages/splash/splash.dart';
import 'bindings/bindings.dart';
import 'constants/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      // .then((value) => Get.put(AuthServices()))
      ;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);

            return GetMaterialApp(
              theme: AppTheme().getTheme(),
              debugShowCheckedModeBanner: false,
              initialBinding: AuthBindings(),
              home: SplashScreen(),
            );
          },
        );
      },
    );
  }
}
