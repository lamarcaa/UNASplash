import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/helper/usuarios.dart';
import 'users/administrador/menuPrincipalAdm.dart';
import 'package:unasplash/users/treinador/menuPrincipalTreinador.dart';
import 'package:unasplash/users/atleta/menuPrincipalAtleta.dart';

void main() => runApp(const MyApp());

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
  // controllers para o form
  final emailUsuario = TextEditingController();
  final senhaUsuario = TextEditingController();
  final emailRecupera = TextEditingController();

  get listaDeUsuarios => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://i.imgur.com/WMIjSHr.png',
                width: 300,
              ),
              SizedBox(height: 10),
              Text(
                'Bem vindo de volta, sentimos sua falta!',
                style: TextStyle(color: Colors.grey[700], fontSize: 16),
              ),
              SizedBox(height: 25),
              TextFieldPadrao(
                controller: emailUsuario,
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(height: 10),
              TextFieldPadrao(
                controller: senhaUsuario,
                hintText: 'Senha',
                obscureText: true,
              ),
              SizedBox(height: 30),
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
                    print("clicou");
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 300,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Titulo(
                                    titulo: 'Esqueceu sua senha?',
                                    subTitulo: 'Digite seu email:'),
                                TextFieldPadrao(
                                  hintText: 'Email',
                                  obscureText: false,
                                  controller: emailRecupera,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                BotaoSecundario(
                                  hintText: 'Recuperar',
                                  onTap: () {
                                    recuperarSenha(emailRecupera.text);
                                  },
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
              SizedBox(height: 25),
              BotaoPrincipal(
                hintText: 'Entre no Aplicativo',
                onTap: () {
                  verificarUsuario(emailUsuario.text, senhaUsuario.text);
                  usuarioLista(emailUsuario.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verificarUsuario(String email, String senha) {
    if (email == '123' && senha == '123') {
      redirecionaMenu(context, 'administrador');
    } else if (email == '456' && senha == '456') {
      redirecionaMenu(context, 'treinador');
    } else if (email == '789' && senha == '789') {
      redirecionaMenu(context, 'atleta');
    } else if (email.isEmpty || senha.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Digite as credenciais para logar'),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Email e senha inválidos, tente novamente'),
        ),
      );
    }
  }

  void usuarioLista(String email) {
    for (Usuario usuario in listaDeUsuarios) {
      if (usuario.email == email) {
        print('Encontrou');
      }
    }
  }

  void redirecionaMenu(BuildContext context, String tipoUsuario) {
    if (tipoUsuario == 'administrador') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
      );
    } else if (tipoUsuario == 'treinador') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPrincipalTreinador()),
      );
    } else if (tipoUsuario == 'atleta') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPrincipalAtleta()),
      );
    }
  }

  void recuperarSenha(String emailRecupera) {
    if (emailRecupera.isEmpty) {
      print('vazio');
    } else {}
  }
}
