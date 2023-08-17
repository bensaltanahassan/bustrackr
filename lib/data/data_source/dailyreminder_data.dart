import 'package:bustrackr/data/data_models/dailyreminder_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DailyReminderData {
  final dailyReminders = FirebaseFirestore.instance.collection("reminders");

  Future<void> addDailyReminder(
      DailyReminderModelFireBase dailyReminder) async {
    try {
      await dailyReminders.add(dailyReminder.toJson()).then((value) async {
        value.update({
          "reminderId": value.id,
        });
      });
    } catch (_) {}
  }

  Future<List<DailyReminderModelFireBase>> getDailyRemindersByUserId(
      String userId) async {
    var resp = await dailyReminders.where("userId", isEqualTo: userId).get();
    if (resp.docs.isNotEmpty) {
      return resp.docs
          .map((e) => DailyReminderModelFireBase.fromJson(e.data()))
          .toList();
    } else {
      return [];
    }
  }

  // update Daily Reminder
  updateDailyReminder(
      {required String reminderId,
      required DailyReminderModelFireBase dailyReminder}) async {
    var resp =
        await dailyReminders.where("reminderId", isEqualTo: reminderId).get();
    if (resp.docs.isNotEmpty) {
      String docId = resp.docs.first.id;
      await dailyReminders.doc(docId).update(dailyReminder.toJson());
    }
  }

  deleteDailyReminder({required String reminderId}) async {
    var resp =
        await dailyReminders.where("reminderId", isEqualTo: reminderId).get();
    if (resp.docs.isNotEmpty) {
      String docId = resp.docs.first.id;
      await dailyReminders.doc(docId).delete();
    }
  }
}
