import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: CadastraUser(),
  ));
}

class CadastraUser extends StatefulWidget {
  const CadastraUser({super.key});

  @override
  State<CadastraUser> createState() => _CadastraUserState();
}

final nomeUsuario = TextEditingController();
final emailUsuario = TextEditingController();
List<String> tipoUsuario = <String>['Administrador', 'Treinador', 'Atleta'];
String dropdownValue = 'Administrador';

class _CadastraUserState extends State<CadastraUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        automaticallyImplyLeading: false,
        elevation: 5,
        title: Text(
          "Cadastro de Usuários",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                'Cadastre administradores, treinadores e atletas no sistema!',
                style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(204, 30, 30, 30),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      children: [
                        TextSpan(
                          text: '1.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              ' Que tipo de usuário deseja cadastrar no sistema?',
                        ),
                      ],
                    ),
                  )),
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
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      children: [
                        TextSpan(
                          text: '2.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text:
                              ' Nome completo do usuário que deseja cadastrar',
                        ),
                      ],
                    ),
                  )),
            ),
            TextFieldPadrao(
              controller: nomeUsuario,
              text: 'Digite o nome completo',
              obscureText: false,
            ),
            SizedBox(height: 25),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                      children: [
                        TextSpan(
                          text: '3.',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' Digite o email do usuário',
                        ),
                      ],
                    ),
                  )),
            ),
            TextFieldPadrao(
              controller: emailUsuario,
              text: 'Digite o email',
              obscureText: false,
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    size: 25,
                    color: Colors.yellow[600],
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'A senha de primeiro acesso do usuário será enviada por email!',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
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
    );
  }

  void trataCampos() {
    if (nomeUsuario.text.isEmpty || emailUsuario.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Preencha todos os campos!",
        ),
      );
    } else {
      cadastrarUsuario();
    }
  }

  Future<void> cadastrarUsuario() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailUsuario.text,
        password: "senhaPadrao123",
      );

      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Usuário cadastrado com sucesso!",
        ),
      );
    } catch (e) {
      print("Erro ao cadastrar usuário: $e");
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          message:
              "Erro ao cadastrar usuário. Verifique os dados e tente novamente.",
        ),
      );
    }
  }
}
