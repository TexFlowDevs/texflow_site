import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/floating_chip.dart';
import 'package:texflow_site/widgets/gradient_button.dart';
import 'package:texflow_site/widgets/mock/mock_dashboard.dart';
import 'package:texflow_site/widgets/phone_frame.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';

class HeroSection extends StatelessWidget {
  final ValueChanged<SecaoSite> aoIr;

  const HeroSection({super.key, required this.aoIr});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.desktop(context);
    final celular = Responsive.celular(context);

    return Stack(
      children: [
        const Positioned.fill(child: _FundoDecorativo()),
        SectionContainer(
          espacamentoVertical: 0,
          child: Padding(
            padding: EdgeInsets.only(
              top: celular ? 120 : 150,
              bottom: celular ? 56 : 80,
            ),
            child: Column(
              children: [
                desktop
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(child: _Textos(aoIr: aoIr)),
                          const SizedBox(width: 40),
                          const _Aparelho(),
                        ],
                      )
                    : Column(
                        children: [
                          _Textos(aoIr: aoIr),
                          const SizedBox(height: 56),
                          const _Aparelho(),
                        ],
                      ),
                const SizedBox(height: 64),
                const _Destaques(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _FundoDecorativo extends StatelessWidget {
  const _FundoDecorativo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: SiteColors.heroGradient),
      child: Stack(
        children: [
          Positioned(
            top: -160,
            right: -120,
            child: _Orbe(
              tamanho: 520,
              cor: SiteColors.purple.withValues(alpha: 0.35),
            ),
          ),
          Positioned(
            bottom: -200,
            left: -160,
            child: _Orbe(
              tamanho: 560,
              cor: SiteColors.primary.withValues(alpha: 0.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _Orbe extends StatelessWidget {
  final double tamanho;
  final Color cor;

  const _Orbe({required this.tamanho, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tamanho,
      height: tamanho,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [cor, cor.withValues(alpha: 0)]),
      ),
    );
  }
}

class _Textos extends StatelessWidget {
  final ValueChanged<SecaoSite> aoIr;

  const _Textos({required this.aoIr});

  @override
  Widget build(BuildContext context) {
    final desktop = Responsive.desktop(context);
    final celular = Responsive.celular(context);
    final alinhamento = desktop
        ? CrossAxisAlignment.start
        : CrossAxisAlignment.center;
    final alinhamentoTexto = desktop ? TextAlign.start : TextAlign.center;

    return Column(
      crossAxisAlignment: alinhamento,
      children: [
        Reveal(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: Colors.white24),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: SiteColors.success,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 10),
                Text(
                  SiteContent.slogan,
                  style: SiteText.estilo(
                    tamanho: 13,
                    peso: FontWeight.w600,
                    cor: Colors.white,
                    altura: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),
        Reveal(
          atraso: const Duration(milliseconds: 120),
          child: Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Sua produção têxtil, '),
                TextSpan(
                  text: 'do corte à entrega',
                  style: SiteText.estilo(
                    tamanho: celular ? 38 : 60,
                    peso: FontWeight.w800,
                    cor: const Color(0xFFA5B0FF),
                    altura: 1.08,
                    espacamento: -1.5,
                  ),
                ),
                const TextSpan(text: ', em um só lugar.'),
              ],
            ),
            textAlign: alinhamentoTexto,
            style: SiteText.estilo(
              tamanho: celular ? 38 : 60,
              peso: FontWeight.w800,
              cor: Colors.white,
              altura: 1.08,
              espacamento: -1.5,
            ),
          ),
        ),
        const SizedBox(height: 24),
        Reveal(
          atraso: const Duration(milliseconds: 240),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Text(
              SiteContent.subtituloHero,
              textAlign: alinhamentoTexto,
              style: SiteText.estilo(
                tamanho: celular ? 16 : 19,
                cor: Colors.white70,
                altura: 1.65,
              ),
            ),
          ),
        ),
        const SizedBox(height: 36),
        Reveal(
          atraso: const Duration(milliseconds: 360),
          child: Wrap(
            spacing: 16,
            runSpacing: 16,
            alignment: desktop ? WrapAlignment.start : WrapAlignment.center,
            children: [
              GradientButton(
                texto: 'Conhecer recursos',
                icone: Icons.arrow_downward_rounded,
                onPressed: () => aoIr(SecaoSite.recursos),
              ),
              GradientButton(
                texto: 'Ver o app',
                icone: Icons.phone_iphone_rounded,
                contorno: true,
                onPressed: () => aoIr(SecaoSite.app),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Aparelho extends StatelessWidget {
  const _Aparelho();

  @override
  Widget build(BuildContext context) {
    return Reveal(
      atraso: const Duration(milliseconds: 300),
      deslocamento: const Offset(0.08, 0.04),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final largura = constraints.maxWidth.isFinite
              ? constraints.maxWidth
              : 460.0;

          return SizedBox(
            width: largura < 460 ? largura : 460,
            height: (largura < 460 ? largura : 460) * (680 / 460),
            child: FittedBox(
              fit: BoxFit.contain,
              child: const SizedBox(
                width: 460,
                height: 680,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: PhoneFrame(child: MockDashboard()),
                    ),
                    Positioned(
                      top: 30,
                      left: -52,
                      child: FloatingChip(
                        icone: Icons.check_circle_rounded,
                        titulo: 'Corte concluído',
                        subtitulo: 'Cortex Ltda.',
                        cor: SiteColors.success,
                      ),
                    ),
                    Positioned(
                      top: 250,
                      right: -22,
                      child: FloatingChip(
                        icone: Icons.autorenew_rounded,
                        titulo: '8 em produção',
                        subtitulo: 'Atualizado agora',
                        cor: SiteColors.primary,
                        duracao: Duration(milliseconds: 3600),
                      ),
                    ),
                    Positioned(
                      bottom: 70,
                      left: -10,
                      child: FloatingChip(
                        icone: Icons.local_shipping_outlined,
                        titulo: 'Entrega em 15/10',
                        subtitulo: 'Pedido OP-7',
                        cor: SiteColors.purple,
                        duracao: Duration(milliseconds: 4200),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Destaques extends StatelessWidget {
  const _Destaques();

  @override
  Widget build(BuildContext context) {
    final colunas = Responsive.colunas(
      context,
      celular: 1,
      tablet: 2,
      desktop: 4,
    );

    return Reveal(
      atraso: const Duration(milliseconds: 200),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.07),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.white12),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final largura =
                (constraints.maxWidth - (colunas - 1) * 8) / colunas;

            return Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                for (final destaque in SiteContent.destaques)
                  SizedBox(
                    width: largura,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Row(
                        children: [
                          Container(
                            width: 46,
                            height: 46,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Icon(
                              destaque.icone,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destaque.titulo,
                                  style: SiteText.estilo(
                                    tamanho: 16,
                                    peso: FontWeight.w700,
                                    cor: Colors.white,
                                    altura: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  destaque.descricao,
                                  style: SiteText.estilo(
                                    tamanho: 13,
                                    cor: Colors.white60,
                                    altura: 1.35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
