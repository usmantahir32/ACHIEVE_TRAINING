import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training/controllers/workout.dart';
import 'package:training/views/pages/youtube/youtube.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../../../../constants/colors.dart';
import '../../../../../utils/size_config.dart';

class WorkoutDetailCard extends StatelessWidget {
  WorkoutDetailCard({super.key});
  final cont = Get.find<WorkoutCont>();

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AnimatedContainer(
      // height: SizeConfig.heightMultiplier * 50,
      duration: const Duration(milliseconds: 800),
      width: SizeConfig.widthMultiplier * 92,
      margin: EdgeInsets.only(bottom: SizeConfig.heightMultiplier * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.grey.shade100, blurRadius: 20),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: SizeConfig.heightMultiplier * 5,
            width: SizeConfig.widthMultiplier * 92,
            decoration: BoxDecoration(
              color: AppColors.primaryClr,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(14),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              "WARM UP",
              style: textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 4,
                vertical: SizeConfig.heightMultiplier * 1),
            child: Column(
              children: [
                ...List.generate(
                  4,
                  (index) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: () {
                          if (cont.selectedIndex.value == index) {
                            cont.selectedIndex.value = -1;
                          } else {
                            cont.selectedIndex.value = index;
                          }
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.heightMultiplier * .5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: SizeConfig.widthMultiplier * 2),
                                child: Obx(
                                  ()=> Icon(
                                    cont.selectedIndex.value == index
                                        ? CupertinoIcons.xmark_circle
                                        : CupertinoIcons.play_circle,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  index == 1
                                      ? "Alternate 10 Secs 8/10 & 5/10 RPE with 2/10"
                                      : "Build to 7/10 RPE",
                                  style: textTheme.bodyMedium,
                                ),
                              ),
                              Text(
                                "0:00 - 1:00",
                                style: textTheme.bodySmall!
                                    .copyWith(color: Colors.black38),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Obx(
                        () => Column(
                          children: [
                            InkWell(
                              onTap: (){
                                Get.to(()=>YoutubePage(youtubeLink: 'Ptt1yL9jEPI'));
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedContainer(
                                    duration: Duration(milliseconds: 250),
                                    height: cont.selectedIndex.value == index
                                        ? SizeConfig.heightMultiplier * 25
                                        : 0,
                                    width: SizeConfig.widthMultiplier * 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: NetworkImage(YoutubePlayer.getThumbnail(videoId: 'Ptt1yL9jEPI')),fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.grey.shade300),
                                  ),
                               cont.selectedIndex.value == index? Container(
                                  height: SizeConfig.heightMultiplier*5,
                                  width: SizeConfig.widthMultiplier*10,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black38,
                                        blurRadius: 12
                                      )
                                    ]
                                  ),
                                  child: const Icon(Icons.play_arrow),
                                 ):const SizedBox()
                                ],
                              ),
                            ),
                            cont.selectedIndex.value != index
                                ? SizedBox()
                                : Padding(
                                  padding:  EdgeInsets.symmetric(vertical: SizeConfig.heightMultiplier*1),
                                  child: Text(
                                      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.\n\nThe point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)."),
                                )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
