dependencias da google:
dart pub add google_nav_bar

dependencias para hora e datas:
flutter pub add flutter_localizations --sdk=flutter
flutter pub add intl:any

dependencia do snackbar no topo:
flutter pub add top_snackbar_flutter

limpar projeto ao dar pull: flutter pub get --no-example

buildar no celular pelo wifi:

adb tcpip [ip], adb connect ip:[porta]

caminho adb: C:\Users\glama\AppData\Local\Android\Sdk\platform-tools

funcionar o run without debugging em qualquer tela: 

void main() {
  runApp(MaterialApp(
    home: [nome da classe](),
  ));
}