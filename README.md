# Desafio Técnico iOS

## Sobre o projeto

Este repositório contém o desafio técnico para candidatos à posição de desenvolvedor iOS em nosso time. O objetivo inicial é fornecer uma tela de login funcional. Ao inserir um usuário e senha válidos, o candidato será direcionado para uma tela em branco. Durante o teste, explicaremos o que gostaríamos que fosse desenvolvido nessa tela.

Não se preocupe com o layout das telas seguintes, tudo isso será fornecido conforme a necessidade durante o desafio.

## Estrutura do projeto

O projeto que utilizaremos no desafio foi estruturado pensando na separação em camadas (ainda que estas não estejam em projetos/targets separados nesse primeiro momento). Veja abaixo uma listagem das principais camadas e mais abaixo um detalhamento de cada uma delas: 

- App
  - Infra
  - Root
  - Scenes
- Modules
  - CoraClient
  - CoraClientInterfaces
  - DesignSystem (DS)
- Tests

## App

#### Infra

Camada responsável pelo registro e gerenciamento de nossas dependências. Neste projeto seguimos a abordagem de criar um baixo acoplamento entre as camadas, e a camada de Infra será a responsável por gerenciar essa resolução de dependências. 

*Dica:* caso não tenha familiaridade com injeção de dependência, sugerimos que dedique um tempo de estudo antes do desafio.

#### Root

Apenas uma pasta criada para organização, mas como o próprio nome sugere, ela contém os arquivos que fazem a inicialização da aplicação, ou seja, `AppDelegate.swift` e afins. 

#### Scenes

Aqui é onde você encontra as telas existentes e também onde você fará grande parte do seu código no dia do desafio. Estamos utilizando o padrão `MVVM`.

Inicialmente entregaremos 3 telas funcionais, que serão a `Intro` a tela de `CPF` e a tela de `Senha`.

<img width="300" alt="Intro" src="https://github.com/user-attachments/assets/a7b72ca9-3887-4598-a874-5a25e47d77ea">

<img width="300" alt="CPF" src="https://github.com/user-attachments/assets/28653553-ce2f-4052-b73f-2515d2c936c1">

<img width="300" alt="password" src="https://github.com/user-attachments/assets/02d8a154-b98a-427d-8b65-d2af95c80d97">
<br />
<br />

*Dica:* não curtiu o padrão MVVM? Tem alguma sugestão de outro padrão? Traga para discussão durante o desafio... Só lembre que será uma discussão, logo, você precisa de embasamento para defender sua tese.

## Modules

#### CoraClientInterfaces

Camada que possui apenas os contratos da nossa camada de rede. 

#### CoraClient

Camada dedicada as chamadas de rede (REST). Como em toda empresa que começamos a trabalhar, sempre temos essa camada pronto e quase nunca há a necessidade de mudanças nela (salvo exceções de quando você começa o projeto do zero). Aqui o objetivo é exatamente este, não queremos ver você implementar manualmente algo que no dia a dia você terá pronto, então, estude o funcionamento e esteja pronto para usar com fluência no dia do desafio.

*Dica:* caso veja possibilidades de melhoria nessa camada traga para discussão.

#### DesignSystem (DS)

Ao entrar para o nosso time você fará uso do nosso [Design System](https://brasil.uxdesign.cc/afinal-o-que-%C3%A9-design-system-448c257b0021) interno (o Arco) e decidimos trazer algo similar ao que você encontrará no dia a dia da Cora. A ideia dessa camada é entregar para você componentes prontos que podem ser reutilizados e customizados (até certo ponto) de acordo com a necessidade de suas telas. 

Neste módulo é possível acessar o projeto Sample, e a partir dele ver o exemplo de uso de todos os elementos do DS.

*Dica:* durante o desafio, avalie se algum componente visual que você está criando não faz sentido estar dentro do DS.

## Tests

Temos dois diretórios dedicados aos testes unitários e de UI (apesar de não haver nenhum escrito neste). O nome é auto-explicativo, basicamente é aqui onde esperamos que você nos mostre como garante que seu código se comporta conforme o esperado. 

*Dica:* aqui não testamos para cobrir linhas de código, nosso objetivo é validar comportamentos.

## O que esperar do desafio técnico

Esperamos que você se familiarize com as implementações que temos nesse repositório. Navegue pelos arquivos, entenda o que já está implementado e como está implementado. Prepare-se para estar com o projeto configurado e rodando no dia do teste, faremos a codificação em par (talvez trio), e você será o piloto.

Temos uma lista com diversas funcionalidades a serem implementadas nesse projeto, propositalmente simulando um backlog, e no dia escolheremos uma (ou mais) dessas funcionalidades para desenvolvermos juntos.

O objetivo é avaliar suas habilidades em:
- Comunicação;
- Linha de raciocínio durante a solução de problemas;
- Implementação de layouts responsivos e intuitivos;
- Integração com APIs RESTful;
- Gerenciamento de estados e armazenamento de dados;
- Boas práticas de codificação e estruturação de projetos;


### Estamos ansiosos para ver como você abordará o desafio!
