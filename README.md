# Cadastro de Municipes

Projeto concebido como desafio técnico com o objetivo de cadastrar municipes e seus respectivos endereços, simulando um sistema a ser utilizado pelos poderes públicos municipais, utilizando uma arquitetura Ruby on Rails em versões legado e de forma monolítica, com um banco de dados relacional PostgreSQL, sustentados por contêineres Docker.

Como principal desafio, a proposta é utilizar uma versão antiga do framework Rails para a construção deste projeto, a ideia deste desafio veio da necessidade de certas empresas em alocar seus softwares já desenvolvidos há tempos em servidores e computadores datados, tal hardware que impossibilita a atualização dos sofwares para versões mais novas, forçando assim times e equipes a trabalharem com versões mais antigas de frameworks e linguagens.

A ideia de desenvolver um projeto sob essas circunstâncias me fez escolher a versão 5.2 do Rails, lançada em meados de 2018, versão com a qual eu também possuo experiência, o que me permitiu concluir este desafio e colher os aprendizados de tal proposta.

## Arquitetura

### Rails
  A decisão de utilizar Ruby on Rails veio pela forma como a mesma performa em pequenos projetos, por ser um framework SLIM e pela decisão de se trabalhar de forma monolítica neste projeto, sua dimensão faria com que o Rails garantisse uma ótima performance, além da baixa curva de aprendizado e facilidades na implementação, por ser o framework com o qual estou mais habituado a trabalhar.

### PostgreSQL
  O PostgreSQL é uma decisão comum de database ao se trabalhar com Rails, o mesmo possuí uma gem robusta e atualizada para o framework, além do PostgreSQL ser open-source, tornando seu uso gratuíto, um último ponto positivo sendo a minha experiência com PostgreSQL, que soma ao total 7 anos trabalhando com este database.

### Docker
  Como parte do desafio de se utilizar uma versão antiga de Rails para a construção desse projeto, a escolha do Docker para a escalabilidade do projeto é simples, a ideia de que é possível executar um projeto funcional em uma stack com versões antigas em qualquer máquina, além de que o processo de dockerização de um projeto Rails nestas dimensões é simples e rápido.

## Features

### Criação de munícipe
  Através da tela de índice do sistema, é possível cadastrar um munícipe, informando seus dados básicos e de contato, como nome, documento e e-mail, uma foto de perfil e além disso, seu endereço completo também pode ser cadastrado, ao finalizar o cadastro de um munícipe, um e-mail é enviado ao endereço eletrônico cadastrado do mesmo, avisando o munícipe sobre seu cadastro recém criado no sistema.

### Edição de munícipe
  Ao selecionar um munícipe cadastrado, podem ser alterados suas informações de contato, documentos, endereço e até mesmo a foto de perfil, ao finalizar a edição, um e-mail será disparado ao munícipe, avisando ao mesmo sobre a atualização de suas informações no sistema.

### Ativar e desativar um munícipe
  Dado o tipo de projeto que este simula, a exclusão de dados públicos é considerada um crime, então muitos sistemas optam por uma opção de `soft delete`, onde o dado é apenas ocultado para a visualização, mas a existência do mesmo não é comprometida, tal feature está presente no sistema, podendo alterar o status do munícipe entre ativo e inativo com o clicar de um botão ao editar as informações do mesmo.

## Execução

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

### Testes RSPEC
O projeto conta com uma quantidade de testes escritos em RSPEC visando cobrir os casos de uso do mesmo, para executar os testes, basta acessar o container que está executando o projeto em um novo terminal,
isso é possível através do comando `docker exec -it resident-crud-web-1 /bin/bash` e então, após ter acesso ao *bash* do container, executar o comando `rspec`.

