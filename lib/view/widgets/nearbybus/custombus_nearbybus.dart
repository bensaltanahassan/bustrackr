import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class CustomBusHomePage extends StatelessWidget {
  const CustomBusHomePage({
    super.key,
    this.onTap,
    this.isChoiced = false,
    required this.ligne,
    required this.temp,
  });

  final void Function()? onTap;
  final String ligne;
  final String temp;
  final bool isChoiced;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isChoiced ? Colors.green : null,
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
            "${AppLocalizations.of(context)!.line} $ligne",
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.timer_outlined,
                color: Colors.grey[700],
              ),
              const SizedBox(width: 10),
              Text(
                temp,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey[700]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
