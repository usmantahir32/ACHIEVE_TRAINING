import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/views/pages/html/html.dart';
import '../../../../../models/article.dart';
import '../../../../../utils/size_config.dart';
import '../../../../../utils/spacing.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({super.key, required this.data});

  final ArticleModel data;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: (){
        Get.to(()=>HelloWorldScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.grey.shade100, blurRadius: 20),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: SizeConfig.heightMultiplier * 25,
                  width: SizeConfig.widthMultiplier * 92,
                  margin:
                      EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 3.5),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(26),
                      ),
                      image: DecorationImage(
                          image: NetworkImage(data.bgImage), fit: BoxFit.cover),
                      color: Colors.grey.shade300),
                ),
                Positioned(
                  bottom: 0,
                  right: SizeConfig.widthMultiplier * 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      height: SizeConfig.heightMultiplier * 6,
                      width: SizeConfig.widthMultiplier * 12,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(data.userImage),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3),
              child: Text(
                "${data.name} • Aug 10, 2022",
                style: textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 3,
                  vertical: SizeConfig.heightMultiplier * .5),
              child: Text(
                data.discrition,
                style: textTheme.headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Spacing.y(.5)
          ],
        ),
      ),
    );
  }
}
