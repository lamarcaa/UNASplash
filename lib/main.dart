import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/helper/lista.dart';
import 'package:unasplash/users/administrador/menuPrincipalAdm.dart';
import 'package:unasplash/users/atleta/menuPrincipalAtleta.dart';
import 'package:unasplash/users/treinador/menuPrincipalTreinador.dart';

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
                                      hintText: 'Email',
                                      obscureText: false,
                                      controller: emailRecupera,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    BotaoSecundario(
                                      hintText: 'Recuperar',
                                      onTap: () {
                                        recuperaSenha(
                                            emailRecupera.text, context);
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
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Digite as credênciais para logar",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message: "Email ou senha inválidos, tente novamente",
        ),
      );
    }
  }

  void recuperaSenha(String email, BuildContext context) {
    print('Lista de Usuários:');
    for (var usuario in ListaUsuarios.listaDeUsuarios) {
      print(usuario.nome);
      print(usuario.email);
      print(usuario.senha);
    }

    for (var usuario in ListaUsuarios.listaDeUsuarios) {
      if (usuario.email == email) {
        print('Email encontrado');
        confirmarSenha();
      } else if (email.isEmpty) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(
            message: "Digite algo!",
          ),
        );
      } else if (email != usuario.email) {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(
            message: "Email não encontrado",
          ),
        );
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
        confirmarSenha();
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.info(
            message: "Email não encontrado",
          ),
        );
      }
    }
  }

  Future confirmarSenha() {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          height: double.infinity,
          child: Wrap(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Titulo(
                    titulo: 'Cadastre sua nova senha',
                    subTitulo: 'Digite a nova senha:',
                  ),
                  TextFieldPadrao(
                    hintText: 'Nova senha',
                    obscureText: false,
                    controller: novaSenha,
                  ),
                  SizedBox(height: 10),
                  TextFieldPadrao(
                    hintText: 'Confirmar senha',
                    obscureText: false,
                    controller: confNovaSenha,
                  ),
                  SizedBox(height: 10),
                  BotaoPrincipal(
                    hintText: 'Cadastrar nova senha',
                    onTap: () {
                      cadastrarNovaSenha(novaSenha.text, confNovaSenha.text);
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void cadastrarNovaSenha(String novaSenha, String confNovaSenha) {
    print(novaSenha);
    print(confNovaSenha);

    if (novaSenha == confNovaSenha) {
      for (var usuario in ListaUsuarios.listaDeUsuarios) {
        if (usuario.email == emailRecupera.text) {
          usuario.senha = novaSenha;
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "Senha alterada com sucesso!",
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      }
    } else if (novaSenha.isEmpty || confNovaSenha.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Digite as senhas",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "As senhas não coincidem",
        ),
      );
    }

    if (novaSenha == confNovaSenha) {
      for (var atleta in ListaUsuarios.listaDeAtleta) {
        if (atleta.email == emailRecupera.text) {
          atleta.senha = novaSenha;
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.success(
              message: "Senha alterada com sucesso!",
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        }
      }
    } else if (novaSenha.isEmpty || confNovaSenha.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Digite as senhas",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "As senhas não coincidem",
        ),
      );
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
