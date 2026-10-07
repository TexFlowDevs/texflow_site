import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class Reveal extends StatefulWidget {
  final Widget child;
  final Duration atraso;
  final Offset deslocamento;

  const Reveal({
    super.key,
    required this.child,
    this.atraso = Duration.zero,
    this.deslocamento = const Offset(0, 0.12),
  });

  @override
  State<Reveal> createState() => _RevealState();
}

class _RevealState extends State<Reveal> {
  final _chave = UniqueKey();
  bool _visivel = false;
  bool _agendado = false;

  Future<void> _mostrar() async {
    if (_agendado) return;
    _agendado = true;
    await Future.delayed(widget.atraso);
    if (mounted) setState(() => _visivel = true);
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _chave,
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1) _mostrar();
      },
      child: AnimatedSlide(
        offset: _visivel ? Offset.zero : widget.deslocamento,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
        child: AnimatedOpacity(
          opacity: _visivel ? 1 : 0,
          duration: const Duration(milliseconds: 700),
          curve: Curves.easeOut,
          child: widget.child,
        ),
      ),
    );
  }
}
