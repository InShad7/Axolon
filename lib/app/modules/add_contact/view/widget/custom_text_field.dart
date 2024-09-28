import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.title,
    required this.controller,
    this.validator,
    required this.icon,
    this.keyBoardType = TextInputType.text, this.maxLength=30,
  });

  final String title;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType keyBoardType;
  final int maxLength;
  final validator;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.06,
        vertical: width * 0.04,
      ),
      child: TextFormField(
        maxLength: maxLength,
        keyboardType: keyBoardType,
        controller: controller,
        decoration: InputDecoration(
          counterText: '',
          prefixIcon: Icon(icon),
          hintText: title,
          border: const UnderlineInputBorder(),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
