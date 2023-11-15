import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:training/controllers/auth.dart';
import 'package:training/controllers/otp.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import '../../../../constants/colors.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/custom_button.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen({super.key});
  final authCont = Get.find<AuthCont>();
  final cont = Get.put(OTPCont());

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppbar(title: "OTP Verification"),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
        child: Column(
          children: [
            Spacing.y(5),
            Text(
              "Please type the verification code sent to your email address.",
              textAlign: TextAlign.center,
              style:
                  textTheme.bodyMedium!.copyWith(color: AppColors.primaryClr),
            ),
            SizedBox(
              height: 4 * SizeConfig.heightMultiplier,
            ),
            Pinput(
                length: 4,
                defaultPinTheme: PinTheme(
                  width: 14 * SizeConfig.widthMultiplier,
                  height: 7 * SizeConfig.heightMultiplier,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: AppColors.greyLight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 14 * SizeConfig.widthMultiplier,
                  height: 7 * SizeConfig.heightMultiplier,
                  textStyle: Theme.of(context).textTheme.headlineMedium,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: AppColors.primaryClr),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onCompleted: (pin) {
                  authCont.userOTP.value = pin;
                }),
            Spacing.y(5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't receive code?",
                  style:
                      textTheme.bodySmall!.copyWith(color: AppColors.greyDark),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resend",
                      style: textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryClr,
                      ),
                    ))
              ],
            ),
            const Spacer(),
            Obx(
              () => CustomButton(
                title: "Submit",
                isLoading: authCont.isLoading.value,
                onTap: () => cont.otpVerification(),
              ),
            ),
            Spacing.y(4)
          ],
        ),
      ),
    );
  }
}
