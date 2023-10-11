import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/labelCard.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() {
  runApp(MaterialApp(
    home: PerfilAdministrador(),
  ));
}

class PerfilAdministrador extends StatelessWidget {
  const PerfilAdministrador({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 56, 56, 56),
        title: Text('Administrador'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Icon(
                    Icons.people_alt,
                    size: 100,
                  ),
                  Titulo(titulo: 'Maria da Silva', subTitulo: 'Administrador'),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                      info: 'Nome: Maria da Silva', icone: Icons.people_alt),
                  SizedBox(
                    height: 10,
                  ),
                  LabelCard(
                      info: 'Email: maria.silva@outlook.com',
                      icone: Icons.email_rounded),
                  SizedBox(
                    height: 10,
                  ),
                  LabelCard(
                      info: 'Papel: Administrador',
                      icone: Icons.contact_page_rounded),
                  SizedBox(
                    height: 10,
                  ),
                  LabelCard(
                      info: 'Senha: Altarda em 10/10/2023', icone: Icons.lock),
                  SizedBox(
                    height: 40,
                  ),
                  BotaoSecundario(
                    hintText: 'Editar as informações',
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
                                          titulo: 'Edite as informações',
                                          subTitulo: ''),
                                      TextFieldPadrao(
                                        hintText: 'Nome',
                                        obscureText: false,
                                        // controller: emailRecupera,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFieldPadrao(
                                        hintText: 'Email',
                                        obscureText: false,
                                        // controller: emailRecupera,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      BotaoPrincipal(hintText: 'Salvar'),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
