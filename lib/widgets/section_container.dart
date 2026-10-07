import 'package:flutter/material.dart';
import 'package:texflow_site/utils/responsive.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? cor;
  final Gradient? gradiente;
  final double espacamentoVertical;

  const SectionContainer({
    super.key,
    required this.child,
    this.cor,
    this.gradiente,
    this.espacamentoVertical = 96,
  });

  @override
  Widget build(BuildContext context) {
    final vertical = Responsive.celular(context)
        ? espacamentoVertical * 0.7
        : espacamentoVertical;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: cor, gradient: gradiente),
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: Responsive.margem(context),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: child,
        ),
      ),
    );
  }
}
