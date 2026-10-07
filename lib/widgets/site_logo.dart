import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';

class SiteLogo extends StatelessWidget {
  final double tamanho;

  const SiteLogo({super.key, this.tamanho = 40});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: tamanho,
          height: tamanho,
          decoration: BoxDecoration(
            gradient: SiteColors.accentGradient,
            borderRadius: BorderRadius.circular(tamanho * 0.3),
            boxShadow: [
              BoxShadow(
                color: SiteColors.primary.withValues(alpha: 0.5),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.layers_rounded,
            color: Colors.white,
            size: tamanho * 0.58,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          SiteContent.nome,
          style: SiteText.estilo(
            tamanho: tamanho * 0.55,
            peso: FontWeight.w800,
            cor: Colors.white,
            altura: 1.1,
            espacamento: -0.3,
          ),
        ),
      ],
    );
  }
}
