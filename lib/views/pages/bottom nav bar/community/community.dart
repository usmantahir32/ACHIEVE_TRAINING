import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/community.dart';
import 'package:training/controllers/drawer.dart';
import 'package:training/utils/spacing.dart';
import '../../../../utils/size_config.dart';
import '../../../widgets/sliver_delegate.dart';
import 'components/post_card.dart';

class CommunityScreen extends StatelessWidget {
  CommunityScreen({super.key});
  final cont = Get.put(CommunityCont());
  final drawerCont = Get.find<DrawerCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 0) {
            drawerCont.toggleDrawer();
          }
        },
        child: SafeArea(
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spacing.y(2),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 4),
                      child: Text("COMMUNITY", style: textTheme.headlineSmall),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                floating: true,
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: SizeConfig.heightMultiplier * 9,
                  maxHeight: SizeConfig.heightMultiplier * 9,
                  child: Container(
                    color: const Color(0xFFF5F6FA),
                    child: Column(
                      children: [
                        SizedBox(height: SizeConfig.heightMultiplier * 2),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: SizeConfig.widthMultiplier * 4),
                          child: CupertinoSearchTextField(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.widthMultiplier * 2,
                                vertical: SizeConfig.heightMultiplier * 1.5),
                            prefixInsets: EdgeInsets.only(
                                left: SizeConfig.widthMultiplier * 2),
                            suffixInsets: EdgeInsets.only(
                                right: SizeConfig.widthMultiplier * 2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                    vertical: SizeConfig.heightMultiplier * 1),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return PostCard(
                        i: index,
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
