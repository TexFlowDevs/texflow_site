import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';

class FeatureCard extends StatefulWidget {
  final Recurso recurso;

  const FeatureCard({super.key, required this.recurso});

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _sobre = false;

  @override
  Widget build(BuildContext context) {
    final recurso = widget.recurso;

    return MouseRegion(
      onEnter: (_) => setState(() => _sobre = true),
      onExit: (_) => setState(() => _sobre = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _sobre ? -8 : 0, 0),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: SiteColors.surface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: _sobre
                ? recurso.cor.withValues(alpha: 0.5)
                : SiteColors.border,
          ),
          boxShadow: [
            BoxShadow(
              color: recurso.cor.withValues(alpha: _sobre ? 0.18 : 0.05),
              blurRadius: _sobre ? 32 : 16,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: recurso.cor.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(recurso.icone, color: recurso.cor, size: 28),
            ),
            const SizedBox(height: 20),
            Text(
              recurso.titulo,
              style: SiteText.estilo(
                tamanho: 19,
                peso: FontWeight.w700,
                altura: 1.25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recurso.descricao,
              style: SiteText.estilo(
                tamanho: 15,
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
