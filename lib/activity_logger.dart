class Activity {
  final String title;
  final DateTime timestamp;

  Activity({required this.title, required this.timestamp});
}

class ActivityLogger {
  static List<Activity> _activities = [];

  static void logActivity(String title) {
    final activity = Activity(title: title, timestamp: DateTime.now());
    _activities.add(activity);
  }

  static List<Activity> getActivities() {
    return List.from(_activities);
  }

  static void clearActivities() {
    _activities.clear();
  }
}
