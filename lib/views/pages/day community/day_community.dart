import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/community.dart';
import 'package:training/controllers/drawer.dart';
import 'package:training/utils/spacing.dart';
import 'package:training/views/widgets/custom_appbar.dart';
import '../../../../utils/size_config.dart';
import '../../widgets/sliver_delegate.dart';
import '../bottom nav bar/community/components/post_card.dart';

class DayCommunityScreen extends StatelessWidget {
  DayCommunityScreen({super.key});
  final cont = Get.put(CommunityCont());
  final drawerCont = Get.find<DrawerCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Spacing.y(1.5),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: SizeConfig.imageSizeMultiplier * 6,
                  ),
                ),
                Text("COMMUNITY", style: textTheme.headlineSmall)
              ],
            ),
            Spacing.y(1.5),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * 2),
                itemCount: 5,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return PostCard(
                    i: index,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
