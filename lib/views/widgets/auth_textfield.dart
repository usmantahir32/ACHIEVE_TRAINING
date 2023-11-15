import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:training/constants/colors.dart';
import '../../utils/size_config.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
    this.keyboardType,
    this.onChange,
    this.prefix,
    this.error = '',
  });
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  final Function(String)? onChange;
  final Widget? prefix;
  final String error;
  final TextInputType? keyboardType;
  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeConfig.heightMultiplier * 2,
          ),
          child: TextField(
            controller: widget.controller,
            cursorColor: Colors.black,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword ? isObscure : false,
            onChanged: widget.onChange,
            decoration: InputDecoration(
              prefixIcon: widget.prefix,
              isCollapsed: true,
              suffixIcon: widget.isPassword
                  ? GestureDetector(
                      onTap: () => setState(() {
                            isObscure = !isObscure;
                          }),
                      child: Icon(
                        isObscure ? FeatherIcons.eyeOff : FeatherIcons.eye,
                        size: SizeConfig.imageSizeMultiplier * 4.5,
                        color: AppColors.grey,
                      ))
                  : null,
              fillColor: Colors.white,
              filled: true,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 5,
                  vertical: SizeConfig.heightMultiplier * 2),
              hintText: widget.hintText,
              hintStyle: textTheme.bodyMedium!.copyWith(color: Colors.black38),
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
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(
                  color: Colors.red,
                ),
              ),
            ),
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          bottom: 0,
          child: widget.error == ''
              ? const SizedBox()
              : FadeIn(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
                    child: Text(
                      widget.error,
                      style: textTheme.displaySmall!.copyWith(
                          fontSize: SizeConfig.textMultiplier * 1.3,
                          color: AppColors.errorClr,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
        )
      ],
    );
  }
}
