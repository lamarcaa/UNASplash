import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';
import 'package:unasplash/componentes/labelCard.dart';
import 'package:unasplash/componentes/titulo.dart';

void main() {
  runApp(const MaterialApp(
    home: PerfilAtleta(),
  ));
}

class PerfilAtleta extends StatelessWidget {
  const PerfilAtleta({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 42),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Atleta'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
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
                  Titulo(titulo: 'Rafael Nunes', subTitulo: 'Atleta'),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                    info: 'Nome: Rafael Nunes',
                    icone: Icons.people_alt,
                  ),
                  LabelCard(
                    info: 'Sexo: Masculino',
                    icone: Icons.wc,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LabelCard(
                    info: 'Email: rnunes@outlook.com',
                    icone: Icons.email_rounded,
                  ),
                  LabelCard(
                    info: 'Papel: Atleta',
                    icone: Icons.contact_page_rounded,
                  ),
                  LabelCard(
                    info: 'Data de Nascimento: 12/07/1999',
                    icone: Icons.calendar_today,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                    info: 'RG: 56050108-5',
                    icone: Icons.credit_card,
                  ),
                  LabelCard(
                    info: 'CPF: 46378071805',
                    icone: Icons.credit_card,
                  ),
                  LabelCard(
                    info: 'Telefone Pessoal: (16) 99731-8256',
                    icone: Icons.phone,
                  ),
                  LabelCard(
                    info: 'Telefone Emergencial: (16) 92754-1749',
                    icone: Icons.phone,
                  ),
                  LabelCard(
                    info: 'Telefones Opcionais: Não cadastrado',
                    icone: Icons.phone,
                  ),
                  LabelCard(
                    info: 'Naturalidade: Ribeirão Preto',
                    icone: Icons.location_on,
                  ),
                  LabelCard(
                    info: 'Nacionalidade: Brasil',
                    icone: Icons.location_on,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                    info: 'Rua: Rua Amazonas, 759',
                    icone: Icons.home,
                  ),
                  LabelCard(
                    info: 'Bairro: Novo Ribeirão',
                    icone: Icons.location_on,
                  ),
                  LabelCard(
                    info: 'Número: 123',
                    icone: Icons.location_on,
                  ),
                  LabelCard(
                    info: 'CEP: 14315709',
                    icone: Icons.location_on,
                  ),
                  LabelCard(
                    info: 'Alergia a Medicamentos: Não',
                    icone: Icons.medical_services,
                  ),
                  LabelCard(
                    info: 'Nome da Mãe: Maria Nunes',
                    icone: Icons.person,
                  ),
                  LabelCard(
                    info: 'Nome do Pai: João Nunes',
                    icone: Icons.person,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  LabelCard(
                    info: 'Clube de Origem: Clube ABC',
                    icone: Icons.sports_soccer,
                  ),
                  LabelCard(
                    info: 'Local de Trabalho: Empresa ABC',
                    icone: Icons.work,
                  ),
                  LabelCard(
                    info: 'Convênio Médico: ABC',
                    icone: Icons.local_hospital,
                  ),
                  LabelCard(
                    info: 'Alergia a Medicamentos? Não',
                    icone: Icons.medical_services,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  BotaoSecundario(text: 'Editar'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
