import 'package:flutter/material.dart';
import '../../../../utils/size_config.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });
  final String title;
  final VoidCallback onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: SizeConfig.widthMultiplier * 59.5,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.only(
              top: SizeConfig.heightMultiplier * 1,
              bottom: SizeConfig.heightMultiplier * 1,
              left: SizeConfig.widthMultiplier * 4),
          child: Row(
            children: [
              Container(
                height: SizeConfig.heightMultiplier * 3.5,
                width: SizeConfig.widthMultiplier * 7.5,
                margin: EdgeInsets.only(right: SizeConfig.widthMultiplier * 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade700),
                alignment: Alignment.center,
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: SizeConfig.imageSizeMultiplier * 5,
                ),
              ),
              Text(
                title,
                style: textTheme.bodySmall!
                    .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
