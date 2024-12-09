import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Resources/color_pallete.dart';
import '../Resources/icons.dart';

class SocialMediaRegistration extends StatelessWidget {
  final bool isLight;
  const SocialMediaRegistration({
    super.key,
    required this.isLight,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLight?ColorsPalette.whiteColor:ColorsPalette.whiteColor.withOpacity(0.3),
              ),
              child: SvgPicture.asset(faceBookIcon)),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLight?ColorsPalette.whiteColor:ColorsPalette.whiteColor.withOpacity(0.3),
              ),
              child: SvgPicture.asset(googleIcon)),
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          onPressed: () {},
          icon: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLight?ColorsPalette.whiteColor:ColorsPalette.whiteColor.withOpacity(0.3),
              ),
              child: SvgPicture.asset(appleIcon)),
        ),
      ],
    );
  }
}
