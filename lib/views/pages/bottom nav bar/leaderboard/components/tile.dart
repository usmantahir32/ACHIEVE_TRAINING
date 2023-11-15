import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';

class LeaderBoardTile extends StatelessWidget {
  LeaderBoardTile({super.key, required this.i});
  int i;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: SizeConfig.heightMultiplier * 7,
      width: SizeConfig.widthMultiplier * 88,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 1),
      child: Row(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 7,
            width: SizeConfig.widthMultiplier * 14,
            margin: EdgeInsets.only(
                right: SizeConfig.widthMultiplier * 1,
                bottom: SizeConfig.heightMultiplier * .5),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              image: const DecorationImage(
                image: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTQEZrATmgHOi5ls0YCCQBTkocia_atSw0X-Q&usqp=CAU"),
              ),
            ),
          ),
          Spacing.x(3),
          Expanded(
            child: Text(
              i == 0 ? "Paul S.(You)" : "UnderTaker P.",
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: SizeConfig.widthMultiplier * 25,
            child: Text(
              "9851",
              style: textTheme.bodyMedium!.copyWith(color: AppColors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
