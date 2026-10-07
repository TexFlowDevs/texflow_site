import 'package:flutter/material.dart';
import 'package:texflow_site/theme/site_colors.dart';

enum SecaoSite {
  inicio('Início'),
  recursos('Recursos'),
  app('O app'),
  como('Como funciona'),
  tecnologias('Tecnologias'),
  equipe('Desenvolvedores');

  final String titulo;

  const SecaoSite(this.titulo);
}

class Recurso {
  final IconData icone;
  final String titulo;
  final String descricao;
  final Color cor;

  const Recurso({
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.cor,
  });
}

class Destaque {
  final IconData icone;
  final String titulo;
  final String descricao;

  const Destaque({
    required this.icone,
    required this.titulo,
    required this.descricao,
  });
}

class Etapa {
  final String numero;
  final IconData icone;
  final String titulo;
  final String descricao;

  const Etapa({
    required this.numero,
    required this.icone,
    required this.titulo,
    required this.descricao,
  });
}

class Tecnologia {
  final IconData icone;
  final String nome;
  final String funcao;
  final Color cor;

  const Tecnologia({
    required this.icone,
    required this.nome,
    required this.funcao,
    required this.cor,
  });
}

class TelaApp {
  final String rotulo;
  final IconData icone;
  final String titulo;
  final String descricao;
  final List<String> pontos;

  const TelaApp({
    required this.rotulo,
    required this.icone,
    required this.titulo,
    required this.descricao,
    required this.pontos,
  });
}

class MembroEquipe {
  final String nome;

  const MembroEquipe({required this.nome});
}

class SiteContent {
  static const nome = 'TexFlow';

  static const slogan = 'Gestão de processos têxteis';

  static const tituloHero =
      'Sua produção têxtil, do corte à entrega, em um só lugar.';

  static const subtituloHero =
      'O TexFlow organiza pedidos, grades de tamanhos e processos produtivos, para você '
      'acompanhar cada etapa da confecção com clareza, direto do celular.';

  static const destaques = [
    Destaque(
      icone: Icons.sync_alt_rounded,
      titulo: '4 status',
      descricao: 'Planejamento, em produção, concluído e cancelado',
    ),
    Destaque(
      icone: Icons.straighten_rounded,
      titulo: 'Grade por tamanho',
      descricao: 'Pedido e fabricação lado a lado',
    ),
    Destaque(
      icone: Icons.factory_outlined,
      titulo: 'Etapas por empresa',
      descricao: 'Cada processo com o seu responsável',
    ),
    Destaque(
      icone: Icons.admin_panel_settings_outlined,
      titulo: 'Perfis de acesso',
      descricao: 'Operador e supervisor',
    ),
  ];

  static const recursos = [
    Recurso(
      icone: Icons.dashboard_customize_outlined,
      titulo: 'Painel da produção',
      descricao: 'Veja de uma vez quantos pedidos estão em produção, concluídos, cancelados ou em planejamento.',
      cor: SiteColors.primary,
    ),
    Recurso(
      icone: Icons.receipt_long_outlined,
      titulo: 'Detalhes de cada pedido',
      descricao: 'Cliente, referência, data de entrega, progresso geral e todas as etapas em uma única tela.',
      cor: SiteColors.purple,
    ),
    Recurso(
      icone: Icons.grid_view_rounded,
      titulo: 'Grade de roupas',
      descricao: 'Quantidades por tamanho, do PP ao GG, com o total calculado automaticamente.',
      cor: SiteColors.success,
    ),
    Recurso(
      icone: Icons.account_tree_outlined,
      titulo: 'Processos produtivos',
      descricao: 'Corte, costura, bordado, lavagem e embalagem, cada um com a empresa responsável e o status.',
      cor: SiteColors.warning,
    ),
    Recurso(
      icone: Icons.search_rounded,
      titulo: 'Pesquisa rápida',
      descricao: 'Encontre qualquer produção pelo cliente, pela referência ou pelo código do pedido.',
      cor: SiteColors.primary,
    ),
    Recurso(
      icone: Icons.add_business_outlined,
      titulo: 'Empresas e clientes',
      descricao: 'Cadastre os clientes e as empresas parceiras e use nos pedidos sem digitar de novo.',
      cor: SiteColors.purple,
    ),
    Recurso(
      icone: Icons.groups_outlined,
      titulo: 'Equipe com perfis',
      descricao: 'Cadastre operadores e supervisores e cada pessoa acessa o aplicativo com a própria conta.',
      cor: SiteColors.success,
    ),
    Recurso(
      icone: Icons.lock_outline_rounded,
      titulo: 'Conta protegida',
      descricao: 'Senhas criptografadas, troca de senha pelo próprio app e recuperação por e-mail.',
      cor: SiteColors.danger,
    ),
  ];

  static const telas = [
    TelaApp(
      rotulo: 'Painel',
      icone: Icons.dashboard_outlined,
      titulo: 'Tudo o que está acontecendo na fábrica',
      descricao: 'A tela inicial resume a produção por status e lista os pedidos em andamento com o progresso de cada um.',
      pontos: [
        'Contadores por status em tempo real',
        'Cards de produção com porcentagem concluída',
        'Acesso rápido à pesquisa e ao novo pedido',
      ],
    ),
    TelaApp(
      rotulo: 'Detalhes',
      icone: Icons.fact_check_outlined,
      titulo: 'Cada pedido, do começo ao fim',
      descricao: 'Ao tocar em um card, o app busca o pedido no servidor e mostra tudo sobre ele.',
      pontos: [
        'Progresso geral e processos concluídos',
        'Grade de tamanhos com total',
        'Lista de etapas com empresa e status',
      ],
    ),
    TelaApp(
      rotulo: 'Novo pedido',
      icone: Icons.add_task_rounded,
      titulo: 'Abra um pedido em poucos toques',
      descricao: 'Escolha o cliente, defina a data de entrega, monte a grade e organize as etapas da produção.',
      pontos: [
        'Cliente escolhido entre os cadastrados',
        'Quantidades por tamanho com um toque',
        'Processos adicionados na ordem certa',
      ],
    ),
  ];

  static const etapas = [
    Etapa(
      numero: '01',
      icone: Icons.edit_note_rounded,
      titulo: 'Cadastre o pedido',
      descricao: 'Informe o cliente, a data de entrega, a grade de tamanhos e as etapas da produção.',
    ),
    Etapa(
      numero: '02',
      icone: Icons.track_changes_rounded,
      titulo: 'Acompanhe cada etapa',
      descricao: 'Veja o andamento no painel e atualize o status de cada processo conforme ele avança.',
    ),
    Etapa(
      numero: '03',
      icone: Icons.task_alt_rounded,
      titulo: 'Conclua e entregue',
      descricao: 'Com todos os processos concluídos, o pedido está pronto para chegar ao cliente no prazo.',
    ),
  ];

  static const tecnologias = [
    Tecnologia(
      icone: Icons.phone_android_rounded,
      nome: 'Flutter',
      funcao: 'Aplicativo e este site, com o mesmo código base',
      cor: SiteColors.primary,
    ),
    Tecnologia(
      icone: Icons.hub_outlined,
      nome: 'Provider',
      funcao: 'Gerenciamento de estado e telas sempre atualizadas',
      cor: SiteColors.purple,
    ),
    Tecnologia(
      icone: Icons.api_rounded,
      nome: 'Spring Boot',
      funcao: 'API REST em Java que atende o aplicativo',
      cor: SiteColors.success,
    ),
    Tecnologia(
      icone: Icons.storage_rounded,
      nome: 'PostgreSQL',
      funcao: 'Banco de dados relacional com os pedidos e processos',
      cor: SiteColors.primary,
    ),
    Tecnologia(
      icone: Icons.cloud_outlined,
      nome: 'Render',
      funcao: 'Hospedagem da API com publicação automática',
      cor: SiteColors.warning,
    ),
    Tecnologia(
      icone: Icons.enhanced_encryption_outlined,
      nome: 'BCrypt',
      funcao: 'Criptografia das senhas dos usuários',
      cor: SiteColors.danger,
    ),
  ];

  static const equipe = [
    MembroEquipe(nome: 'Emerson Lucas Bertelli Cardoso'),
    MembroEquipe(nome: 'Lucas Portella'),
    MembroEquipe(nome: 'Gabriel Reiter'),
  ];

  static const projeto = 'Projeto do curso +Devs2Blu';
}
