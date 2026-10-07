import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/gradient_button.dart';
import 'package:texflow_site/widgets/reveal.dart';
import 'package:texflow_site/widgets/section_container.dart';
import 'package:texflow_site/widgets/site_logo.dart';

class FooterSection extends StatelessWidget {
  final ValueChanged<SecaoSite> aoIr;

  const FooterSection({super.key, required this.aoIr});

  @override
  Widget build(BuildContext context) {
    final celular = Responsive.celular(context);

    return SectionContainer(
      gradiente: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [SiteColors.navy, SiteColors.navyDark],
      ),
      espacamentoVertical: 72,
      child: Column(
        children: [
          Reveal(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(celular ? 28 : 48),
              decoration: BoxDecoration(
                gradient: SiteColors.accentGradient,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: SiteColors.primary.withValues(alpha: 0.4),
                    blurRadius: 40,
                    offset: const Offset(0, 20),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text(
                    'Pronto para ver o TexFlow em ação?',
                    textAlign: TextAlign.center,
                    style: SiteText.estilo(
                      tamanho: celular ? 26 : 38,
                      peso: FontWeight.w800,
                      cor: Colors.white,
                      altura: 1.15,
                      espacamento: -0.5,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'Navegue pelas telas e conheça cada recurso do aplicativo.',
                    textAlign: TextAlign.center,
                    style: SiteText.estilo(
                      tamanho: 17,
                      cor: Colors.white70,
                      altura: 1.5,
                    ),
                  ),
                  const SizedBox(height: 28),
                  GradientButton(
                    texto: 'Ver telas do app',
                    icone: Icons.phone_iphone_rounded,
                    contorno: true,
                    onPressed: () => aoIr(SecaoSite.app),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 64),
          celular
              ? Column(
                  children: [
                    const SiteLogo(),
                    const SizedBox(height: 24),
                    _Links(aoIr: aoIr),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SiteLogo(),
                    _Links(aoIr: aoIr),
                  ],
                ),
          const SizedBox(height: 32),
          Container(height: 1, color: Colors.white12),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 12,
            spacing: 24,
            children: [
              Text(
                '© 2026 ${SiteContent.nome}. ${SiteContent.projeto}.',
                style: SiteText.estilo(
                  tamanho: 14,
                  cor: Colors.white54,
                  altura: 1.4,
                ),
              ),
              TextButton.icon(
                onPressed: () => aoIr(SecaoSite.inicio),
                icon: const Icon(
                  Icons.arrow_upward_rounded,
                  size: 18,
                  color: Colors.white70,
                ),
                label: Text(
                  'Voltar ao topo',
                  style: SiteText.estilo(
                    tamanho: 14,
                    peso: FontWeight.w600,
                    cor: Colors.white70,
                    altura: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Links extends StatelessWidget {
  final ValueChanged<SecaoSite> aoIr;

  const _Links({required this.aoIr});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        for (final secao in SecaoSite.values.where(
          (s) => s != SecaoSite.inicio,
        ))
          TextButton(
            onPressed: () => aoIr(secao),
            child: Text(
              secao.titulo,
              style: SiteText.estilo(
                tamanho: 14,
                peso: FontWeight.w600,
                cor: Colors.white70,
                altura: 1.2,
              ),
            ),
          ),
      ],
    );
  }
}
