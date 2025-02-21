import 'package:flutter/material.dart';

class CarDetailsPage extends StatelessWidget {
  final Map<String, dynamic> car;

  CarDetailsPage({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          car["name"]!,
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.grey[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    car["image"]!,
                    width: 300,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Fiche Technique",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              const SizedBox(height: 10),
              Divider(color: Colors.grey),
              _buildDetailRow(Icons.price_check, "Prix: ${car["price"]}"),
              _buildDetailRow(Icons.car_repair, "Modèle: ${car["name"]}"),
              _buildDetailRow(Icons.calendar_today, "Année: ${car["year"]}"),
              _buildDetailRow(Icons.color_lens, "Couleur: ${car["color"]}"),
              _buildDetailRow(Icons.directions_car, "Kilométrage: ${car["mileage"]}"),
              _buildDetailRow(Icons.settings, "Moteur: ${car["engine"]}"),
              _buildDetailRow(Icons.shuffle, "Transmission: ${car["transmission"]}"),
              const SizedBox(height: 20),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey[900],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Text(
                  car["description"]!,
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  const BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                text,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
