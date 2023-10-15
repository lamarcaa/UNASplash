import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/dataPicker.dart';
import 'package:unasplash/componentes/dropDown.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/menuPrincipal/treinador/menuPrincipalTreinador.dart';

void main() {
  runApp(MaterialApp(
    home: FormTreinoAvaliativo(),
  ));
}

class FormTreinoAvaliativo extends StatefulWidget {
  const FormTreinoAvaliativo({super.key});

  @override
  _FormTreinoAvaliativoState createState() => _FormTreinoAvaliativoState();
}

class _FormTreinoAvaliativoState extends State<FormTreinoAvaliativo> {
  String selectedEstiloTreino = 'Craw';
  String selectedTreinador = 'Ricardo';
  DateTime? dataTreinoDia;

  @override
  Widget build(BuildContext context) {
    List<String> estiloTreino = <String>[
      'Craw',
      'Costas',
      'Peito',
      'Borboleta',
      'Medley'
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Treino Avaliativo'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Titulo(
                  titulo: 'Finalize o Treino Avaliativo',
                  subTitulo:
                      'Preencha o formulário para completar as informações!'),
              SizedBox(
                height: 30,
              ),
              Text(
                'Estilo do Treino:',
              ),
              SizedBox(
                height: 10,
              ),
              DropDownPadrao(list: estiloTreino, dropdownValue: 'Craw'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Data do Treino:',
              ),
              SizedBox(
                height: 10,
              ),
              DataPickerPadrao(),
              SizedBox(
                height: 30,
              ),
              TextFieldPadrao(
                  text: 'Frequência Cardíaca Inicial', obscureText: false),
              SizedBox(
                height: 30,
              ),
              TextFieldPadrao(
                  text: 'Frequência Cardíaca Final', obscureText: false),
              SizedBox(
                height: 30,
              ),
              BotaoPrincipal(
                text: 'Cadastrar Treino Avaliativo',
                onTap: () {
                  showTopSnackBar(
                    Overlay.of(context),
                    CustomSnackBar.success(
                      message: "Treino avaliativo cadastrado com sucesso!",
                    ),
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MenuPrincipalTreinador()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
