import 'package:flutter/material.dart';

class Pesticide {
  final String name;
  final String category;
  final String description;

  Pesticide({
    required this.name,
    required this.category,
    required this.description,
  });
}

class PesticideIdentificationScreen extends StatefulWidget {
  const PesticideIdentificationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PesticideIdentificationScreenState createState() =>
      _PesticideIdentificationScreenState();
}

class _PesticideIdentificationScreenState
    extends State<PesticideIdentificationScreen> {
  List<Pesticide> pesticides = [
    Pesticide(
      name: 'Pesticide A',
      category: 'Insecticide',
      description: 'Effective against various insects.',
    ),
    Pesticide(
      name: 'Pesticide B',
      category: 'Herbicide',
      description: 'Used for weed control in crops.',
    ),
    Pesticide(
      name: 'Pesticide C',
      category: 'Fungicide',
      description: 'Prevents and controls fungal diseases.',
    ),
    // Add more pesticides as needed...
  ];

  List<Pesticide> filteredPesticides = [];

  void _filterPesticides(String query) {
    setState(() {
      filteredPesticides = pesticides
          .where((pesticide) =>
              pesticide.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pesticide Identification'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: _filterPesticides,
              decoration: const InputDecoration(
                labelText: 'Search Pesticides',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredPesticides.length,
              itemBuilder: (context, index) {
                final pesticide = filteredPesticides[index];
                return ListTile(
                  leading: const Icon(Icons.pest_control),
                  title: Text(pesticide.name),
                  subtitle: Text(pesticide.category),
                  onTap: () {
                    _showPesticideDetails(context, pesticide);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showPesticideDetails(BuildContext context, Pesticide pesticide) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(pesticide.name),
          content: Text(pesticide.description),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
