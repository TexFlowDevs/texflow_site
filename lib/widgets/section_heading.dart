import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/reveal.dart';

class SectionHeading extends StatelessWidget {
  final String etiqueta;
  final String titulo;
  final String? subtitulo;
  final bool claro;
  final CrossAxisAlignment alinhamento;

  const SectionHeading({
    super.key,
    required this.etiqueta,
    required this.titulo,
    this.subtitulo,
    this.claro = false,
    this.alinhamento = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    final centralizado = alinhamento == CrossAxisAlignment.center;
    final corTitulo = claro ? Colors.white : SiteColors.ink;
    final corTexto = claro ? Colors.white70 : SiteColors.muted;

    return Reveal(
      child: Column(
        crossAxisAlignment: alinhamento,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: SiteColors.primary.withValues(alpha: claro ? 0.25 : 0.1),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              etiqueta.toUpperCase(),
              style: SiteText.estilo(
                tamanho: 12,
                peso: FontWeight.w700,
                cor: claro ? Colors.white : SiteColors.primary,
                espacamento: 1.2,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760),
            child: Text(
              titulo,
              textAlign: centralizado ? TextAlign.center : TextAlign.start,
              style: SiteText.estilo(
                tamanho: Responsive.celular(context) ? 28 : 40,
                peso: FontWeight.w800,
                cor: corTitulo,
                altura: 1.15,
                espacamento: -0.5,
              ),
            ),
          ),
          if (subtitulo != null) ...[
            const SizedBox(height: 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(
                subtitulo!,
                textAlign: centralizado ? TextAlign.center : TextAlign.start,
                style: SiteText.estilo(tamanho: 17, cor: corTexto, altura: 1.6),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
