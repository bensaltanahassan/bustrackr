import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomBusHomePage extends StatelessWidget {
  const CustomBusHomePage({
    super.key,
    this.onTap,
    required this.ligne,
    required this.temp,
  });

  final void Function()? onTap;
  final String ligne;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 100,
        width: 200,
        child: ListTile(
          onTap: onTap,
          leading: const Icon(
            Icons.location_on,
            color: Colors.red,
          ),
          title: Text(
            "Ligne $ligne",
            style: GoogleFonts.roboto(),
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_outlined,
                color: Colors.grey[600],
              ),
              const SizedBox(width: 10),
              Text(
                "$temp min",
                style: GoogleFonts.roboto(
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
