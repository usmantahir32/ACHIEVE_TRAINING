import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';

class LeaderBoardPositionedTile extends StatelessWidget {
  const LeaderBoardPositionedTile(
      {super.key,
      this.isFirst = false,
      required this.title,
      required this.points,
      required this.img,
      required this.rank});

  final String title, points, img, rank;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          rank,
          style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
        ),
        rank == "1"
            ? Image.asset(
                AppIcons.crown,
                height: SizeConfig.imageSizeMultiplier * 12,
              )
            : Icon(
                rank == "2"
                    ? Icons.arrow_drop_up_rounded
                    : Icons.arrow_drop_down_rounded,
                size: SizeConfig.imageSizeMultiplier * 9,
                color: Colors.black,
              ),
        Container(
          height: isFirst
              ? SizeConfig.heightMultiplier * 18
              : SizeConfig.heightMultiplier * 15,
          width: isFirst
              ? SizeConfig.widthMultiplier * 36
              : SizeConfig.widthMultiplier * 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey.shade300,
            border: Border.all(color: AppColors.primaryClr, width: 3),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(15, 10),
              )
            ],
            image: DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
          ),
        ),
        Text(
          title,
          style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
        ),
        Text(
          points,
          style: textTheme.bodyMedium!.copyWith(color: AppColors.grey),
        )
      ],
    );
  }
}
