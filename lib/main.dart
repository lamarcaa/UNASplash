import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/textfield.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Text(
                    'Esqueceu sua senha? Clique aqui',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
              ]),
              SizedBox(height: 25),
              BotaoPrincipal(
                hintText: 'Entre no Aplicativo',
                onTap: () {
                  verificarUsuario(
                      context, emailUsuario.text, senhaUsuario.text);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void verificarUsuario(BuildContext context, String email, String senha) {
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
