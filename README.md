UNASPLASH - Natação UNAERP

Desafio 7a etapa de ENG Software

============================= GRUPO =================================

Gabriel Lamarca Galdino da Silva - 836666
Guilherme Galvão - 835862

=====================================================================


============= Dependencias necessárias para a compilação ============

apenas rodar os comandos apaixo no cmd:

-=- dependencias da google:
comando: dart pub add google_nav_bar

-=- dependencias para hora e datas:
comando: flutter pub add flutter_localizations --sdk=flutter
comando: flutter pub add intl:any

-=- dependencia do biblioteca do snackbar no topo:
comando: flutter pub add top_snackbar_flutter


======================================================================

============= Usuários e senhas para entrar no aplicativo ============

 -=- Administrador:
  usuário: 123
  senha:   123

 -=- Treinador:
  usuário: 456
  senha:   456

 -=- Atleta:
  usuário: 789
  senha:   789


======================================================================


================= anotações para mim, favor ignorar ==================

limpar projeto ao dar pull: flutter pub get --no-example

buildar no celular pelo wifi:

adb connect [ip]:[porta]

caminho adb: C:\Users\glama\AppData\Local\Android\Sdk\platform-tools

funcionar o run without debugging em qualquer tela: 

void main() {
  runApp(MaterialApp(
    home: [nome da classe](),
  ));
}

======================================================================