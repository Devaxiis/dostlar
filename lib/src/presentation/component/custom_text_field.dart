import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelName;
  final TextInputType keybordType;
  final TextEditingController controller;
  const CustomTextField({super.key, required this.labelName, required this.keybordType, required this.controller});

  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.sizeOf(context).width;
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 5),
      width: maxWidth,
      child: TextField(
        keyboardType: keybordType,
        controller: controller,
        decoration: InputDecoration(
            labelText: labelName,
            labelStyle: const TextStyle(
              color: Color(0xff818181)
            ),
            focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                  color: Color(0xff14181e),
                  width: 2,
                )
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                borderSide: BorderSide(
                    color: Color(0xff818181),
                    width: 1
                )
            )
        ),
      ),
    );
  }
}
