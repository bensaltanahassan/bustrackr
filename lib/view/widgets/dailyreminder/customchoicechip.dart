import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomChoiceChipe extends StatelessWidget {
  const CustomChoiceChipe(
      {super.key,
      required this.onTap,
      this.isSelected = false,
      required this.label});

  final void Function(String?) onTap;
  final String label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap(label);
      },
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.roboto(
              color: isSelected ? Colors.white : Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: isSelected ? Colors.green : null,
        side: BorderSide(
            color: isSelected ? Colors.green : Colors.grey, width: .7),
        shadowColor: isSelected
            ? Colors.green
            : Colors.grey.withOpacity(0.5), //color of shadow
      ),
    );
  }
}
