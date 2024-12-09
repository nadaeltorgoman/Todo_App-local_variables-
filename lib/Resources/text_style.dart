import 'package:flutter/material.dart';

import '../Core/constants.dart';

abstract class AppTextStyles {
  static TextStyle titleLarge = const TextStyle(fontFamily: appFontFamily, fontSize: 64, fontWeight: FontWeight.w600);
  static TextStyle bodyLarge = const TextStyle(fontFamily: appFontFamily, fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle bodyBold = const TextStyle(fontFamily: appFontFamily, fontSize: 16, fontWeight: FontWeight.w700);
  static TextStyle bodyMedium = const TextStyle(fontFamily: appFontFamily, fontSize: 14, fontWeight: FontWeight.w500);
  static TextStyle bodySmall = const TextStyle(fontFamily: appFontFamily, fontSize: 12, fontWeight: FontWeight.w500);
}
