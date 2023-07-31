// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyContact {
  final String category;
  final String name;
  final String phoneNumber;
  final String email;
  final String address;

  EmergencyContact({
    required this.category,
    required this.name,
    required this.phoneNumber,
    required this.email,
    required this.address,
  });
}

// ignore: use_key_in_widget_constructors
class EmergencyContactsScreen extends StatelessWidget {
  final List<EmergencyContact> emergencyContacts = [
    EmergencyContact(
      category: 'Medical Personnel',
      name: 'Dr. Vvubya Drake',
      phoneNumber: '+256704567890',
      email: 'vvubyadrake7@gmail.com',
      address: '4th Street, Bugolobi',
    ),
    EmergencyContact(
      category: 'Medical Personnel',
      name: 'Dr. Sarah Johnson',
      phoneNumber: '+256768654321',
      email: 'sarah.johnson@gmail.com',
      address: 'Health Avenue, Kampala City',
    ),
    EmergencyContact(
      category: 'Agricultural Expert',
      name: 'Senyonjo Henry',
      phoneNumber: '+256764924283',
      email: 'senyonjohenry1@gmail.com',
      address: 'Container Village, Kampala',
    ),
    EmergencyContact(
      category: 'Pesticide Wholesale Retailer',
      name: 'Material Pesticides',
      phoneNumber: '+256707749629',
      email: 'info@materialpesticides.com',
      address: '567 Pesticide Lane, City',
    ),
    EmergencyContact(
      category: 'Ambulance',
      name: 'Emergency Ambulance Services',
      phoneNumber: '0200198392',
      email: 'emergency@ambulance.com',
      address: 'Lumumba Avenue, Buganda Road',
    ),
    // Add more emergency contacts as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Contacts'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: emergencyContacts.length,
        itemBuilder: (context, index) {
          final contact = emergencyContacts[index];
          return _buildEmergencyContactTile(context, contact);
        },
      ),
    );
  }

  Widget _buildEmergencyContactTile(
      BuildContext context, EmergencyContact contact) {
    return ExpansionTile(
      title: Text(contact.category),
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: Text(contact.name),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Phone: ${contact.phoneNumber}'),
              Text('Email: ${contact.email}'),
              Text('Address: ${contact.address}'),
            ],
          ),
          onTap: () => _onContactTapped(context, contact),
        ),
      ],
    );
  }

  void _onContactTapped(BuildContext context, EmergencyContact contact) async {
    final url = 'tel:${contact.phoneNumber}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: const Text('Failed to initiate the phone call.'),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}
