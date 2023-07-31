import 'package:flutter/material.dart';

class SafetyTipsScreen extends StatelessWidget {
  final List<String> safetyTips = [
    "Always wear protective gear when handling pesticides.",
    "Keep pesticides out of reach of children and pets.",
    "Read and follow the instructions on the pesticide label.",
    "Dispose of empty pesticide containers properly.",
    "Store pesticides in a cool, dry place.",
    "Avoid applying pesticides in windy conditions.",
  ];

  final List<String> safetyTipImages = [
    "assets/images/protective_equipment1.jpg",
    "assets/images/from_children.png",
    "assets/images/label.png",
    "assets/images/dispose.jpg",
    "assets/images/cool_dry.jpg",
    "assets/images/windy.jpg",
  ];

  SafetyTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Safety Tips'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: safetyTips.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.lightbulb_outline), // Light bulb icon
              title: Text(safetyTips[index]), // Display the safety tip as title
              onTap: () {
                // Show the pop-up screen with more information when tapped
                _showTipDetails(context, index);
              },
            ),
          );
        },
      ),
    );
  }

  // Function to show the pop-up screen with more information about the tip
  void _showTipDetails(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tip Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(safetyTips[index]), // Display the tip in the pop-up
              SizedBox(height: 30),
              Image.asset(
                safetyTipImages[index], // Display image for the safety tip
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the pop-up
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
