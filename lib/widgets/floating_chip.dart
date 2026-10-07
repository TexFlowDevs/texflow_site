import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';

class FloatingChip extends StatefulWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;
  final Color cor;
  final Duration duracao;

  const FloatingChip({
    super.key,
    required this.icone,
    required this.titulo,
    required this.subtitulo,
    required this.cor,
    this.duracao = const Duration(seconds: 3),
  });

  @override
  State<FloatingChip> createState() => _FloatingChipState();
}

class _FloatingChipState extends State<FloatingChip>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: widget.duracao,
  )..repeat(reverse: true);

  late final Animation<double> _movimento = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutSine,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _movimento,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 + 20 * _movimento.value),
          child: child,
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 24,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                color: widget.cor.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(widget.icone, color: widget.cor, size: 20),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.titulo,
                  style: SiteText.estilo(
                    tamanho: 14,
                    peso: FontWeight.w700,
                    altura: 1.2,
                  ),
                ),
                Text(
                  widget.subtitulo,
                  style: SiteText.estilo(
                    tamanho: 12,
                    cor: SiteColors.muted,
                    altura: 1.3,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
