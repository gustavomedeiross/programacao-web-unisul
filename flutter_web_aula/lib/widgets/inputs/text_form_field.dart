import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final Function(String) validator;
  final bool obscureText;

  CustomTextFormField({
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.obscureText = false
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      obscureText: obscureText,
      decoration: InputDecoration(
//        border: OutlineInputBorder(),
        labelText: label,
        hintText: hint,
      ),
    );
  }
}


