import 'package:bustrackr/core/shared/custom_text_field.dart';
import 'package:bustrackr/core/shared/custombottomnavbutton.dart';
import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavButton(text: "Submit"),
      appBar: AppBar(
        title: const Text(
          "Contact Us",
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email Us",
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy_outlined,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Call Us",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.grey[700]),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.phone,
                    color: Colors.blue,
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
                    onPressed: () {},
                    icon: const Icon(
                      Icons.copy_outlined,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text("Or write us",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 20),
              const CustomTextFormFieldAuth(
                labelText: "Full Name",
                prefixIcon: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),
              const CustomTextFormFieldAuth(
                labelText: "Email",
                prefixIcon: Icon(
                  Icons.email,
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 15),
              const CustomTextFormFieldAuth(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                labelText: "Message",
                prefixIcon: Icon(
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
