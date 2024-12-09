import 'package:flutter/material.dart';

import '../Resources/color_pallete.dart';
import '../Resources/text_style.dart';

class OrStyle extends StatelessWidget {
  const OrStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsPalette.blackColor.withOpacity(0.35),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: AppTextStyles.bodyMedium.copyWith(fontWeight: FontWeight.w900, color: ColorsPalette.blackColor.withOpacity(0.75)),
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorsPalette.blackColor.withOpacity(0.35),
          ),
        ),
      ],
    );
  }
}
