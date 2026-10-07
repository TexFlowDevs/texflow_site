import 'package:flutter/material.dart';
import 'package:texflow_site/data/site_content.dart';
import 'package:texflow_site/sections/features_section.dart';
import 'package:texflow_site/sections/footer_section.dart';
import 'package:texflow_site/sections/hero_section.dart';
import 'package:texflow_site/sections/showcase_section.dart';
import 'package:texflow_site/sections/steps_section.dart';
import 'package:texflow_site/sections/team_section.dart';
import 'package:texflow_site/sections/tech_section.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/widgets/site_logo.dart';
import 'package:texflow_site/widgets/site_nav_bar.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scroll = ScrollController();
  final _deslocamento = ValueNotifier<double>(0);
  final _chaves = {for (final secao in SecaoSite.values) secao: GlobalKey()};

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() => _deslocamento.value = _scroll.offset);
  }

  @override
  void dispose() {
    _scroll.dispose();
    _deslocamento.dispose();
    super.dispose();
  }

  void _ir(SecaoSite secao) {
    final contexto = _chaves[secao]!.currentContext;
    if (contexto == null) return;

    Scrollable.ensureVisible(
      contexto,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOutCubic,
    );
  }

  void _irPeloMenu(SecaoSite secao) {
    Navigator.pop(context);
    _ir(secao);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: _MenuLateral(aoSelecionar: _irPeloMenu),
      floatingActionButton: ValueListenableBuilder<double>(
        valueListenable: _deslocamento,
        builder: (context, valor, child) {
          return AnimatedScale(
            scale: valor > 700 ? 1 : 0,
            duration: const Duration(milliseconds: 250),
            child: FloatingActionButton(
              backgroundColor: SiteColors.primary,
              foregroundColor: Colors.white,
              tooltip: 'Voltar ao topo',
              onPressed: () => _ir(SecaoSite.inicio),
              child: const Icon(Icons.arrow_upward_rounded),
            ),
          );
        },
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scroll,
            child: Column(
              children: [
                KeyedSubtree(
                  key: _chaves[SecaoSite.inicio],
                  child: HeroSection(aoIr: _ir),
                ),
                KeyedSubtree(
                  key: _chaves[SecaoSite.recursos],
                  child: const FeaturesSection(),
                ),
                KeyedSubtree(
                  key: _chaves[SecaoSite.app],
                  child: const ShowcaseSection(),
                ),
                KeyedSubtree(
                  key: _chaves[SecaoSite.como],
                  child: const StepsSection(),
                ),
                KeyedSubtree(
                  key: _chaves[SecaoSite.tecnologias],
                  child: const TechSection(),
                ),
                KeyedSubtree(
                  key: _chaves[SecaoSite.equipe],
                  child: const TeamSection(),
                ),
                FooterSection(aoIr: _ir),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ValueListenableBuilder<double>(
              valueListenable: _deslocamento,
              builder: (context, valor, child) {
                return SiteNavBar(
                  deslocamento: valor,
                  aoSelecionar: _ir,
                  aoAbrirMenu: () => _scaffoldKey.currentState?.openEndDrawer(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuLateral extends StatelessWidget {
  final ValueChanged<SecaoSite> aoSelecionar;

  const _MenuLateral({required this.aoSelecionar});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: SiteColors.navyDark,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SiteLogo(),
              const SizedBox(height: 32),
              for (final secao in SecaoSite.values)
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  onTap: () => aoSelecionar(secao),
                  title: Text(
                    secao.titulo,
                    style: SiteText.estilo(
                      tamanho: 18,
                      peso: FontWeight.w600,
                      cor: Colors.white,
                      altura: 1.2,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                    color: Colors.white38,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
