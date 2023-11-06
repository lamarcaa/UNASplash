UNASPLASH - Natação UNAERP <br>

Desafio 6a etapa de ENG Software

============================= GRUPO =================================

Gabriel Lamarca Galdino da Silva - 836666 <br>
Guilherme Galvão - 835862

=====================================================================


============= Dependencias necessárias para a compilação ============

apenas rodar os comandos apaixo no cmd:

-=- dependencias da google: <br>
comando: dart pub add google_nav_bar <br>

-=- dependencias para hora e datas: <br>
comando: flutter pub add flutter_localizations --sdk=flutter <br>
comando: flutter pub add intl:any <br>

-=- dependencia do biblioteca do snackbar no topo: <br>
comando: flutter pub add top_snackbar_flutter 

-=- dependencia do firebase: <br>
comando: flutter pub add firebase_core

-=- dependencia do firebase * node necessário: <br>
comando: npm install -g firebase-tools
flutterfire configure
-=- dependencia do firebase<br>
comando: dart pub global activate flutterfire_cli

flutter pub add firebase_auth 





======================================================================

============= Usuários e senhas para entrar no aplicativo ============

 -=- Administrador: <br>
  usuário: 123 <br>
  senha:   123 <br>

 -=- Treinador: <br>
  usuário: 456 <br>
  senha:   456 <br>

 -=- Atleta: <br>
  usuário: 789 <br>
  senha:   789


======================================================================


================= anotações para mim, favor ignorar ==================

limpar projeto ao dar pull: flutter pub get --no-example <br>

buildar no celular pelo wifi: <br>

adb connect [ip]:[porta] <br>

caminho adb: C:\Users\glama\AppData\Local\Android\Sdk\platform-tools <br>

funcionar o run without debugging em qualquer tela:  <br>

void main() { <br>
  runApp(MaterialApp( <br>
    home: [nome da classe](), <br>
  )); <br>
} <br>

======================================================================
