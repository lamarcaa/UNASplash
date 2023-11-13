import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:unasplash/componentes/botaoPequeno.dart';
import 'package:unasplash/componentes/botaoPrincipal.dart';
import 'package:unasplash/componentes/textfield.dart';
import 'package:unasplash/componentes/titulo.dart';
import 'package:unasplash/menuPrincipal/atleta/menuPrincipalAtleta.dart';

void main() => runApp(CadastroAtleta());

class CadastroAtleta extends StatelessWidget {
  CadastroAtleta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final _formKey = GlobalKey<FormState>();

  final rg = TextEditingController();
  final cpf = TextEditingController();
  final dtnNascimento = TextEditingController();
  final telefonePrincipal = TextEditingController();
  final telefoneEmergencial = TextEditingController();
  final rua = TextEditingController();
  final bairro = TextEditingController();
  final numero = TextEditingController();
  final cidade = TextEditingController();
  final cep = TextEditingController();
  final medicamentos = TextEditingController();
  final nomeMae = TextEditingController();
  final nomePai = TextEditingController();
  final clubeOrigem = TextEditingController();
  final trabalho = TextEditingController();
  final convenioMedico = TextEditingController();

  bool btnRadioSexo = false;
  bool btnRadioOutro = false;
  bool btnMedicamento = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuPrincipalAtleta()),
            );
          },
        ),
        title: Text('Cadastro do Atleta'),
      ),
      backgroundColor: Colors.grey[50],
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Titulo(
                  titulo: 'Complete seu Cadastro',
                  subTitulo:
                      'Ainda existem informações que estão faltando sobre você!',
                ),
                SizedBox(height: 10),
                Titulo(
                  titulo: 'Dados Pessoais',
                  subTitulo: '',
                ),
                TextFieldPadrao(
                  controller: rg,
                  text: 'RG',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 9,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: cpf,
                  text: 'CPF',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 11,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: dtnNascimento,
                  text: 'Data de Nascimento',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 8,
                ),
                SizedBox(height: 30),
                Text(
                  'Sexo',
                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Masculino'),
                    Radio(
                      value: false,
                      groupValue: btnRadioSexo,
                      onChanged: (value) {
                        setState(() {
                          btnRadioSexo = value as bool;
                          btnRadioOutro = false;
                        });
                      },
                    ),
                    SizedBox(width: 50),
                    Text('Feminino'),
                    Radio(
                      value: true,
                      groupValue: btnRadioSexo,
                      onChanged: (value) {
                        setState(() {
                          btnRadioSexo = !btnRadioSexo;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                TextFieldPadrao(
                  controller: telefonePrincipal,
                  text: 'Telefone Principal',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 11,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: telefoneEmergencial,
                  text: 'Telefone Emergencial',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 11,
                ),
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
                      groupValue: btnMedicamento,
                      onChanged: (value) {
                        setState(() {
                          btnMedicamento = !btnMedicamento;
                        });
                      },
                    ),
                    SizedBox(width: 50),
                    Text('Sim'),
                    Radio(
                      value: true,
                      groupValue: btnMedicamento,
                      onChanged: (value) {
                        setState(() {
                          btnMedicamento = !btnMedicamento;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Visibility(
                  visible: btnMedicamento,
                  child: TextFieldPadrao(
                    controller: trabalho,
                    text: 'Quais?',
                    obscureText: false,
                  ),
                ),
                Titulo(
                  titulo: 'Dados Residênciais',
                  subTitulo: '',
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: rua,
                  text: 'Rua',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: bairro,
                  text: 'Bairro',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: numero,
                  text: 'Número',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: cidade,
                  text: 'Cidade',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: cep,
                  text: 'CEP',
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  inputFormatter: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 8,
                ),
                SizedBox(height: 20),
                Titulo(
                  titulo: 'Informações Opcionais',
                  subTitulo: '',
                ),
                TextFieldPadrao(
                  controller: nomeMae,
                  text: 'Nome da Mãe',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: nomePai,
                  text: 'Nome do Pai',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: clubeOrigem,
                  text: 'Clube de Origem',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: trabalho,
                  text: 'Local de Trabalho',
                  obscureText: false,
                ),
                SizedBox(height: 10),
                TextFieldPadrao(
                  controller: convenioMedico,
                  text: 'Convênio Médico',
                  obscureText: false,
                ),
                SizedBox(height: 20),
                Titulo(
                  titulo: 'Anexos',
                  subTitulo: '',
                ),
                SizedBox(height: 10),
                BotaoPequeno(
                  text: 'Comprovante de Residência',
                ),
                SizedBox(height: 10),
                BotaoPequeno(
                  text: 'Foto 3X4',
                ),
                SizedBox(height: 10),
                BotaoPequeno(
                  text: 'Regulamento Assinado',
                ),
                SizedBox(height: 50),
                BotaoPrincipal(
                  text: 'Finalizar Cadastro',
                  onTap: () {
                    trataCampos();
                  },
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void trataCampos() {
    if (rg.text.isEmpty ||
        cpf.text.isEmpty ||
        dtnNascimento.text.isEmpty ||
        telefonePrincipal.text.isEmpty ||
        telefoneEmergencial.text.isEmpty ||
        rua.text.isEmpty ||
        bairro.text.isEmpty ||
        numero.text.isEmpty ||
        cidade.text.isEmpty ||
        cep.text.isEmpty) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.info(
          message: "Preencha todos os campos obrigatórios para continuar",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Cadastro Finalizado com sucesso!",
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MenuPrincipalAtleta()),
      );
    }
  }
}