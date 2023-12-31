import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unasplash/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FormCadastro());
}

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
  List<String> tipoUsuario = <String>[
    'Administrador',
    'Treinador',
  ];
  String dropdownValue = 'Administrador';

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
                    'Preencha o formulário e cadastre novo usuários no sistema!',
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'Qual tipo de usuário deseja cadastrar?',
                style: TextStyle(color: Colors.grey[700], fontSize: 15),
              ),
              SizedBox(height: 10),
              DropDownPadrao(
                list: tipoUsuario,
                dropdownValue: dropdownValue,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
              SizedBox(height: 25),
              TextFieldPadrao(
                controller: nomeUsuario,
                text: 'Nome',
                obscureText: false,
              ),
              SizedBox(height: 25),
              TextFieldPadrao(
                controller: emailUsuario,
                text: 'Email',
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
                            'A senha de primeiro acesso será enviada por email.',
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
                text: 'Cadastrar Usuário',
                onTap: () {
                  trataCampos();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> trataCampos() async {
    String nome = nomeUsuario.text;
    String email = emailUsuario.text;
    String senha = "senhaPadrao123"; // Defina sua lógica de senha aqui

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: senha,
      );

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Usuário cadastrado com sucesso!",
        ),
      );

      print('Usuário $email cadastrado com sucesso!');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "A senha fornecida é muito fraca.",
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "O email fornecido já está em uso.",
          ),
        );
      } else {
        showTopSnackBar(
          Overlay.of(context),
          CustomSnackBar.error(
            message: "Erro ao cadastrar usuário: ${e.message}",
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
