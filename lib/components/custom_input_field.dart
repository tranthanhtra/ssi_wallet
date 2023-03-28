
import 'package:flutter/material.dart';
// import 'package:webtoonz_mobile/utils/constants/color_resources.dart';

/// Customize text field for app
///
///  [labelText] label above of text field
///  [hintText] hint text of text field
///  [controller] TextEditingController of text field for validating user input
///  [suffixIcon] icon at the end of text field
///  [prefixIcon] icon at the start of text field
class CustomInputField extends StatelessWidget {
  const CustomInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    required this.labelText,
  }) : super(key: key);

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 0, 4),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            labelText,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
      ),
      TextFormField(
        controller: controller,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          filled: true,
          hintText: hintText,
          hintMaxLines: 1,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          contentPadding: const EdgeInsets.fromLTRB(17, 13, 17, 13),
          fillColor: Colors.white,
          enabledBorder: _inputBorder(),
          focusedBorder: _inputBorder(),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
      ),
    ]);
  }

  OutlineInputBorder _inputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6),
      ),
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1,
      ),
    );
  }
}