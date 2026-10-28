import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';

class GradientButton extends StatefulWidget {
  final String texto;
  final IconData? icone;
  final VoidCallback onPressed;
  final bool contorno;

  const GradientButton({
    super.key,
    required this.texto,
    required this.onPressed,
    this.icone,
    this.contorno = false,
  });

  @override
  State<GradientButton> createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  bool _sobre = false;

  @override
  Widget build(BuildContext context) {
    final contorno = widget.contorno;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _sobre = true),
      onExit: (_) => setState(() => _sobre = false),
      child: AnimatedScale(
        scale: _sobre ? 1.04 : 1,
        duration: const Duration(milliseconds: 180),
        child: GestureDetector(
          onTap: widget.onPressed,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: BoxDecoration(
              gradient: contorno ? null : SiteColors.accentGradient,
              color: contorno
                  ? Colors.white.withValues(alpha: _sobre ? 0.14 : 0.06)
                  : null,
              borderRadius: BorderRadius.circular(14),
              border: contorno ? Border.all(color: Colors.white38) : null,
              boxShadow: contorno
                  ? null
                  : [
                      BoxShadow(
                        color: SiteColors.primary.withValues(
                          alpha: _sobre ? 0.55 : 0.35,
                        ),
                        blurRadius: _sobre ? 28 : 18,
                        offset: const Offset(0, 8),
                      ),
                    ],
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (widget.icone != null) ...[
                  Icon(widget.icone, color: Colors.white, size: 20),
                  const SizedBox(width: 10),
                ],
                Text(
                  widget.texto,
                  style: SiteText.estilo(
                    tamanho: 16,
                    peso: FontWeight.w700,
                    cor: Colors.white,
                    altura: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
