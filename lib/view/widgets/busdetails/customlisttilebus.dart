import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomListTileBus extends StatelessWidget {
  const CustomListTileBus({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.temp,
  });

  final void Function()? onTap;
  final String title;
  final String subtitle;
  final String temp;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: const Icon(
        Icons.bus_alert_outlined,
        color: Colors.yellow,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.roboto(
          color: Colors.grey[800],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$temp min",
            style: GoogleFonts.roboto(
              color: Colors.grey[600],
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 5),
          Icon(
            Icons.navigate_next_outlined,
            size: 30,
            color: Colors.grey[600],
          ),
        ],
      ),
    );
  }
}
