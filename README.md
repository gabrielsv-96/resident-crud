# CRUD de Municipes

Projeto concebido como desafio técnico com o objetivo de cadastrar municipes e seus respectivos endereços utilizando uma arquitetura Rails de forma monolítica.

## Versões

* Ruby 2.5.8
* Rails 5.2
* Docker 24.0.5

## Configurar projeto localmente

Este projeto é público, é possível cloná-lo através dos métodos *HTTP* ou *SSH* através deste repositório.

### Docker
Após baixar o projeto em sua máquina, é necessário possuir uma versão do Docker em sua máquina, o *Docker* pode 
ser instalado através do [link oficial do produto](https://www.docker.com/products/docker-desktop/), ou, em caso de distribuições linux, ele pode ser obtido através do seguinte comando:
`apt install docker`.

### Setup inicial do projeto
Com o Docker devidamente instalado, é possível navegar até o diretório do projeto e realizar o setup inicial, onde serão instaladas todas as dependências e configurado o banco de dados *PostgreSQL*
que será usado no projeto, para isso, estando no diretório do projeto, basta inserir o seguinte comando no terminal `docker compose build`.

### Iniciar e acessar projeto
Com a build devidamente finalizada, o projeto já pode ser iniciado, para isso, basta inserir o seguinte comando `docker compose up`, e, após isso, é possivel navegar até o projeto no navegador
através do endereço *localhost*, ou, em caso do projeto estar rodando em subsistemas como o *wsl*, ele pode ser acessado através do IP do *wsl* e da porta 3000.
