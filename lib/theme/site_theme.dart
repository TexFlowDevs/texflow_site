import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';

class SiteTheme {
  static ThemeData get claro {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: SiteColors.primary),
      scaffoldBackgroundColor: SiteColors.background,
      splashFactory: InkRipple.splashFactory,
    );
  }
}
