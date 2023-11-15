import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/icons.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.i});
  final int i;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Center(
      child: Container(
        width: SizeConfig.widthMultiplier * 92,
        margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
        padding: EdgeInsets.symmetric(
            horizontal: SizeConfig.widthMultiplier * 2,
            vertical: SizeConfig.heightMultiplier * 2),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey.shade100, blurRadius: 20)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2),
              child: Row(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: SizeConfig.widthMultiplier * 3),
                    child: CircleAvatar(
                      radius: SizeConfig.imageSizeMultiplier * 6,
                      backgroundColor: Colors.grey.shade300,
                      backgroundImage: const NetworkImage(
                          "https://wallpaperaccess.com/full/3297503.png"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Usman Tahir",
                        style: textTheme.bodyMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "4 minutes ago",
                        style: textTheme.displaySmall!.copyWith(
                            fontWeight: FontWeight.w500, color: AppColors.grey),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacing.y(2),
            i == 0
                ? Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2),
                    child: Text(
                      "Nice to meet you all.Living in karmangala in 4 months.Looking forward to meet you all.",
                      style: textTheme.bodySmall!
                          .copyWith(fontSize: SizeConfig.textMultiplier * 1.5),
                    ),
                  )
                : Container(
                    height: SizeConfig.heightMultiplier * 25,
                    width: SizeConfig.widthMultiplier * 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Colors.grey.shade300,
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://www.advancedhand.com.sg/wp-content/uploads/2021/08/weight-lifting-wrist-pain.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  i == 0
                      ? const SizedBox()
                      : Padding(
                          padding: EdgeInsets.only(
                              top: SizeConfig.heightMultiplier * 2),
                          child: Text(
                            "Who is out tonight?",
                            style: textTheme.bodyMedium,
                          ),
                        ),
                  Spacing.y(2),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.suit_heart,
                        size: SizeConfig.imageSizeMultiplier * 6,
                      ),
                      Spacing.x(1),
                      Text(
                        "135",
                        style: textTheme.bodySmall!
                            .copyWith(color: AppColors.grey),
                      ),
                      Spacing.x(4),
                      Icon(
                        CupertinoIcons.chat_bubble_text,
                        size: SizeConfig.imageSizeMultiplier * 6,
                      ),
                      Spacing.x(1),
                      Text(
                        "135",
                        style: textTheme.bodySmall!
                            .copyWith(color: AppColors.grey),
                      ),
                      Spacing.x(4),
                      Icon(
                        CupertinoIcons.location,
                        size: SizeConfig.imageSizeMultiplier * 6,
                      ),
                      // Image.asset(
                      //   AppIcons.pointer,
                      //   height: SizeConfig.imageSizeMultiplier * 5.5,
                      // ),
                      const Spacer(),
                      PopupMenuButton(
                        color: Colors.white,
                        position: PopupMenuPosition.under,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        constraints: BoxConstraints(
                            maxWidth: SizeConfig.widthMultiplier * 50),
                        onSelected: (value) {},
                        itemBuilder: (ctx) => [
                          _buildPopupMenuItem(
                            context,
                            title: 'Repost',
                          ),
                          _buildPopupMenuItem(
                            context,
                            title: 'Report',
                          ),
                        ],
                        child: const Icon(
                          FeatherIcons.moreHorizontal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
    BuildContext context, {
    required String title,
  }) {
    return PopupMenuItem(
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
