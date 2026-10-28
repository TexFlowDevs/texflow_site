import 'package:flutter/material.dart';

class Responsive {
  static double largura(BuildContext context) =>
      MediaQuery.sizeOf(context).width;

  static bool celular(BuildContext context) => largura(context) < 700;

  static bool desktop(BuildContext context) => largura(context) >= 1100;

  static double margem(BuildContext context) {
    final largura = Responsive.largura(context);
    if (largura < 700) return 20;
    if (largura < 1100) return 40;
    return 64;
  }

  static int colunas(
    BuildContext context, {
    int celular = 1,
    int tablet = 2,
    int desktop = 4,
  }) {
    final largura = Responsive.largura(context);
    if (largura < 700) return celular;
    if (largura < 1100) return tablet;
    return desktop;
  }
}
