import 'package:flutter/material.dart';
import '../../../../../utils/size_config.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({super.key, required this.i, required this.images});
  final int i;
  final String images;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(
          height: SizeConfig.heightMultiplier * 100,
          width: SizeConfig.widthMultiplier * 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            color: Colors.black,
          ),
          child: ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.transparent],
              ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
            },
            blendMode: BlendMode.dstIn,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Image.network(
                images,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: SizeConfig.heightMultiplier * 1,
          left: SizeConfig.widthMultiplier * 4,
          right: SizeConfig.widthMultiplier * 4,
          child: Text(
            maxLines: 2,
            i == 0
                ? "Air Press"
                : i == 3
                    ? "Chest"
                    : "Bench Press with solid dumballs with multiple weight",
            style: textTheme.bodyLarge!
                .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
