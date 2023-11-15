import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/controller.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/pages/auth/otp/otp.dart';
import 'package:training/views/widgets/auth_textfield.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';
import 'package:training/views/widgets/custom_snackbar.dart';

import '../../../../constants/colors.dart';

class ChangeEmailScreen extends StatelessWidget {
  ChangeEmailScreen({super.key});

  final TextEditingController newEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppbar(title: ""),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.y(2),
            Text(
              "Change Email",
              style: textTheme.headlineLarge!.copyWith(
                fontSize: SizeConfig.textMultiplier * 3.2,
                color: AppColors.primaryClr,
              ),
            ),
            Spacing.y(1),
            Text(
              "Enter your details to continue",
              style: textTheme.bodyMedium!.copyWith(
                color: AppColors.grey,
              ),
            ),
            Spacing.y(5),
            AuthTextField(
              hintText: "New Email",
              controller: newEmail,
              prefix: Icon(
                FeatherIcons.user,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            const Spacer(),
            CustomButton(
                title: "Next",
                onTap: () {
                  if (newEmail.text.isEmpty) {
                    showCustomSnackbar(true, "Plzz Enter The Email!");
                  } else {
                    authCont.updateEmail(newEmail.text);
                  }
                  // Get.to(() => OtpVerifyScreen(),
                  //     transition: Transition.rightToLeft);
                }),
            Spacing.y(4)
          ],
        ),
      ),
    );
  }
}
