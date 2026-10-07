import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:texflow_site/theme/site_colors.dart';

class SiteText {
  static TextStyle estilo({
    double tamanho = 16,
    FontWeight peso = FontWeight.w400,
    Color cor = SiteColors.ink,
    double altura = 1.5,
    double espacamento = 0,
  }) {
    return GoogleFonts.dmSans(
      fontSize: tamanho,
      fontWeight: peso,
      color: cor,
      height: altura,
      letterSpacing: espacamento,
    );
  }
}
