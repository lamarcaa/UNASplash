import 'package:flutter/material.dart';
import 'package:unasplash/componentes/botaoSecundario.dart';

class DataPickerPadrao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BotaoSecundario(
      text: 'Selecione a data',
      onTap: () {
        _selectDate(context);
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    ))!;
  }
}
