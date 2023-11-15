import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import 'package:training/constants/images.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/pages/auth/login/login.dart';
import 'package:training/views/pages/auth/sign%20up/sign_up.dart';
import 'package:training/views/widgets/custom_button.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 100,
            width: SizeConfig.widthMultiplier * 100,
            color: Colors.black,
            child: ShaderMask(
              shaderCallback: (rect) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Image.asset(
                AppImages.authBack,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "START YOUR\n14-DAYS FREE TRIAL",
                  style: textTheme.headlineLarge!.copyWith(color: Colors.white),
                ),
                Spacing.y(2),
                Text(
                  "Take your fitness to the next level with state of the art coaching from Australia's leading strenght & conditioning trainers now",
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500, color: Colors.white),
                ),
                Spacing.y(2),
                CustomButton(
                  title: "Log in",
                  onTap: () {
                    Get.to(() => LoginScreen(),
                        transition: Transition.rightToLeft);
                  },
                ),
                Spacing.y(2),
                CustomButton(
                  title: "Sign up",
                  titleColor: Colors.black,
                  onTap: () {
                    Get.to(() => SignUpScreen(),
                        transition: Transition.rightToLeft);
                  },
                  color: AppColors.greyLight,
                ),
                Spacing.y(5)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
