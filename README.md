# TexFlow Site

Landing page de apresentação do aplicativo TexFlow, feita em Flutter Web.

## Rodar localmente

```
flutter pub get
flutter run -d chrome
```

Ou, para abrir em qualquer navegador:

```
flutter run -d web-server --web-port 8080
```

e acessar http://localhost:8080

## Gerar os arquivos para hospedagem

```
flutter build web --release
```

Os arquivos ficam em `build/web`. Basta enviar o conteúdo dessa pasta para a hospedagem.

Se o site for publicado em uma subpasta (por exemplo `https://dominio.com/texflow/`), gere com:

```
flutter build web --release --base-href /texflow/
```

## Estrutura

- `lib/data/site_content.dart`: todos os textos, recursos, etapas, tecnologias e a equipe. É o único arquivo que precisa mudar para trocar o conteúdo.
- `lib/theme/`: cores, fontes e tema.
- `lib/sections/`: cada seção da página (início, recursos, telas do app, como funciona, tecnologias, equipe e rodapé).
- `lib/widgets/`: componentes reutilizáveis (botão, cartões, barra de navegação, moldura do celular, animação de entrada).
- `lib/widgets/mock/`: telas do aplicativo desenhadas em Flutter para a demonstração.
- `lib/pages/landing_page.dart`: monta a página e controla a rolagem entre as seções.

## Publicar no GitHub Pages (gratuito)

O site é 100% estático e não chama nenhuma API, então não há nada de CORS para configurar.

O endereço fica `https://<dono>.github.io/<nome-do-repositório>/`. Para este repositório (`TexFlowDevs/texflow_site`):
`https://texflowdevs.github.io/texflow_site/`

O ponto mais importante é o `--base-href`, que precisa ser o nome do repositório. Sem ele a página abre em branco.

### Opção 1: automática, com GitHub Actions (recomendada)

1. Suba o projeto na branch `main` do repositório. O arquivo `.github/workflows/deploy.yml` já está pronto.
2. No GitHub, vá em **Settings > Pages** e, em **Source**, escolha **GitHub Actions**.
3. A cada push na `main` o site é testado, gerado e publicado sozinho. O progresso aparece na aba **Actions**.

### Opção 2: manual

1. Gere os arquivos com o nome do repositório:

```
flutter build web --release --base-href "/texflow_site/"
```

2. Envie o conteúdo da pasta `build/web` para a branch `gh-pages` do repositório.
3. Em **Settings > Pages**, escolha a branch `gh-pages`, pasta `/ (root)`.

O arquivo `.nojekyll` já vai junto no build e evita que o GitHub processe a pasta como Jekyll.

### Domínio próprio

Se usar domínio próprio, gere com `--base-href "/"` e configure o domínio em **Settings > Pages**.
