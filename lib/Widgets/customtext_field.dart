import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType:
          hintText == 'price' ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'field is required';
        } else {
          return null;
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
