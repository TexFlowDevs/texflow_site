import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/widgets/mock/mock_parts.dart';

class MockDashboard extends StatelessWidget {
  const MockDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SiteColors.background,
      child: Column(
        children: [
          const MockStatusBar(),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(14, 6, 14, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Bom dia,',
                            style: SiteText.estilo(
                              tamanho: 11,
                              cor: SiteColors.muted,
                              altura: 1.3,
                            ),
                          ),
                          Text(
                            'Ana Carvalho',
                            style: SiteText.estilo(
                              tamanho: 18,
                              peso: FontWeight.w800,
                              altura: 1.2,
                            ),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.logout,
                        size: 18,
                        color: SiteColors.muted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  const Row(
                    children: [
                      Expanded(
                        child: _Contador(
                          valor: '8',
                          rotulo: 'Em produção',
                          cor: SiteColors.primary,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _Contador(
                          valor: '24',
                          rotulo: 'Concluídos',
                          cor: SiteColors.success,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Expanded(
                        child: _Contador(
                          valor: '1',
                          rotulo: 'Cancelado',
                          cor: SiteColors.danger,
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: _Contador(
                          valor: '5',
                          rotulo: 'Planejamento',
                          cor: SiteColors.purple,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PRODUÇÕES ATIVAS',
                        style: SiteText.estilo(
                          tamanho: 9,
                          peso: FontWeight.w800,
                          espacamento: 0.5,
                        ),
                      ),
                      Text(
                        'Ver todas',
                        style: SiteText.estilo(
                          tamanho: 10,
                          peso: FontWeight.w700,
                          cor: SiteColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const _CartaoProducao(
                    cliente: 'Moda João',
                    codigo: 'OP-7',
                    detalhe: '15/10/2026 · 150 peças',
                    referencia: 'Ref. MOD-FEM-045',
                    progresso: 0.6,
                    status: 'Em produção',
                    cor: SiteColors.primary,
                  ),
                  const SizedBox(height: 8),
                  const _CartaoProducao(
                    cliente: 'Baby Chic',
                    codigo: 'OP-8',
                    detalhe: '22/10/2026 · 320 peças',
                    referencia: 'Ref. INF-012',
                    progresso: 0.25,
                    status: 'Em produção',
                    cor: SiteColors.primary,
                  ),
                  const SizedBox(height: 8),
                  const _CartaoProducao(
                    cliente: 'Casa Mod',
                    codigo: 'OP-9',
                    detalhe: '30/10/2026 · 90 peças',
                    referencia: 'Ref. CAM-203',
                    progresso: 0.0,
                    status: 'Planejamento',
                    cor: SiteColors.purple,
                  ),
                ],
              ),
            ),
          ),
          const _BarraInferior(),
        ],
      ),
    );
  }
}

class _Contador extends StatelessWidget {
  final String valor;
  final String rotulo;
  final Color cor;

  const _Contador({
    required this.valor,
    required this.rotulo,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valor,
            style: SiteText.estilo(
              tamanho: 20,
              peso: FontWeight.w800,
              cor: cor,
              altura: 1.1,
            ),
          ),
          Text(
            rotulo,
            style: SiteText.estilo(
              tamanho: 10,
              cor: SiteColors.muted,
              altura: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _CartaoProducao extends StatelessWidget {
  final String cliente;
  final String codigo;
  final String detalhe;
  final String referencia;
  final double progresso;
  final String status;
  final Color cor;

  const _CartaoProducao({
    required this.cliente,
    required this.codigo,
    required this.detalhe,
    required this.referencia,
    required this.progresso,
    required this.status,
    required this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cliente,
                style: SiteText.estilo(
                  tamanho: 12,
                  peso: FontWeight.w800,
                  altura: 1.2,
                ),
              ),
              MockBadge(texto: status, cor: cor),
            ],
          ),
          Text(
            codigo,
            style: SiteText.estilo(
              tamanho: 10,
              cor: SiteColors.muted,
              altura: 1.4,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            detalhe,
            style: SiteText.estilo(
              tamanho: 10,
              cor: SiteColors.muted,
              altura: 1.3,
            ),
          ),
          const SizedBox(height: 6),
          MockProgress(valor: progresso, cor: cor),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                referencia,
                style: SiteText.estilo(
                  tamanho: 9,
                  cor: SiteColors.muted,
                  altura: 1.2,
                ),
              ),
              Text(
                '${(progresso * 100).round()}% concluído',
                style: SiteText.estilo(
                  tamanho: 9,
                  peso: FontWeight.w700,
                  cor: cor,
                  altura: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BarraInferior extends StatelessWidget {
  const _BarraInferior();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: SiteColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const _ItemBarra(
            icone: Icons.home_filled,
            rotulo: 'Início',
            ativo: true,
          ),
          const _ItemBarra(icone: Icons.search, rotulo: 'Pesquisa'),
          Container(
            width: 38,
            height: 38,
            decoration: const BoxDecoration(
              color: SiteColors.navBar,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.add, color: Colors.white, size: 20),
          ),
          const _ItemBarra(icone: Icons.settings_outlined, rotulo: 'Config.'),
          const _ItemBarra(icone: Icons.business_outlined, rotulo: 'Empresa'),
        ],
      ),
    );
  }
}

class _ItemBarra extends StatelessWidget {
  final IconData icone;
  final String rotulo;
  final bool ativo;

  const _ItemBarra({
    required this.icone,
    required this.rotulo,
    this.ativo = false,
  });

  @override
  Widget build(BuildContext context) {
    final cor = ativo ? SiteColors.navBar : SiteColors.muted;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icone, size: 17, color: cor),
        Text(
          rotulo,
          style: SiteText.estilo(
            tamanho: 8,
            peso: ativo ? FontWeight.w800 : FontWeight.w400,
            cor: cor,
            altura: 1.3,
          ),
        ),
      ],
    );
  }
}
