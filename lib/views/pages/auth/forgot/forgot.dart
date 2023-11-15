import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:training/constants/colors.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import 'package:training/views/widgets/custom_button.dart';

import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import '../../../widgets/auth_textfield.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({super.key});

  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const CustomAppbar(title: ""),
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 6),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Spacing.y(2),
            Text(
              "Don't worry. We forget things too. Lets recover your Password.",
              style: textTheme.bodyLarge!.copyWith(
                  color: AppColors.primaryClr, fontWeight: FontWeight.w500),
            ),
            Spacing.y(5),
            AuthTextField(
              hintText: "Enter Email",
              controller: email,
              prefix: Icon(
                FeatherIcons.user,
                size: SizeConfig.imageSizeMultiplier * 5,
                color: const Color(0xffA1B3B8),
              ),
            ),
            const Spacer(),
            CustomButton(
              title: "Send",
              onTap: () {},
            ),
            Spacing.y(4)
          ],
        ),
      ),
    );
  }
}
