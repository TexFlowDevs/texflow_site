import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';
import 'package:texflow_site/theme/site_text.dart';
import 'package:texflow_site/widgets/mock/mock_parts.dart';

class MockNovoPedido extends StatelessWidget {
  const MockNovoPedido({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SiteColors.background,
      child: Column(
        children: [
          const MockStatusBar(),
          const MockAppBar(titulo: 'Novo pedido'),
          Expanded(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Campo(
                    rotulo: 'CLIENTE',
                    valor: 'Moda João',
                    icone: Icons.business_outlined,
                    seta: true,
                  ),
                  const SizedBox(height: 10),
                  const _Campo(
                    rotulo: 'DATA DE ENTREGA',
                    valor: '15/10/2026',
                    icone: Icons.calendar_today_outlined,
                  ),
                  const SizedBox(height: 14),
                  Text(
                    'GRADE DE ROUPAS',
                    style: SiteText.estilo(
                      tamanho: 9,
                      peso: FontWeight.w800,
                      espacamento: 0.5,
                    ),
                  ),
                  const SizedBox(height: 6),
                  const MockCard(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Column(
                      children: [
                        _LinhaQuantidade(tamanho: 'P', quantidade: 30),
                        _LinhaQuantidade(tamanho: 'M', quantidade: 48),
                        _LinhaQuantidade(tamanho: 'G', quantidade: 35),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PROCESSOS',
                        style: SiteText.estilo(
                          tamanho: 9,
                          peso: FontWeight.w800,
                          espacamento: 0.5,
                        ),
                      ),
                      Text(
                        '+ Adicionar',
                        style: SiteText.estilo(
                          tamanho: 10,
                          peso: FontWeight.w700,
                          cor: SiteColors.primary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const _LinhaProcesso(ordem: '1', nome: 'Corte'),
                  const SizedBox(height: 6),
                  const _LinhaProcesso(ordem: '2', nome: 'Costura'),
                  const SizedBox(height: 14),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: SiteColors.navy,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Criar pedido',
                        style: SiteText.estilo(
                          tamanho: 12,
                          peso: FontWeight.w700,
                          cor: Colors.white,
                          altura: 1.2,
                        ),
                      ),
                    ),
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

class _Campo extends StatelessWidget {
  final String rotulo;
  final String valor;
  final IconData icone;
  final bool seta;

  const _Campo({
    required this.rotulo,
    required this.valor,
    required this.icone,
    this.seta = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          rotulo,
          style: SiteText.estilo(
            tamanho: 8,
            peso: FontWeight.w700,
            cor: SiteColors.muted,
            espacamento: 0.5,
            altura: 1.2,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: SiteColors.border),
          ),
          child: Row(
            children: [
              Icon(icone, size: 14, color: SiteColors.muted),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  valor,
                  style: SiteText.estilo(tamanho: 11, altura: 1.2),
                ),
              ),
              if (seta)
                const Icon(
                  Icons.arrow_drop_down,
                  size: 18,
                  color: SiteColors.muted,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LinhaQuantidade extends StatelessWidget {
  final String tamanho;
  final int quantidade;

  const _LinhaQuantidade({required this.tamanho, required this.quantidade});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              tamanho,
              style: SiteText.estilo(
                tamanho: 12,
                peso: FontWeight.w800,
                altura: 1.2,
              ),
            ),
          ),
          const _Botao(icone: Icons.remove),
          SizedBox(
            width: 34,
            child: Center(
              child: Text(
                '$quantidade',
                style: SiteText.estilo(
                  tamanho: 12,
                  peso: FontWeight.w700,
                  altura: 1.2,
                ),
              ),
            ),
          ),
          const _Botao(icone: Icons.add),
        ],
      ),
    );
  }
}

class _Botao extends StatelessWidget {
  final IconData icone;

  const _Botao({required this.icone});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        color: SiteColors.background,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(icone, size: 14, color: SiteColors.ink),
    );
  }
}

class _LinhaProcesso extends StatelessWidget {
  final String ordem;
  final String nome;

  const _LinhaProcesso({required this.ordem, required this.nome});

  @override
  Widget build(BuildContext context) {
    return MockCard(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: SiteColors.primary.withValues(alpha: 0.12),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                ordem,
                style: SiteText.estilo(
                  tamanho: 10,
                  peso: FontWeight.w800,
                  cor: SiteColors.primary,
                  altura: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              nome,
              style: SiteText.estilo(
                tamanho: 11,
                peso: FontWeight.w700,
                altura: 1.2,
              ),
            ),
          ),
          const Icon(Icons.drag_indicator, size: 16, color: SiteColors.muted),
        ],
      ),
    );
  }
}
