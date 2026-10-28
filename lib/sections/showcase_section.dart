import 'dart:async';

import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/mock/mock_dashboard.dart';
import 'package:texflow_site/widgets/mock/mock_detalhes.dart';
import 'package:texflow_site/widgets/mock/mock_novo_pedido.dart';
import 'package:texflow_site/widgets/phone_frame.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/section_heading.dart';

class ShowcaseSection extends StatefulWidget {
  const ShowcaseSection({super.key});

  @override
  State<ShowcaseSection> createState() => _ShowcaseSectionState();
}

class _ShowcaseSectionState extends State<ShowcaseSection> {
  static const _telas = [MockDashboard(), MockDetalhes(), MockNovoPedido()];

  int _indice = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _iniciarTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 6), (_) {
      if (mounted) setState(() => _indice = (_indice + 1) % _telas.length);
    });
  }

  void _selecionar(int indice) {
    setState(() => _indice = indice);
    _iniciarTimer();
  }

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.desktop(context);

    return SectionContainer(
      gradiente: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [SiteColors.navyDark, SiteColors.navy],
      ),
      child: Column(
        children: [
          const SectionHeading(
            etiqueta: 'O app',
            titulo: 'Conheça as telas do TexFlow',
            subtitulo: 'Uma interface simples, pensada para quem está no chão de fábrica.',
            claro: true,
          ),
          const SizedBox(height: 56),
          desktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: _Explicacao(
                        indice: _indice,
                        aoSelecionar: _selecionar,
                      ),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      child: Center(child: _Aparelho(indice: _indice)),
                    ),
                  ],
                )
              : Column(
                  children: [
                    _Aparelho(indice: _indice),
                    const SizedBox(height: 40),
                    _Explicacao(indice: _indice, aoSelecionar: _selecionar),
                  ],
                ),
        ],
      ),
    );
  }
}

class _Aparelho extends StatelessWidget {
  final int indice;

  const _Aparelho({required this.indice});

  @override
  Widget build(BuildContext context) {
    return Reveal(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final disponivel = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : PhoneFrame.largura;
          final escala = (disponivel / PhoneFrame.largura).clamp(0.6, 1.0);

          return SizedBox(
            width: PhoneFrame.largura * escala,
            height: PhoneFrame.altura * escala,
            child: FittedBox(
              child: PhoneFrame(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 450),
                  switchInCurve: Curves.easeOut,
                  transitionBuilder: (child, animation) => FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(
                      scale: Tween<double>(
                        begin: 0.96,
                        end: 1,
                      ).animate(animation),
                      child: child,
                    ),
                  ),
                  child: KeyedSubtree(
                    key: ValueKey(indice),
                    child: _ShowcaseSectionState._telas[indice],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Explicacao extends StatelessWidget {
  final int indice;
  final ValueChanged<int> aoSelecionar;

  const _Explicacao({required this.indice, required this.aoSelecionar});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.desktop(context);
    final tela = SiteContent.telas[indice];
    final alinhamento = desktop
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;

    return Column(
      crossAxisAlignment: alinhamento,
      children: [
        if (Responsive.celular(context))
          Row(
            children: [
              for (var i = 0; i < SiteContent.telas.length; i++) ...[
                if (i > 0) const SizedBox(width: 8),
                Expanded(
                  child: _Aba(
                    tela: SiteContent.telas[i],
                    ativa: i == indice,
                    compacta: true,
                    aoTocar: () => aoSelecionar(i),
                  ),
                ),
              ],
            ],
          )
        else
          Wrap(
            spacing: 10,
            runSpacing: 10,
            alignment: desktop ? WrapAlignment.start : WrapAlignment.center,
            children: [
              for (var i = 0; i < SiteContent.telas.length; i++)
                _Aba(
                  tela: SiteContent.telas[i],
                  ativa: i == indice,
                  aoTocar: () => aoSelecionar(i),
                ),
            ],
          ),
        const SizedBox(height: 32),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: Column(
            key: ValueKey(indice),
            crossAxisAlignment: alinhamento,
            children: [
              Text(
                tela.titulo,
                textAlign: desktop ? TextAlign.start : TextAlign.center,
                style: SiteText.estilo(
                  tamanho: Responsive.celular(context) ? 26 : 34,
                  peso: FontWeight.w800,
                  cor: Colors.white,
                  altura: 1.15,
                  espacamento: -0.5,
                ),
              ),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 520),
                child: Text(
                  tela.descricao,
                  textAlign: desktop ? TextAlign.start : TextAlign.center,
                  style: SiteText.estilo(
                    tamanho: 17,
                    cor: Colors.white70,
                    altura: 1.6,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              for (final ponto in tela.pontos)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 26,
                        height: 26,
                        decoration: BoxDecoration(
                          color: SiteColors.success.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check_rounded,
                          color: SiteColors.success,
                          size: 16,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Flexible(
                        child: Text(
                          ponto,
                          style: SiteText.estilo(
                            tamanho: 16,
                            peso: FontWeight.w600,
                            cor: Colors.white,
                            altura: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Aba extends StatelessWidget {
  final TelaApp tela;
  final bool ativa;
  final bool compacta;
  final VoidCallback aoTocar;

  const _Aba({
    required this.tela,
    required this.ativa,
    required this.aoTocar,
    this.compacta = false,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: aoTocar,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.symmetric(
            horizontal: compacta ? 8 : 18,
            vertical: compacta ? 10 : 12,
          ),
          decoration: BoxDecoration(
            gradient: ativa ? SiteColors.accentGradient : null,
            color: ativa ? null : Colors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: ativa ? Colors.transparent : Colors.white24,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!compacta) ...[
                Icon(tela.icone, color: Colors.white, size: 18),
                const SizedBox(width: 8),
              ],
              Flexible(
                child: Text(
                  tela.rotulo,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: SiteText.estilo(
                    tamanho: compacta ? 13 : 14,
                    peso: FontWeight.w700,
                    cor: Colors.white,
                    altura: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
