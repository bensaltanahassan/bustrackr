import 'package:bustrackr/core/functions/copytocliboard.dart';
import 'package:bustrackr/core/shared/custom_text_field.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavButton(text: "Submit"),
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.contactUs,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.sendUsAnEmail,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey[700]),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: Colors.blue,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Bensaltana10@gmail.com",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      copyToClipboard("Bensaltana10@gmail.com");
                    },
                    icon: const Icon(
                      Icons.copy_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                AppLocalizations.of(context)!.callUs,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey[700]),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.green,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "+216 22 22 22 22",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      copyToClipboard("+216 22 22 22 22");
                    },
                    icon: const Icon(
                      Icons.copy_outlined,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(AppLocalizations.of(context)!.orWriteUs,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              CustomTextFormFieldAuth(
                labelText: AppLocalizations.of(context)!.completName,
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormFieldAuth(
                labelText: AppLocalizations.of(context)!.email,
                prefixIcon: const Icon(
                  Icons.email,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),
              CustomTextFormFieldAuth(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                labelText: AppLocalizations.of(context)!.message,
                prefixIcon: const Icon(
                  Icons.message,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
