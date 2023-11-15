import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:training/utils/size_config.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.twistingDots(
      leftDotColor: Colors.white,
      rightDotColor: Colors.white,
      size: SizeConfig.imageSizeMultiplier * 6,
    );
  }
}
