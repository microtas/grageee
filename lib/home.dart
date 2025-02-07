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
  final List<Map<String, String>> cars = [
    {"name": "KIA PICANTO POPULAIRE", "price": "33 660 DT", "image": "assets/kia_picanto_populaire.png"},
    {"name": "KIA PICANTO", "price": "52 980 DT", "image": "assets/kia_picanto.png"},
    {"name": "KIA STONIC", "price": "72 980 DT", "image": "assets/kia_stonic.png"},
    {"name": "KIA SONET", "price": "88 480 DT", "image": "assets/kia_sonet.png"},
    {"name": "KIA SELTOS", "price": "119 980 DT", "image": "assets/kia_seltos.png"},
    {"name": "KIA NIRO HYBRIDE", "price": "139 980 DT", "image": "assets/kia_niro_hybride.png"},
    {"name": "KIA SPORTAGE", "price": "140 980 DT", "image": "assets/kia_sportage.png"},
    {"name": "KIA SPORTAGE HYBRIDE", "price": "174 980 DT", "image": "assets/kia_sportage_hybride.png"},
    {"name": "KIA EV6", "price": "199 980 DT", "image": "assets/kia_ev6.png"},
    {"name": "KIA EV6 GT", "price": "262 980 DT", "image": "assets/kia_ev6_gt.png"},
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
                                color: Colors.green[700],
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
