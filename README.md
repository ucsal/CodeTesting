# Projeto Final Joaldo e Yla

O projeto é uma plataforma gameficada para estudo de lógica de programação. O projeto está dividido em dois módulos: `projetoFinal_api` e `projetoFinal_client`

## projetoFinal_api 

back-end feito em Java, com Sptring Boot, JPA, Hibernate e banco de dados h2-console

## projetoFinal_client

front-end do projeto feito em Angular [Angular CLI](https://github.com/angular/angular-cli) versão 13.1.3.

## Executando o projeto

Como existem três modulos diferentes, é preciso executar cada modulo separadamente

### Executanto o projeto do back-end

Pelo intellij, dar run no projeto

### Executanto o projeto do front-end

Rodar `npm install` no terminal dentro do diretório `projetoFinal_client` para atualizar as dependencias ou baixa-las se estiver executando pela primeira vez. Se é a primeira vez que roda o comando deve ser gerada a pasta `node_modules`

Depois que as dependencias foram instaladas corretamente, rodar `ng serve` para subir o projeto para o servido local

Pelo navegador, acessar `http://localhost:4200/`, as alterações salvas são carregadas automaticamente

### Executando o projeto mobile

Fazer a instalação da framework Flutter [aqui](https://docs.flutter.dev/get-started/install).

Assim que o framework estiver devidamente instalado, basta executar `flutter pub get` para a instalação dos pacotes remotos e, em sequência, `flutter run` no terminal para executar o projeto.

**Obs: O device padrão é o chrome, caso queira um device específico, basta abrir ele antes de executar o comando `flutter run`.**

**Obs: É obrigatório ter o Android Studio instalado na máquina caso deseje rodar em dispositivos virtuais Android. Mas, é possível fazer alterações em qualquer IDE ou Editor de Texto com suporte para Flutter e Dart.**
