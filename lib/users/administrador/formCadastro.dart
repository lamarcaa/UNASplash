import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import '../../helper/usuarios.dart';
import '../../helper/atleta.dart';
import '../../helper/lista.dart';

const List<String> list = <String>['Administrador', 'Treinador', 'Atleta'];

class FormCadastro extends StatelessWidget {
  FormCadastro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyStatefulWidget();
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
    return Container(
      color: Colors.grey[50],
      height: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Titulo(
                titulo: 'CADASTRO DE USUÁRIOS',
                subTitulo:
                    'Preencha o formulário e cadastre novo usuários no sistema',
              ),
              Text(
                'Qual tipo de usuário deseja cadastrar?',
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(height: 10),
              DropDownPadrao(list: list, dropdownValue: 'Administrador'),
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
                        SizedBox(width: 10),
                        Container(
                          width: 300,
                          child: Text(
                            'A senha de primeiro acesso do usuário será enviada por email',
                            style: TextStyle(color: Colors.grey[600]),
                            softWrap: true,
                          ),
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
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Preencha todos os campos!",
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
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: "Atleta cadastrado com sucesso!",
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

    showTopSnackBar(
    Overlay.of(context),
    CustomSnackBar.success(
      message:
          "Usuário cadastrado com sucesso!",
    ),
);

    ListaUsuarios.listaDeUsuarios.add(novoUsuario);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => MenuPrincipalAdm()),
    // );
  }
}
