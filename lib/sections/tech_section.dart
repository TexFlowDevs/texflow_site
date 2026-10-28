import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/section_heading.dart';

class TechSection extends StatelessWidget {
  const TechSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colunas = Responsive.colunas(
      context,
      celular: 1,
      tablet: 2,
      desktop: 3,
    );

    return SectionContainer(
      cor: SiteColors.background,
      child: Column(
        children: [
          const SectionHeading(
            etiqueta: 'Tecnologias',
            titulo: 'Construído com ferramentas modernas e confiáveis',
            subtitulo: 'Do aplicativo ao banco de dados, cada camada foi escolhida para ser simples de manter.',
          ),
          const SizedBox(height: 56),
          LayoutBuilder(
            builder: (context, constraints) {
              const espaco = 20.0;
              final largura =
                  (constraints.maxWidth - espaco * (colunas - 1)) / colunas;

              return Wrap(
                spacing: espaco,
                runSpacing: espaco,
                children: [
                  for (var i = 0; i < SiteContent.tecnologias.length; i++)
                    SizedBox(
                      width: largura,
                      child: Reveal(
                        atraso: Duration(milliseconds: (i % colunas) * 100),
                        child: _CartaoTecnologia(
                          tecnologia: SiteContent.tecnologias[i],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CartaoTecnologia extends StatelessWidget {
  final Tecnologia tecnologia;

  const _CartaoTecnologia({required this.tecnologia});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: SiteColors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: SiteColors.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: tecnologia.cor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(tecnologia.icone, color: tecnologia.cor, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tecnologia.nome,
                  style: SiteText.estilo(
                    tamanho: 18,
                    peso: FontWeight.w800,
                    altura: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  tecnologia.funcao,
                  style: SiteText.estilo(
                    tamanho: 14,
                    cor: SiteColors.muted,
                    altura: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
