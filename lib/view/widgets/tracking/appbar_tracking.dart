import 'package:flutter/material.dart';

class AppBarTracking extends StatelessWidget {
  const AppBarTracking({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ligne 18",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                Text(
                  "Faculté polydisciplinaire-Elkorse",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.grey[700],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ],
            ),
            actions: [
              const Icon(
                Icons.timer_outlined,
                color: Colors.blue,
              ),
              const SizedBox(width: 8),
              Text(
                "2 min",
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.blue,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
