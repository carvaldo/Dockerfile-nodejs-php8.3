# Dockerfile Node.js + PHP 8.3

Imagem Docker baseada em `php:8.3-cli` para desenvolvimento web, com Node.js LTS, Composer e extensões PHP comuns para projetos modernos.

## O que esta imagem inclui

- PHP 8.3 (CLI)
- Node.js LTS (via NodeSource)
- Composer
- Locale `pt_BR.UTF-8`
- Utilitários de sistema (`curl`, `wget`, `zip`, `unzip`, `nano`, `ping`)
- Extensões PHP:
  - `pdo`, `pdo_mysql`, `pgsql`, `pdo_pgsql`
  - `mbstring`, `exif`, `pcntl`, `bcmath`
  - `gd`, `zip`, `intl`, `calendar`, `sqlite3`
  - `imagick` (via PECL)

## Build da imagem

No diretório deste projeto, execute:

```bash
docker build -t carvaldo/node-php8.3 .
```

## Versionamento de tags

Padrão sugerido de versão para publicação:

- `carvaldo/node-php8.3:latest`
- `carvaldo/node-php8.3:1.0.x`

## Executar o container

Exemplo de execução com o volume do projeto local:

```bash
docker run --rm -it \
  -p 8000:8000 \
  -v "$PWD":/var/www/html \
  -w /var/www/html \
  carvaldo/node-php8.3 bash
```

## Verificações rápidas

Depois de iniciar o container:

```bash
php -v
node -v
npm -v
composer -V
php -m | rg "imagick|pdo|mbstring|gd|intl"
```

## Observações

- Diretório de trabalho padrão: `/var/www/html`
- Porta exposta no Dockerfile: `8000`
