import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/size_config.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.title,
    this.actions,
    this.onTap,
  });
  final String title;
  final List<Widget>? actions;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Center(
        child: IconButton(
          onPressed: onTap ??
              () {
                Get.back();
              },
          icon: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: SizeConfig.imageSizeMultiplier * 6,
          ),
        ),
      ),
      title: Text(
        title,
        style: textTheme.displayLarge!
            .copyWith(fontWeight: FontWeight.w600, color: Colors.black),
      ),
      actions: actions,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfig.heightMultiplier * 6);
}
