import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';

class MockStatusBar extends StatelessWidget {
  const MockStatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 10, 20, 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: SiteText.estilo(tamanho: 11, peso: FontWeight.w700),
          ),
          const Row(
            children: [
              Icon(
                Icons.signal_cellular_alt_rounded,
                size: 12,
                color: SiteColors.ink,
              ),
              SizedBox(width: 4),
              Icon(Icons.battery_full_rounded, size: 12, color: SiteColors.ink),
            ],
          ),
        ],
      ),
    );
  }
}

class MockBadge extends StatelessWidget {
  final String texto;
  final Color cor;

  const MockBadge({super.key, required this.texto, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: cor.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        texto,
        style: SiteText.estilo(
          tamanho: 9,
          peso: FontWeight.w700,
          cor: cor,
          altura: 1.2,
        ),
      ),
    );
  }
}

class MockCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;

  const MockCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: SiteColors.border),
      ),
      child: child,
    );
  }
}

class MockProgress extends StatelessWidget {
  final double valor;
  final Color cor;

  const MockProgress({super.key, required this.valor, required this.cor});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: LinearProgressIndicator(
        value: valor,
        minHeight: 5,
        backgroundColor: SiteColors.progressTrack,
        color: cor,
      ),
    );
  }
}

class MockAppBar extends StatelessWidget {
  final String titulo;

  const MockAppBar({super.key, required this.titulo});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: SiteColors.border)),
      ),
      child: Row(
        children: [
          const Icon(Icons.chevron_left, size: 22, color: SiteColors.ink),
          const SizedBox(width: 8),
          Text(
            titulo,
            style: SiteText.estilo(tamanho: 13, peso: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
