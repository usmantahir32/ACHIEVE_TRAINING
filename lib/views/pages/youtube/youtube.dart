import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:training/constants/colors.dart';
import 'package:training/utils/size_config.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class YoutubePage extends StatefulWidget {
  const YoutubePage({Key? key, required this.youtubeLink}) : super(key: key);
  final String youtubeLink;
  @override
  State<YoutubePage> createState() => _YoutubePageState();
}

class _YoutubePageState extends State<YoutubePage> {
  late YoutubePlayerController _controller;
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeLink,
      params: YoutubePlayerParams(
        
        startAt: const Duration(minutes: 0, seconds: 0),
        showControls: true,
        showFullscreenButton: true,
        
        autoPlay: true,
        desktopMode: false,
        privacyEnhanced: true,
        useHybridComposition: true,
      ),
    );
    _controller.onEnterFullscreen = () {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
      log('Entered Fullscreen');
    };
    _controller.onExitFullscreen = () {
      log('Exited Fullscreen');
    };
  }

  @override
  Widget build(BuildContext context) {
    const player = YoutubePlayerIFrame();
    return YoutubePlayerControllerProvider(
      // Passing controller to widgets below.
      controller: _controller,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
         automaticallyImplyLeading: false,
          backgroundColor:  Colors.black,
          centerTitle: true,
          elevation: 0,
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: SizeConfig.widthMultiplier*4),
              child: InkWell(
                onTap: ()=>Get.back(),
                child: CircleAvatar(
                  backgroundColor: AppColors.primaryClr,
                  radius: SizeConfig.widthMultiplier*6,
                  child: const Icon(Icons.close,color: Colors.white),
                ),
              ),
            )
          ],
        ),
        body: Center(
          child: SizedBox(
            height: SizeConfig.heightMultiplier*25,
            width: SizeConfig.widthMultiplier*95,
            
            child: Stack(
              children: [
                player,
                Positioned.fill(
                  child: YoutubeValueBuilder(
                    controller: _controller,
                    builder: (context, value) {
                      return AnimatedCrossFade(
                        firstChild: const SizedBox.shrink(),
                        secondChild: Material(
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  YoutubePlayerController.getThumbnail(
                                    videoId:
                                      widget.youtubeLink,
                                    quality: ThumbnailQuality.medium,
                                  ),
                                ),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                            child:  Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primaryClr,
                                strokeWidth: 2,
                              ),
                            ),
                          ),
                        ),
                        crossFadeState: value.isReady
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
