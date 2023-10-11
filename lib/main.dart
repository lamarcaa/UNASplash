import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/helper/lista.dart';
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
  final novaSenha = TextEditingController();
  final confNovaSenha = TextEditingController();
  bool controlaVisibility1 = false;
  bool controlaVisibility2 = false;

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
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          height: 700,
                          color: Colors.white,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Visibility(
                                  visible: !controlaVisibility1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                          recuperaSenha(emailRecupera.text);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: controlaVisibility2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Titulo(
                                          titulo: 'Digite sua nova senha',
                                          subTitulo: ''),
                                      TextFieldPadrao(
                                        hintText: 'Senha',
                                        obscureText: false,
                                        controller: emailRecupera,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      TextFieldPadrao(
                                        hintText: 'Confirmar Senha',
                                        obscureText: false,
                                        controller: emailRecupera,
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      BotaoSecundario(
                                        hintText: 'Cadastrar nova senha',
                                        onTap: () {
                                          recuperaSenha(emailRecupera.text);
                                        },
                                      ),
                                    ],
                                  ),
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

  void recuperaSenha(String email) {
    print('Lista de Usuários:');
    for (var usuario in ListaUsuarios.listaDeUsuarios) {
      print(usuario.nome);
      print(usuario.email);
      print(usuario.senha);
    }

    for (var usuarios in ListaUsuarios.listaDeUsuarios) {
      if (usuarios.email == email) {
        print('Email encontrado');
        controlaVisibility1 = true;
        controlaVisibility2 = false;
      }
    }

    print('Lista de Atletas:');
    for (var atleta in ListaUsuarios.listaDeAtleta) {
      print(atleta.nome);
      print(atleta.email);
      print(atleta.senha);
    }

    for (var atleta in ListaUsuarios.listaDeAtleta) {
      if (atleta.email == email) {
        print('Email encontrado');
        controlaVisibility1 = true;
        controlaVisibility2 = false;
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
}
