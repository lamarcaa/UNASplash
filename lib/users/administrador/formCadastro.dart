import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/users/administrador/cadastraAtleta.dart';
import './menuPrincipalAdm.dart';
import '../../helper/usuarios.dart';
import '../../helper/atleta.dart';
import '../../helper/lista.dart';
import 'dart:async';

// lista das opções para o dropdown
const List<String> list = <String>['Administrador', 'Treinador', 'Atleta'];

void main() => runApp(FormCadastro());

class FormCadastro extends StatelessWidget {
  FormCadastro({Key? key}) : super(key: key);

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
  final nomeUsuario = TextEditingController();
  final emailUsuario = TextEditingController();
  String dropdownValue = list.first;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Text(
                'Preencha o formulário e cadastre novos usuários no sistema!',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              SizedBox(height: 20),
              Text(
                'Qual tipo de usuário deseja cadastrar?',
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            value,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                    underline: Container(),
                    icon: Icon(Icons.arrow_drop_down),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextFieldPadrao(
                controller: nomeUsuario,
                hintText: 'Nome',
                obscureText: false,
              ),
              SizedBox(height: 25),
              TextFieldPadrao(
                controller: emailUsuario,
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(height: 20),
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
                hintText: 'Cadastrar Usuário',
                onTap: () {
                  trataCampos(dropdownValue);
                },
              ),
              SizedBox(height: 10),
              Visibility(
                visible: dropdownValue == 'Atleta',
                child: BotaoSecundario(
                  hintText: 'Cadastrar todos os dados do atleta',
                  onTap: () {
                    trataCampos(dropdownValue);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void trataCampos(String tipoUsuario) {
    if (nomeUsuario.text.isEmpty || emailUsuario.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Preencha todos os campos'),
        ),
      );
    } else {
      switch (tipoUsuario) {
        case 'Atleta':
          cadastrarAtleta();
          break;
        case 'Administrador':
        case 'Treinador':
          cadastrarUsuario();
          break;
        default:
      }
    }
  }

  void cadastrarAtleta() {
    Atleta novoAtleta =
        Atleta(nomeUsuario.text, emailUsuario.text, dropdownValue);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Atleta cadastrado com sucesso'),
      ),
    );

    ListaUsuarios.listaDeAtleta.add(novoAtleta);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
    // );
  }

  void cadastrarUsuario() {
    Usuario novoUsuario =
        Usuario(nomeUsuario.text, emailUsuario.text, dropdownValue);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Usuário cadastrado com sucesso'),
      ),
    );

    ListaUsuarios.listaDeUsuarios.add(novoUsuario);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
    // );
  }
}
