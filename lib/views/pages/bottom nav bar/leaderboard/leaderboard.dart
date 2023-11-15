import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/drawer.dart';
import '../../../../utils/size_config.dart';
import '../../../../utils/spacing.dart';
import 'components/positioned_tile.dart';
import 'components/tile.dart';

class LeaderBoardScreen extends StatelessWidget {
   LeaderBoardScreen({super.key});

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
        child: Column(
          children: [
            Spacing.y(8),
            Padding(
              padding: EdgeInsets.only(left: SizeConfig.widthMultiplier * 4),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text("LEADERBOARD", style: textTheme.headlineSmall),
              ),
            ),
            SizedBox(
              width: SizeConfig.widthMultiplier * 80,
              height: SizeConfig.heightMultiplier * 35,
              child: Stack(
                alignment: Alignment.center,
                children: const [
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: LeaderBoardPositionedTile(
                          title: "andrew",
                          points: "7430",
                          rank: "2",
                          img:
                              "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dXNlcnxlbnwwfHwwfHx8MA%3D%3D")),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: LeaderBoardPositionedTile(
                          title: "williams",
                          points: "7430",
                          rank: "3",
                          img:
                              "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&q=80&w=2070&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")),
                  Positioned(
                    top: 0,
                    child: LeaderBoardPositionedTile(
                      title: "somraat",
                      points: "7430",
                      isFirst: true,
                      rank: "1",
                      img:
                          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?auto=format&fit=crop&q=80&w=1000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D",
                    ),
                  ),
                ],
              ),
            ),
            Spacing.y(2),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Center(
                    child: LeaderBoardTile(
                      i: index,
                    ),
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
