import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldPadrao extends StatelessWidget {
  final controller;
  final String text;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatter;
  final int? maxLength;

  const TextFieldPadrao({
    Key? key,
    this.controller,
    required this.text,
    required this.obscureText,
    this.keyboardType,
    this.inputFormatter,
    this.maxLength,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        inputFormatters: inputFormatter,
        maxLength: maxLength,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: text,
          hintStyle: TextStyle(color: Colors.grey[500]),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
        ),
      ),
    );
  }
}
