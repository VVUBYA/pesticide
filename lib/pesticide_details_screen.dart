import 'package:flutter/material.dart';
import 'pesticides_model.dart';

class PesticideDetailsScreen extends StatelessWidget {
  final Pesticide pesticide;
  final int index;

  PesticideDetailsScreen({required this.pesticide, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pesticide.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Type: ${pesticide.type}'),
            Text('Category: ${pesticide.category}'),
            Text('Toxicity: ${pesticide.toxicity}'),
            Text('Dosage: ${pesticide.dosage}'),
            Text('Precautions: ${pesticide.precautions}'),
            Text('Dangers: ${pesticide.dangers}'),
            Text('Banned: ${pesticide.isBanned ? "Yes" : "No"}'),
            Text('Alternatives: ${pesticide.alternatives.join(", ")}'),
            SizedBox(height: 16),
            // Display all images for the pesticide
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: pesticide.imageLinks.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                String imageLink = pesticide.imageLinks[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey[200],
                  ),
                  padding: EdgeInsets.all(8),
                  child: Image.asset(imageLink),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
