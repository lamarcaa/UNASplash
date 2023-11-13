import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() => runApp(cadastroInicialAtleta());

class cadastroInicialAtleta extends StatelessWidget {
  cadastroInicialAtleta({Key? key}) : super(key: key);

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
  final nomeAtleta = TextEditingController();
  final emailAtleta = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> tipoUsuario = <String>['Atleta'];
  List<String> estilos = <String>[
    'Crawl',
    'Costas',
    'Peito',
    'Borboleta',
    'Medlay'
  ];
  List<String> provas = <String>[
    '50m',
    '100m',
    '200m',
    '700m',
    '800m',
    '1500m'
  ];
  String dropdownValue1 = 'Crawl';
  String dropdownValue2 = '50m';

  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Titulo(
                  titulo: 'Cadastro Inicial de Atletas',
                  subTitulo:
                      'Preencha o formulário e comece o cadastro de um novo atleta!'),
              SizedBox(
                height: 30,
              ),
              TextFieldPadrao(
                controller: nomeAtleta,
                text: 'Nome completo',
                obscureText: false,
              ),
              SizedBox(height: 10),
              TextFieldPadrao(
                controller: emailAtleta,
                text: 'Email',
                obscureText: false,
              ),
              SizedBox(height: 10),
              Titulo(titulo: 'Competição', subTitulo: ''),
              Text(
                'Modalidade principal do atleta',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              DropDownPadrao(
                list: estilos,
                dropdownValue: dropdownValue1,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue1 = newValue!;
                  });
                },
              ),
              SizedBox(height: 10),
              Text(
                'Prova principal do atleta',
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 10),
              DropDownPadrao(
                list: provas,
                dropdownValue: dropdownValue2,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue2 = newValue!;
                  });
                },
              ),
              SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  children: [
                    Row(
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
                            'Administradores e Treinadores podem apenas inciar o cadastro do atleta, o restante das informações serão cadastradradas por ele mesmo.',
                            style: TextStyle(color: Colors.grey[600]),
                            softWrap: true,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
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
                            'A senha de primeiro acesso será enviada por email.',
                            style: TextStyle(color: Colors.grey[600]),
                            softWrap: true,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 50),
              BotaoPrincipal(
                text: 'Cadastrar Atleta',
                onTap: () {
                  trataCampos();
                },
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  void trataCampos() {
    if (nomeAtleta.text.isEmpty || emailAtleta.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Preencha todos os campos para continuar",
        ),
      );
    } else if (_formKey.currentState!.validate()) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Atleta criado com sucesso!",
        ),
      );
    }
  }
}