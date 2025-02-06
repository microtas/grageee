import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistantPage extends StatelessWidget {
  final Map<String, String> assistant = {
    'name': 'Jean Dupont',
    'position': 'Technicien Principal',
    'phone': '29470179',
    'email': 'jean.dupont@example.com',
  };

  // Méthode pour lancer l'appel
  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: assistant['phone'],
    );

    try {
      if (await canLaunchUrl(phoneUri)) {
        await launchUrl(phoneUri);
      } else {
        print('Impossible de lancer le numéro');
      }
    } catch (e) {
      print('Erreur lors de l\'appel: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assistant Technique'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Image de l'assistant
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/homme.png'),
                ),
                const SizedBox(height: 20),

                // Nom et position de l'assistant
                Text(
                  assistant['name']!,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(
                  assistant['position']!,
                  style: const TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 20),

                // Informations de contact
                Text(
                  'Téléphone: ${assistant['phone']}',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Email: ${assistant['email']}',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),

                // Bouton pour appeler
                ElevatedButton(
                  onPressed: _launchPhone,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Couleur du bouton
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  ),
                  child: Text(
                    'Appeler ${assistant['name']}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
