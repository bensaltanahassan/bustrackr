import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text));
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      content: Text(AppLocalizations.of(Get.context!)!.copiedToClipboard),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue.withOpacity(.6),
    ),
  );
}
