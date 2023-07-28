import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextFormFieldAuth extends StatelessWidget {
  const CustomTextFormFieldAuth(
      {super.key,
      this.controller,
      required this.labelText,
      this.validator,
      this.isPassword = false,
      this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.onSubmitted,
      this.readOnly = false,
      this.initialValue,
      this.maxLines = 1,
      this.onChanged});

  final TextEditingController? controller;
  final String labelText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool? readOnly;
  final String? initialValue;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      onChanged: onChanged,
      maxLines: maxLines,
      onFieldSubmitted: onSubmitted,
      keyboardType: keyboardType,
      readOnly: readOnly!,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: GoogleFonts.roboto(),
        border: const OutlineInputBorder(),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
      ),
    );
  }
}
