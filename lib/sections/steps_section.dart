import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/section_heading.dart';

class StepsSection extends StatelessWidget {
  const StepsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.desktop(context);

    return SectionContainer(
      cor: SiteColors.surface,
      child: Column(
        children: [
          const SectionHeading(
            etiqueta: 'Como funciona',
            titulo: 'Três passos para ter a produção sob controle',
          ),
          const SizedBox(height: 56),
          desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var i = 0; i < SiteContent.etapas.length; i++) ...[
                      Expanded(
                        child: _CartaoEtapa(
                          etapa: SiteContent.etapas[i],
                          ordem: i,
                        ),
                      ),
                      if (i < SiteContent.etapas.length - 1)
                        const Padding(
                          padding: EdgeInsets.only(
                            top: 64,
                            left: 12,
                            right: 12,
                          ),
                          child: Icon(
                            Icons.arrow_forward_rounded,
                            color: SiteColors.border,
                            size: 32,
                          ),
                        ),
                    ],
                  ],
                )
              : Column(
                  children: [
                    for (var i = 0; i < SiteContent.etapas.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: _CartaoEtapa(
                          etapa: SiteContent.etapas[i],
                          ordem: i,
                        ),
                      ),
                  ],
                ),
        ],
      ),
    );
  }
}

class _CartaoEtapa extends StatelessWidget {
  final Etapa etapa;
  final int ordem;

  const _CartaoEtapa({required this.etapa, required this.ordem});

  @override
  Widget build(BuildContext context) {
    return Reveal(
      atraso: Duration(milliseconds: ordem * 150),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: SiteColors.background,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: SiteColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    gradient: SiteColors.accentGradient,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: SiteColors.primary.withValues(alpha: 0.35),
                        blurRadius: 20,
                        offset: const Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Icon(etapa.icone, color: Colors.white, size: 32),
                ),
                Text(
                  etapa.numero,
                  style: SiteText.estilo(
                    tamanho: 52,
                    peso: FontWeight.w800,
                    cor: SiteColors.border,
                    altura: 1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              etapa.titulo,
              style: SiteText.estilo(
                tamanho: 22,
                peso: FontWeight.w800,
                altura: 1.2,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              etapa.descricao,
              style: SiteText.estilo(
                tamanho: 16,
                cor: SiteColors.muted,
                altura: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
