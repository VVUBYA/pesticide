import 'package:flutter/material.dart';
import 'activity_logger.dart';

class RecentActivitiesScreen extends StatelessWidget {
  const RecentActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = ActivityLogger.getActivities();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Activities'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              ActivityLogger.clearActivities();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: activities.isNotEmpty
          ? ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                final activity = activities[index];
                return _buildActivityTile(activity);
              },
            )
          : const Center(
              child: Text('No recent activities.'),
            ),
    );
  }

  Widget _buildActivityTile(Activity activity) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.history),
        title: Text(activity.title),
        subtitle: Text(activity.timestamp.toString()),
      ),
    );
  }
}
