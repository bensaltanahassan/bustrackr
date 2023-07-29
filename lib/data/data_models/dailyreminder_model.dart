class DailyReminderModel {
  String? userId;
  String? busNumber;
  String? stop;
  List<String>? days;
  String? timeBefore;

  DailyReminderModel(
      {this.userId, this.busNumber, this.stop, this.days, this.timeBefore});

  DailyReminderModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    busNumber = json['busNumber'];
    stop = json['stop'];
    days = json['days'].cast<String>();
    timeBefore = json['timeBefore'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['busNumber'] = busNumber;
    data['stop'] = stop;
    data['days'] = days;
    data['timeBefore'] = timeBefore;
    return data;
  }
}
