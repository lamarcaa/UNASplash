import 'package:flutter/material.dart';

class DropDownPadrao extends StatefulWidget {
  final List<String> list;
  String dropdownValue;

  DropDownPadrao({required this.list, required this.dropdownValue, Key? key})
      : super(key: key);

  @override
  _DropDownPadraoState createState() => _DropDownPadraoState();
}

class _DropDownPadraoState extends State<DropDownPadrao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: Colors.grey),
          color: Colors.grey[100], // Exemplo: cinza claro
        ),
        child: DropdownButton<String>(
          value: widget.dropdownValue,
          onChanged: (String? newValue) {
            setState(() {
              widget.dropdownValue = newValue!;
            });
          },
          items: widget.list.map<DropdownMenuItem<String>>((String value) {
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
    );
  }
}
