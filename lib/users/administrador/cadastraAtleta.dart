import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPequeno.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/textfield.dart';
import '../../helper/usuarios.dart';
import '../../helper/atleta.dart';
import '../../helper/lista.dart';

void main() => runApp(CadastroAtleta());

class CadastroAtleta extends StatelessWidget {
  CadastroAtleta({Key? key}) : super(key: key);

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
  final nomeMae = TextEditingController();
  final nomePai = TextEditingController();
  final clubeOrigem = TextEditingController();
  final trabalho = TextEditingController();
  bool btnRadio = false;
  bool controlaBtn = false;
  final medicamento = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              Text(
                'Cadastro de Atletas',
                style: TextStyle(color: Colors.grey[600], fontSize: 30),
              ),
              SizedBox(height: 20),
              Text(
                'Campos opcionais',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              SizedBox(height: 5),
              TextFieldPadrao(
                controller: nomeMae,
                hintText: 'Nome da Mãe',
                obscureText: false,
              ),
              SizedBox(height: 10),
              TextFieldPadrao(
                controller: nomePai,
                hintText: 'Nome do Pai',
                obscureText: false,
              ),
              SizedBox(height: 10),
              TextFieldPadrao(
                controller: clubeOrigem,
                hintText: 'Clube de Origem',
                obscureText: false,
              ),
              SizedBox(height: 10),
              TextFieldPadrao(
                controller: trabalho,
                hintText: 'Local de Trabalho',
                obscureText: false,
              ),
              SizedBox(height: 20),
              Text(
                'Tem alergia a algum medicamento?',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Não'),
                  Radio(
                    value: false,
                    groupValue: btnRadio,
                    onChanged: (value) {
                      setState(() {
                        btnRadio = value ?? false;
                        controlaBtn = false;
                      });
                    },
                  ),
                  SizedBox(width: 50),
                  Text('Sim'),
                  Radio(
                    value: true,
                    groupValue: btnRadio,
                    onChanged: (value) {
                      setState(() {
                        btnRadio = value ?? false;
                        controlaBtn = true;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Visibility(
                visible: controlaBtn,
                child: TextFieldPadrao(
                  controller: trabalho,
                  hintText: 'Quais?',
                  obscureText: false,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Anexos:',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              SizedBox(height: 10),
              BotaoPequeno(hintText: 'Comprovante de Residência'),
              SizedBox(height: 10),
              BotaoPequeno(hintText: 'Foto 3X4'),
              SizedBox(height: 10),
              BotaoPequeno(hintText: 'Regulamento Assinado'),
              SizedBox(height: 20),
              Text(
                'Campos Obrigatórios',
                style: TextStyle(color: Colors.grey[600], fontSize: 15),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.warning_rounded,
                          size: 25,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 5),
                        Text(
                          'A senha de primeiro acesso do usuário será enviada por email',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              BotaoPrincipal(
                hintText: 'Cadastrar Atleta',
                onTap: () {
                  //trataCampos();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  // void trataCampos(String tipoUsuario) {
  //   if (nomeUsuario.text.isEmpty || emailUsuario.text.isEmpty) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Preencha todos os campos'),
  //       ),
  //     );
  //   } else {
  //     switch (tipoUsuario) {
  //       case 'Atleta':
  //         cadastrarAtleta();
  //         break;
  //       case 'Administrador':
  //       case 'Treinador':
  //         cadastrarUsuario();
  //         break;
  //       default:
  //     }
  //   }
  // }

  // void cadastrarAtleta() {
  //   Atleta novoAtleta =
  //       Atleta(nomeUsuario.text, emailUsuario.text, dropdownValue);

  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Atleta cadastrado com sucesso'),
  //     ),
  //   );

  // ListaUsuarios.listaDeAtleta.add(novoAtleta);

  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
  // );
}

// void cadastrarUsuario() {
//   Usuario novoUsuario =
//       Usuario(nomeUsuario.text, emailUsuario.text, dropdownValue);

//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Usuário cadastrado com sucesso'),
//     ),
//   );

// ListaUsuarios.listaDeUsuarios.add(novoUsuario);

// Navigator.push(
//   context,
//   MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
// );
//   }
// }
