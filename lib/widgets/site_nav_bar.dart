import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/utils/responsive.dart';
import 'package:texflow_site/widgets/site_logo.dart';

class SiteNavBar extends StatelessWidget {
  final double deslocamento;
  final ValueChanged<SecaoSite> aoSelecionar;
  final VoidCallback aoAbrirMenu;

  const SiteNavBar({
    super.key,
    required this.deslocamento,
    required this.aoSelecionar,
    required this.aoAbrirMenu,
  });

  @override
  Widget build(BuildContext context) {
    final progresso = (deslocamento / 120).clamp(0.0, 1.0);
    final desktop = Responsive.desktop(context);

    return Container(
      height: 76,
      padding: EdgeInsets.symmetric(horizontal: Responsive.margem(context)),
      decoration: BoxDecoration(
        color: SiteColors.navyDark.withValues(alpha: 0.94 * progresso),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withValues(alpha: 0.08 * progresso),
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25 * progresso),
            blurRadius: 24,
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Row(
            children: [
              GestureDetector(
                onTap: () => aoSelecionar(SecaoSite.inicio),
                child: const MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: SiteLogo(),
                ),
              ),
              const Spacer(),
              if (desktop) ...[
                for (final secao in SecaoSite.values.where(
                  (s) => s != SecaoSite.inicio,
                ))
                  _LinkNav(secao: secao, aoTocar: () => aoSelecionar(secao)),
              ] else
                IconButton(
                  onPressed: aoAbrirMenu,
                  icon: const Icon(
                    Icons.menu_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinkNav extends StatefulWidget {
  final SecaoSite secao;
  final VoidCallback aoTocar;

  const _LinkNav({required this.secao, required this.aoTocar});

  @override
  State<_LinkNav> createState() => _LinkNavState();
}

class _LinkNavState extends State<_LinkNav> {
  bool _sobre = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _sobre = true),
      onExit: (_) => setState(() => _sobre = false),
      child: GestureDetector(
        onTap: widget.aoTocar,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.secao.titulo,
                style: SiteText.estilo(
                  tamanho: 15,
                  peso: FontWeight.w600,
                  cor: _sobre ? Colors.white : Colors.white70,
                  altura: 1.2,
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2,
                width: _sobre ? 24 : 0,
                decoration: BoxDecoration(
                  gradient: SiteColors.accentGradient,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
