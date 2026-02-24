# Aula - Dia 26/01 
## Periodo - Manhã
Nas primeiras aulas, foram feitas as configurações básicas para o começo do curso.

Dentre elas, foi feito a configuração de um perfil unico no computador para nosso curso, onde teremos acesso como administrador no computador, sem necessitar de senha todo momento.

A partir disso, fizemoss a conexão do Git Bash, o software de versionamento responsavel por configurar nossa maquina local, após, conectamos ao GitHub que nos conecta na nuvem.

Comandos utilizados para configurar o email e username de forma local no gitbash:
git config --global user.email
git config --global user.name

Depois, para conectarmos no GitHub, entramos no VSCode e autenticamos no navegador.

Fizemos tambem perfis no nosso editor de texto (VsCode), para evitar problemas com as extensões.

Para facilitar nas aulas, utilizamos do Live Share, que replica o VsCode do professor em nossa tela

E por fim, foi feita a criação de uma pasta no diretório de Documentos do computador local, diretamente do terminal, para armazenamos os nossos materiais das aulas.

Comandos utilizados: 
mkdir - Criação de diretórios
cd - Para entrar nas pastas
ls - Listar 
type null > "README.md" - Criar o arquivo README

# Aula -  Dia 03/02
## Periodo - Manhã
### Introdução ao Desenvolvimento Mobile
### Tipos de Desenvolvimento

- Nativo
    - Android
        - SDK: Adroid SDK
        - IDE: Android Studio
        - Linguagens: Kotlin e Java 
        - Ambientes: Mac, Windows, Linux

    - iOS:
    - SDK: Cocoa Touch 
    - IDE: Xcode
    - Linguagens: Swift / Objectype-C
    - Ambientes: Mac

- Multiplataforma
    - React Native:
    - SDK: Node.JS
    - IDE: VSCode
    - Linguagens: JavaScript / TypeScript
    - Ambientes: Mac, Windows, Linux

    - Flutter
        - SDK: Flutter SDK
        - IDE: VSCode, Android Studio
        - Linguagens: Dart
        - Ambiente: Mac, Windows, Linux

# Aula - 10/02
## Periodo - Manhã
## Preparação do Ambiente de Desenvolvimento

## Instalação do FlutterSDK
- Download do arquivo ZIP na página flutter.dev
- Inclusão do flutter na pasta C:\src
- Inclusão do flutter\bin nas varáveis de ambiente
- Teste o flutter --version

### Instalação do AndroidSDK
- Download do Android SDK - Command Line Tools
- Adicionar o Command-line ao c:\src\AndroidSDK
- Adicionar o SKDManager as Variáveis de Ambiente
- Download dos pacotes
    - Emulador
    - Platforms
    - Platform-tools
    - Build-tools

- Adicionar ADB e o Emulator as Variáveis de Ambiente 

- Criação da Imagem do Emulador
- Build do Emulador

## Criação de Projetos e Códigos na Linha de Comando

- Criação de Projetos
    - `flutter create <nome_do_app>`
        - flags (parâmetros):
            - --empty : Cria um aplicativo "vazio" (Hello World!)
            - --platforms : Permite a seleção de uma plataforma de desenvolvimento
                - ex: `--platforms=android` (a criação do projeto será somente para a plataforma android)
    - Exemplo de criação de uma aplicativo android vazio
        - `flutter create nome_do_app --empty --platforms=android`
        - Obs: nome do aplicativo tem que ter todas as letras minuscular, separação de palavras com _
    - `flutter Doctor`
        - Permite correção de pequenos problemas no Flutter e identificação de parâmetros funcionais em relação as plataformas de desenvolvimento
        - Sempre rodas o `flutter doctor` no começo do desenvolvimento
    - `flutter clean`
        - limpa o cache do build
    - `flutter run -v`
        - build do app (apk)