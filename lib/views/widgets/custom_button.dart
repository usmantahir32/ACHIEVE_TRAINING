import 'package:flutter/material.dart';
import 'package:training/constants/colors.dart';
import 'package:training/views/widgets/loading.dart';
import '../../utils/size_config.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.enable = true,
    this.width,
    this.color,
    this.titleColor,
    this.isLoading = false,
  }) : super(key: key);
  final VoidCallback onTap;

  final String title;
  final bool enable;
  final Color? titleColor;
  final double? width;
  final Color? color;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: SizeConfig.heightMultiplier * 6,
      minWidth: width ?? SizeConfig.widthMultiplier * 90,
      onPressed: onTap,
      color: color ?? AppColors.primaryClr,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: isLoading
            ? const LoadingWidget()
            : Text(
                title,
                style: TextStyle(
                    fontSize: SizeConfig.textMultiplier * 1.8,
                    color: titleColor ?? Colors.white,
                    fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
