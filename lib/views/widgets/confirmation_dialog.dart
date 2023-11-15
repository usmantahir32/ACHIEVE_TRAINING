import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/size_config.dart';
import 'custom_button.dart';

class ConfirmationDialog extends StatelessWidget {
  const ConfirmationDialog(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onContinue,
      this.height});
  final String title, subtitle;
  final VoidCallback onContinue;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Container(
          height: height ?? SizeConfig.heightMultiplier * 35,
          width: SizeConfig.widthMultiplier * 75,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 6,
              vertical: SizeConfig.heightMultiplier * 3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: SizeConfig.heightMultiplier * 5,
                child: Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style:
                    textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 1),
              SizedBox(
                height: SizeConfig.heightMultiplier * 12,
                child: Column(
                  children: [
                    CustomButton(title: 'Continue', onTap: onContinue),
                    TextButton(
                      onPressed: () => Get.back(),
                      child: Text(
                        'Cancel',
                        style: textTheme.bodyLarge,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
