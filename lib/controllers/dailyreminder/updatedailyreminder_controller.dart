import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:get/get.dart';

class UpdateDailyReminderController extends GetxController {
  showPicker(BuildContext context) {
    Picker(
        adapter: NumberPickerAdapter(
          data: [
            const NumberPickerColumn(
              begin: 1,
              end: 60,
              suffix: Text(" min"),
            ),
          ],
        ),
        hideHeader: true,
        looping: true,
        selecteds: [
          10, // initial value
        ],
        title: const Text("Please Select"),
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.getSelectedValues());
        }).showDialog(context);
  }
}
