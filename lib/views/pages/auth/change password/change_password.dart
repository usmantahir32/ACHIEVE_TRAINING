import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/controller.dart';
import 'package:training/utils/size_config.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/widgets/auth_textfield.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';
import 'package:training/views/widgets/custom_snackbar.dart';
import '../../../../constants/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final TextEditingController oldPass = TextEditingController();
  final TextEditingController newPass = TextEditingController();
  final TextEditingController confirmPass = TextEditingController();

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
              "Change Password",
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
              hintText: "Old Password",
              controller: oldPass,
              isPassword: true,
              prefix: Icon(
                FeatherIcons.lock,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            AuthTextField(
              hintText: "New Password",
              controller: newPass,
              isPassword: true,
              prefix: Icon(
                FeatherIcons.lock,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            AuthTextField(
              hintText: "Confirm Password",
              controller: confirmPass,
              isPassword: true,
              prefix: Icon(
                FeatherIcons.lock,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: AppColors.grey,
              ),
            ),
            const Spacer(),
            Obx(
              () => CustomButton(
                  isLoading: authCont.isLoading.value,
                  title: "Continue",
                  onTap: () {
                    if (oldPass.text.isEmpty ||
                        newPass.text.isEmpty ||
                        confirmPass.text.isEmpty) {
                      showCustomSnackbar(true, "Plzz Fill All The Details.");
                    } else if (newPass.text != confirmPass.text) {
                      showCustomSnackbar(true, "Password Doesnot Matched.");
                    } else if (newPass.text == oldPass.text) {
                      showCustomSnackbar(true, "Password Cannot Be Same.");
                    } else {
                      authCont.updatePassword(
                          oldPass: oldPass.text, newPass: newPass.text);
                    }
                  }),
            ),
            Spacing.y(4)
          ],
        ),
      ),
    );
  }
}
