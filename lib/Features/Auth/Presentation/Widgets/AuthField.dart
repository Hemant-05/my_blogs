import 'package:flutter/material.dart';

class AuthField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final bool isObscureText;
  const AuthField({super.key, required this.hint,required this.controller, this.isObscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hint,
      ),
      obscureText: isObscureText,
      validator: (value) {
        if(value!.isEmpty){
          return '$hint is missing';
        }
        return null;
      },
    );
  }
}
