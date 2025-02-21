import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kia_garage/assistant.dart';
import 'package:kia_garage/fiche_technique.dart';
import 'package:kia_garage/profil.dart';
import 'package:kia_garage/tarif.dart';



class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePageContent(),
    TarifsServicesPage(),
    AssistantPage(),
    UserProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.black,
        height: 60,
        index: _selectedIndex,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
Icon(Icons.menu,size: 30,),
          Icon(Icons.support_agent_outlined, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  final List<Map<String, dynamic>> cars = [
  {
    "name": "KIA PICANTO POPULAIRE",
    "price": "33 660 DT",
    "image": "assets/kia_picanto_populaire.png",
    "year": "2022",
    "color": "Blanc",
    "mileage": "15 000 km",
    "engine": "1.2 L I4",
    "transmission": "Manuelle",
    "description": "Le KIA Picanto Populaire est une petite voiture citadine...",
  },
  {
    "name": "KIA PICANTO",
    "price": "52 980 DT",
    "image": "assets/kia_picanto.png",
    "year": "2023",
    "color": "Gris",
    "mileage": "12 000 km",
    "engine": "1.2 L I4",
    "transmission": "Automatique",
    "description": "Le KIA Picanto offre un confort optimal et une faible consommation.",
  },
  {
    "name": "KIA STONIC",
    "price": "72 980 DT",
    "image": "assets/kia_stonic.png",
    "year": "2023",
    "color": "Gris",
    "mileage": "8 000 km",
    "engine": "1.4 L I4",
    "transmission": "Automatique",
    "description": "Le KIA Stonic est un SUV compact offrant un design audacieux.",
  },
  {
    "name": "KIA SONET",
    "price": "88 480 DT",
    "image": "assets/kia_sonet.png",
    "year": "2023",
    "color": "Noir",
    "mileage": "10 000 km",
    "engine": "1.5 L I4",
    "transmission": "Automatique",
    "description": "Le KIA Sonet est un SUV dynamique avec une technologie moderne.",
  },
  {
    "name": "KIA SELTOS",
    "price": "119 980 DT",
    "image": "assets/kia_seltos.png",
    "year": "2022",
    "color": "Bleu",
    "mileage": "20 000 km",
    "engine": "1.6 L I4",
    "transmission": "Manuelle",
    "description": "Le KIA Seltos combine confort et performance dans un SUV spacieux.",
  },
  {
    "name": "KIA NIRO HYBRIDE",
    "price": "139 980 DT",
    "image": "assets/kia_niro_hybride.png",
    "year": "2023",
    "color": "Bleu",
    "mileage": "5 000 km",
    "engine": "1.6 L Hybride",
    "transmission": "Automatique",
    "description": "Le KIA Niro Hybride est une voiture économique et respectueuse de l'environnement.",
  },
  {
    "name": "KIA SPORTAGE",
    "price": "140 980 DT",
    "image": "assets/kia_sportage.png",
    "year": "2022",
    "color": "Bleu",
    "mileage": "25 000 km",
    "engine": "2.0 L I4",
    "transmission": "Automatique",
    "description": "Le KIA Sportage est un SUV de taille moyenne avec des fonctionnalités de pointe.",
  },
  {
    "name": "KIA EV6",
    "price": "199 980 DT",
    "image": "assets/kia_ev6.png",
    "year": "2023",
    "color": "Bleu",
    "mileage": "0 km",
    "engine": "Électrique",
    "transmission": "Automatique",
    "description": "Le KIA EV6 est une voiture électrique offrant une autonomie impressionnante.",
  },
  {
    "name": "KIA EV6 GT",
    "price": "262 980 DT",
    "image": "assets/kia_ev6_gt.png",
    "year": "2023",
    "color": "Gris",
    "mileage": "0 km",
    "engine": "Électrique",
    "transmission": "Automatique",
    "description": "Le KIA EV6 GT est une version hautes performances de l'EV6, conçue pour les conducteurs exigeants.",
  },

];


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/kia2.gif'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: cars.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CarDetailsPage(car: cars[index]),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          cars[index]["image"]!,
                          width: 120,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cars[index]["name"]!,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[900],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              cars[index]["price"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.blueGrey,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
