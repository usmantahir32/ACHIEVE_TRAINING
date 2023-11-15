import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import '../../../../utils/size_config.dart';

class PersonalInfoTextField extends StatelessWidget {
  const PersonalInfoTextField({
    super.key,
    required this.controller,
    this.keyboardType,

    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController controller;

  final TextInputType? keyboardType;
  final Function()? onTap;
  final bool readOnly;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.only(
        bottom: SizeConfig.heightMultiplier * 2,
      ),
      child: TextField(
        controller: controller,
        cursorColor: Colors.black,
        onTap: onTap,
        readOnly: readOnly,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          isCollapsed: true,
          suffixIcon: const Icon(FeatherIcons.edit,size: 20,),
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsets.symmetric(
              horizontal: SizeConfig.widthMultiplier * 5,
              vertical: SizeConfig.heightMultiplier * 2),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greyLight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryClr,
            ),
          ),
        ),
        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
      ),
    );
  }
}
