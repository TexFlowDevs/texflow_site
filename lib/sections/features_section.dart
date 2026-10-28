import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/feature_card.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/section_heading.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colunas = Responsive.colunas(
      context,
      celular: 1,
      tablet: 2,
      desktop: 4,
    );

    return SectionContainer(
      cor: SiteColors.background,
      child: Column(
        children: [
          const SectionHeading(
            etiqueta: 'Recursos',
            titulo:
                'Tudo o que a sua confecção precisa para acompanhar a produção',
            subtitulo: 'Do cadastro do pedido à última etapa, cada informação fica organizada e a um toque de distância.',
          ),
          const SizedBox(height: 56),
          LayoutBuilder(
            builder: (context, constraints) {
              const espaco = 24.0;
              final largura =
                  (constraints.maxWidth - espaco * (colunas - 1)) / colunas;

              return Wrap(
                spacing: espaco,
                runSpacing: espaco,
                children: [
                  for (var i = 0; i < SiteContent.recursos.length; i++)
                    SizedBox(
                      width: largura,
                      child: Reveal(
                        atraso: Duration(milliseconds: (i % colunas) * 100),
                        child: FeatureCard(recurso: SiteContent.recursos[i]),
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
