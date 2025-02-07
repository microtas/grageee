import 'package:flutter/material.dart';
import 'package:kia_garage/rendez-vous.dart';
import 'package:kia_garage/suivi.dart';

class TarifsServicesPage extends StatelessWidget {
  final List<Map<String, String>> services = [
    {"service": "Révision complète", "price": "250 DT"},
    {"service": "Changement d'huile", "price": "80 DT"},
    {"service": "Diagnostic électronique", "price": "100 DT"},
    {"service": "Freinage (Plaquettes + Disques)", "price": "350 DT"},
    {"service": "Changement de batterie", "price": "200 DT"},
    {"service": "Recharge climatisation", "price": "150 DT"},
    {"service": "Parallélisme et équilibrage", "price": "120 DT"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tarifs des Services",
          style: TextStyle(
            fontSize: 25,
            letterSpacing: 1.2,
            fontWeight: FontWeight.bold,
            
          ),
          textAlign: TextAlign.justify,

        ),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Nos Services",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 6,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        services[index]["service"]!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                      subtitle: Text(
                        "Tarif: ${services[index]["price"]}",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[600],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                 
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RendezVousPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green[500],
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Prendre un Rendez-vous",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  
                  
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RepairProgressPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[500], 
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      textStyle: const TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      elevation: 5,
                    ),
                    child: const Text(
                      "Suivre l'avancement des réparations",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                
                
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}
