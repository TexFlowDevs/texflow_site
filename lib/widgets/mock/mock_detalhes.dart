import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/widgets/mock/mock_parts.dart';

class MockDetalhes extends StatelessWidget {
  const MockDetalhes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SiteColors.background,
      child: Column(
        children: [
          const MockStatusBar(),
          const MockAppBar(titulo: 'Detalhes da produção'),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MockCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Moda João',
                              style: SiteText.estilo(
                                tamanho: 14,
                                peso: FontWeight.w800,
                                altura: 1.2,
                              ),
                            ),
                            const MockBadge(
                              texto: 'Em produção',
                              cor: SiteColors.primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _Etiqueta(texto: 'OP-7', cor: SiteColors.ink),
                            const SizedBox(width: 6),
                            _Etiqueta(
                              texto: 'MOD-FEM-045',
                              cor: SiteColors.primary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 11,
                              color: SiteColors.muted,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              'Entrega em 15/10/2026',
                              style: SiteText.estilo(
                                tamanho: 10,
                                cor: SiteColors.muted,
                                altura: 1.2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  MockCard(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progresso geral',
                              style: SiteText.estilo(
                                tamanho: 11,
                                peso: FontWeight.w800,
                                altura: 1.2,
                              ),
                            ),
                            Text(
                              '62%',
                              style: SiteText.estilo(
                                tamanho: 11,
                                peso: FontWeight.w800,
                                cor: SiteColors.primary,
                                altura: 1.2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        const MockProgress(
                          valor: 0.62,
                          cor: SiteColors.primary,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '2 de 5 processos concluídos',
                          style: SiteText.estilo(
                            tamanho: 9,
                            cor: SiteColors.muted,
                            altura: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'GRADE DE ROUPAS',
                    style: SiteText.estilo(
                      tamanho: 9,
                      peso: FontWeight.w800,
                      espacamento: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: SiteColors.border),
                    ),
                    child: const Column(
                      children: [
                        _LinhaGrade('TAMANHO', 'QUANTIDADE', cabecalho: true),
                        _LinhaGrade('P', '30 pç'),
                        _LinhaGrade('M', '48 pç', zebra: true),
                        _LinhaGrade('G', '35 pç'),
                        _LinhaGrade('Total', '113 pç', total: true),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'PROCESSOS PRODUTIVOS',
                    style: SiteText.estilo(
                      tamanho: 9,
                      peso: FontWeight.w800,
                      espacamento: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const _Processo(
                    nome: 'Corte',
                    empresa: 'Cortex Ltda.',
                    status: 'Concluído',
                    cor: SiteColors.success,
                    icone: Icons.check,
                  ),
                  const SizedBox(height: 6),
                  const _Processo(
                    nome: 'Costura',
                    empresa: 'Alfa Costuras',
                    status: 'Em produção',
                    cor: SiteColors.primary,
                    icone: Icons.schedule,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final String texto;
  final Color cor;

  const _Etiqueta({required this.texto, required this.cor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: SiteColors.background,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Text(
        texto,
        style: SiteText.estilo(
          tamanho: 9,
          peso: FontWeight.w700,
          cor: cor,
          altura: 1.2,
        ),
      ),
    );
  }
}

class _LinhaGrade extends StatelessWidget {
  final String tamanho;
  final String quantidade;
  final bool cabecalho;
  final bool zebra;
  final bool total;

  const _LinhaGrade(
    this.tamanho,
    this.quantidade, {
    this.cabecalho = false,
    this.zebra = false,
    this.total = false,
  });

  @override
  Widget build(BuildContext context) {
    Color fundo = Colors.white;
    if (cabecalho) fundo = SiteColors.background;
    if (zebra) fundo = const Color(0xFFFAFAFC);
    if (total) fundo = const Color(0xFFEDF0F7);

    final cor = cabecalho ? SiteColors.muted : SiteColors.ink;
    final peso = cabecalho || total ? FontWeight.w800 : FontWeight.w600;
    final tamanhoFonte = cabecalho ? 8.0 : 10.0;

    return Container(
      color: fundo,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tamanho,
            style: SiteText.estilo(
              tamanho: tamanhoFonte,
              peso: peso,
              cor: cor,
              altura: 1.2,
            ),
          ),
          Text(
            quantidade,
            style: SiteText.estilo(
              tamanho: tamanhoFonte,
              peso: peso,
              cor: cor,
              altura: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}

class _Processo extends StatelessWidget {
  final String nome;
  final String empresa;
  final String status;
  final Color cor;
  final IconData icone;

  const _Processo({
    required this.nome,
    required this.empresa,
    required this.status,
    required this.cor,
    required this.icone,
  });

  @override
  Widget build(BuildContext context) {
    return MockCard(
      padding: const EdgeInsets.all(9),
      child: Row(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: cor.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(icone, size: 14, color: cor),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nome,
                  style: SiteText.estilo(
                    tamanho: 11,
                    peso: FontWeight.w800,
                    altura: 1.2,
                  ),
                ),
                Text(
                  empresa,
                  style: SiteText.estilo(
                    tamanho: 9,
                    cor: SiteColors.muted,
                    altura: 1.3,
                  ),
                ),
              ],
            ),
          ),
          MockBadge(texto: status, cor: cor),
        ],
      ),
    );
  }
}
