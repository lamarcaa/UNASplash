import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/botaoVazado.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/helper/lista.dart';
import 'package:unasplash/telas/menuPrincipalAdm.dart';
import 'package:unasplash/menuPrincipal/atleta/menuPrincipalAtleta.dart';
import 'package:unasplash/menuPrincipal/treinador/menuPrincipalTreinador.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  // controllers
  final emailUsuario = TextEditingController();
  final senhaUsuario = TextEditingController();
  final emailRecupera = TextEditingController();
  final novaSenha = TextEditingController();
  final confNovaSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://i.imgur.com/WMIjSHr.png',
                width: 300,
              ),
              SizedBox(height: 20),
              BotaoPrincipal(
                text: 'Entre no Aplicativo',
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Center(
                        child: Column(
                          children: [
                            SizedBox(height: 30),
                            Text(
                              'Bem vindo de volta, sentimos sua falta!',
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 129, 90, 90),
                                  fontSize: 16),
                            ),
                            SizedBox(height: 25),
                            TextFieldPadrao(
                              controller: emailUsuario,
                              text: 'Email',
                              obscureText: false,
                            ),
                            SizedBox(height: 10),
                            TextFieldPadrao(
                              controller: senhaUsuario,
                              text: 'Senha',
                              obscureText: true,
                            ),
                            SizedBox(height: 20),
                            BotaoPrincipal(
                              text: 'Entrar',
                              onTap: () {
                                verificarUsuario();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Text(
                      'Esqueceu sua senha? Clique aqui',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: double.infinity,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Titulo(
                                        titulo: 'Esqueceu sua senha?',
                                        subTitulo: 'Digite seu email:'),
                                    TextFieldPadrao(
                                      text: 'Email',
                                      obscureText: false,
                                      controller: emailRecupera,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BotaoSecundario(
                                      text: 'Recuperar',
                                      onTap: () {
                                        // recuperaSenha(
                                        //     emailRecupera.text, context);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ]),
            ],
          ),
        ),
      ),
    );
  }

  FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    verificarUsuario();
  }

  Future<void> verificarUsuario() async {
    User? user = _auth.currentUser;

    if (user != null) {
      setState(() {
        _user = user;
      });

      print('Usuário autenticado: ${user.displayName}');
    } else {
      print('Nenhum usuário autenticado');
    }
  }
}
