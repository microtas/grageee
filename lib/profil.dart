import 'package:flutter/material.dart';
import 'package:kia_garage/login_screen.dart';

class UserProfilePage extends StatelessWidget {
  final Map<String, String> user = {
    'name': 'Mohamed ben ahmed',
    'email': 'sysm6100@gmail.com',
    'phone': '29 470 179',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
     appBar: AppBar(
  title: Text(
    'Mon Profil',
    style: TextStyle(
      fontSize: 25,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    
  ),
  centerTitle: true,
  backgroundColor: Colors.black,
  elevation: 0,
  
),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Card(
            color: Colors.white, // Fond blanc pour la carte
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // Coins arrondis élégants
            ),
            elevation: 15, // Plus de profondeur pour une interface moderne
            shadowColor: Colors.black.withOpacity(0.2),
            child: Padding(
              padding: const EdgeInsets.all(30), // Padding à l'intérieur de la carte
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image de profil avec bordure et ombre douce
                  Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/gr.png',),
                        fit: BoxFit.contain,
                      ),
                     
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Nom de l'utilisateur avec une taille plus grande et un style moderne
                  Text(
                    user['name']!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 30), // Espacement supplémentaire

                  // Coordonnées avec icônes et plus d'espace vertical
                  Row(
                    children: [
                      Icon(Icons.email, color: Colors.blue[700], size: 24),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          user['email']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54, // Gris plus doux
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black38, thickness: 1), // Divider après email

                  const SizedBox(height: 20), // Plus d'espacement vertical entre les coordonnées

                  Row(
                    children: [
                       Icon(Icons.phone, color: Colors.blue[700], size: 24),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          user['phone']!,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Divider(color: Colors.black38, thickness: 1), // Divider après téléphone

                  const SizedBox(height: 30), // Espacement entre les coordonnées et le bouton

                  // Utilisation de l'Expanded pour ancrer le bouton en bas
                  
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          // Ajoutez ici la logique pour se déconnecter
                            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black, // Couleur d'arrière-plan noire
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                          elevation: 8, // Ombre plus marquée pour un effet moderne
                        ),
                        child: const Text(
                          'Se déconnecter',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
