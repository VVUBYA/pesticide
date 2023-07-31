class Pesticide {
  final String name;
  final String type;
  final String category;
  final String toxicity;
  final String dosage;
  final String precautions;
  final String dangers;
  final bool isBanned;
  final List<String> alternatives;
  final List<String> imageLinks;

  Pesticide({
    required this.name,
    required this.type,
    required this.category,
    required this.toxicity,
    required this.dosage,
    required this.precautions,
    required this.dangers,
    required this.isBanned,
    required this.alternatives,
    required this.imageLinks,
  });
}

List<Pesticide> pesticideList = [
  Pesticide(
    name: 'Pesticide 1',
    type: 'Insecticide',
    category: 'Broad-spectrum',
    toxicity: 'Moderate',
    dosage: '100ml/acre',
    precautions: 'Use protective gear',
    dangers: 'Harmful if swallowed',
    isBanned: false,
    alternatives: ['Alternative 1', 'Alternative 2'],
    imageLinks: ['pesticide_1_image_1.jpg', 'pesticide_1_image_2.jpg'],
  ),
];
