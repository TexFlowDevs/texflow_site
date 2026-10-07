import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/section_heading.dart';

class TeamSection extends StatelessWidget {
  const TeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      cor: SiteColors.surface,
      child: Column(
        children: [
          const SectionHeading(
            etiqueta: 'Quem construiu',
            titulo: 'Desenvolvedores',
            subtitulo: SiteContent.projeto,
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              for (var i = 0; i < SiteContent.equipe.length; i++)
                Reveal(
                  atraso: Duration(milliseconds: i * 120),
                  child: _CartaoMembro(membro: SiteContent.equipe[i]),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CartaoMembro extends StatelessWidget {
  final MembroEquipe membro;

  const _CartaoMembro({required this.membro});

  String get _iniciais {
    final partes = membro.nome
        .split(' ')
        .where((parte) => parte.isNotEmpty)
        .toList();
    if (partes.length == 1) return partes.first[0].toUpperCase();
    return '${partes.first[0]}${partes.last[0]}'.toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      constraints: const BoxConstraints(minHeight: 220),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: SiteColors.background,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: SiteColors.border),
      ),
      child: Column(
        children: [
          Container(
            width: 84,
            height: 84,
            decoration: BoxDecoration(
              gradient: SiteColors.accentGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: SiteColors.primary.withValues(alpha: 0.35),
                  blurRadius: 22,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(
                _iniciais,
                style: SiteText.estilo(
                  tamanho: 30,
                  peso: FontWeight.w800,
                  cor: Colors.white,
                  altura: 1,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            membro.nome,
            textAlign: TextAlign.center,
            style: SiteText.estilo(
              tamanho: 18,
              peso: FontWeight.w800,
              altura: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}
