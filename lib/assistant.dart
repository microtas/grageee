import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistantPage extends StatelessWidget {
  final List<Map<String, String>> assistants = [
    {
      'name': 'Asma ben Younes',
      'position': 'assistant technique ',
      'phone': '29 470 179',
      'email': 'Asma.assistante@gmail.com',
      'logo': 'assets/technique.png', 
    },
    {
      'name': 'Ahmed ben Abdallah',
      'position': 'service de remorquage',
      'phone': '50 234 789',
      'email': 'ahmed.technicien@gmail.com',
      'logo': 'assets/tech.png', 
    },
  ];

  Future<void> _launchPhone(String phoneNumber) async {
    final Uri phoneUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
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

Future<void> _launchEmail(String email) async {
  final Uri emailUri = Uri(
    scheme: 'mailto',
    path: email,
    query: Uri.encodeQueryComponent('subject=Contact&body=Bonjour'),
  );

  try {
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri, mode: LaunchMode.externalApplication);
    } else {
      print('Impossible d\'ouvrir l\'application de messagerie');
    }
  } catch (e) {
    print('Erreur lors de l\'ouverture de l\'email: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Assistant Technique',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
              fontSize: 25),
        ),
        backgroundColor: Colors.black,
        elevation: 10,
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: assistants.length,
        itemBuilder: (context, index) {
          final assistant = assistants[index];
          return Card(
  color: Colors.white,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
  ),
  elevation: 5,
  margin: const EdgeInsets.only(bottom: 20),
  child: Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        // Replacing CircleAvatar with Image.asset
        Image.asset(
          assistant['logo']!,
          height: 100, 
          width: 100, 
          fit: BoxFit.fill, 
        ),
        const SizedBox(height: 20),
        Text(
          assistant['name']!,
          style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87),
        ),
        const SizedBox(height: 5),
        Text(
          assistant['position']!,
          style: TextStyle(
              fontSize: 18,
              color: Colors.grey[700],
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        Divider(color: Colors.grey[300]),
        const SizedBox(height: 10),
        _buildContactButton(
          icon: Icons.phone,
          label: assistant['phone']!,
          color: Colors.green,
          onTap: () => _launchPhone(assistant['phone']!),
        ),
        const SizedBox(height: 10),
        _buildContactButton(
          icon: Icons.email,
          label: assistant['email']!,
          color: const Color.fromARGB(255, 152, 39, 31),
          onTap: () => _launchEmail(assistant['email']!),
        ),
      ],
    ),
  ),
);

        },
      ),
    );
  }

  Widget _buildContactButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          //color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}