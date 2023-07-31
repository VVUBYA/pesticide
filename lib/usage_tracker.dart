import 'package:flutter/material.dart';

class PesticideUsage {
  final String pesticideType;
  final double quantity;
  final DateTime date;

  PesticideUsage({
    required this.pesticideType,
    required this.quantity,
    required this.date,
  });
}

class PesticideTrackerScreen extends StatefulWidget {
  const PesticideTrackerScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PesticideTrackerScreenState createState() => _PesticideTrackerScreenState();
}

class _PesticideTrackerScreenState extends State<PesticideTrackerScreen> {
  List<PesticideUsage> pesticideUsageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesticide Tracker'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: pesticideUsageList.length,
        itemBuilder: (context, index) {
          final entry = pesticideUsageList[index];
          return ListTile(
            leading: const Icon(Icons.pest_control),
            title: Text(entry.pesticideType),
            subtitle: Text('Quantity: ${entry.quantity}'),
            trailing: Text('Date: ${entry.date.toString()}'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _showAddUsageDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddUsageDialog(BuildContext context) {
    String pesticideType = '';
    double quantity = 0;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Pesticide Usage'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  pesticideType = value;
                },
                decoration: const InputDecoration(labelText: 'Pesticide Type'),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  quantity = double.tryParse(value) ?? 0;
                },
                decoration: const InputDecoration(labelText: 'Quantity in mls'),
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Validate input and add the usage entry to the list
                if (pesticideType.isNotEmpty && quantity > 0) {
                  setState(() {
                    pesticideUsageList.add(PesticideUsage(
                      pesticideType: pesticideType,
                      quantity: quantity,
                      date: DateTime.now(),
                    ));
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
