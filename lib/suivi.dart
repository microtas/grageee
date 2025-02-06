import 'package:flutter/material.dart';

class RepairProgressPage extends StatefulWidget {
  @override
  _RepairProgressPageState createState() => _RepairProgressPageState();
}

class _RepairProgressPageState extends State<RepairProgressPage> {
  final TextEditingController _matriculeController = TextEditingController();
  bool showProgress = false;

  final List<Map<String, dynamic>> repairSteps = [
    {
      "title": "Réception du véhicule",
      "icon": Icons.directions_car_filled,
      "image": 'assets/reception.png',  
    },
    {
      "title": "Diagnostic en cours",
      "icon": Icons.analytics,
    },
    {
      "title": "Pièces en commande",
      "icon": Icons.shopping_cart,
    },
    {
      "title": "Réparation en cours",
      "icon": Icons.build,
    },
    {
      "title": "Contrôle qualité",
      "icon": Icons.verified,
    },
    {
      "title": "Véhicule prêt à récupérer",
      "icon": Icons.car_rental,

    },
  ];

  int currentStep = 0;

  void _checkMatricule() {
    if (_matriculeController.text.isNotEmpty) {
      setState(() {
        showProgress = true;
        currentStep = 4; // Simule l'avancement
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Suivi de Réparation"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Champ de saisie de la matricule
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2)),
                ],
              ),
              child: TextField(
                controller: _matriculeController,
                decoration: InputDecoration(
                  labelText: "Entrez votre Matricule",
                  border: InputBorder.none,
                  prefixIcon: const Icon(Icons.directions_car, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Bouton pour afficher l'avancement
            Center(
              child: ElevatedButton(
                onPressed: _checkMatricule,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 5,
                ),
                child: const Text(
                  "Voir l'avancement",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 24),
// Barre de progression circulaire
            if (showProgress)
              Center(
                child: Column(
                  children: [
                    TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0, end: (currentStep + 1) / repairSteps.length),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, _) => SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: value,
                          strokeWidth: 8,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${((currentStep + 1) / repairSteps.length * 100).round()}% terminé",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 24),
            // Affichage des étapes sous forme de ligne verticale animée
            if (showProgress)
              Expanded(
                child: SingleChildScrollView(
                  child: Card(
                    elevation: 6,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Text(
                            "Avancement de la Réparation",
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 16),

                          // Étapes avec icônes, ligne animée et fade-in
                          Column(
                            children: List.generate(repairSteps.length, (index) {
                              return AnimatedOpacity(
                                opacity: index <= currentStep ? 1.0 : 0.3,
                                duration: Duration(milliseconds: 300 + (index * 200)),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Icône et ligne verticale animée
                                    Column(
                                      children: [
                                        AnimatedContainer(
                                          duration: const Duration(milliseconds: 500),
                                          curve: Curves.easeInOut,
                                          child: CircleAvatar(
                                            radius: 16,
                                            backgroundColor: index <= currentStep ? Colors.green : Colors.grey,
                                            child: Icon(
                                              repairSteps[index]["icon"],
                                              color: Colors.white,
                                              size: 18,
                                            ),
                                          ),
                                        ),
                                        if (index < repairSteps.length - 1)
                                          AnimatedContainer(
                                            duration: const Duration(milliseconds: 500),
                                            curve: Curves.easeInOut,
                                            width: 4,
                                            height: 50,
                                            color: index < currentStep ? Colors.green : Colors.grey[400],
                                          ),
                                      ],
                                    ),
                                    const SizedBox(width: 16),

                                    // Texte de l'étape et image
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 4),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              repairSteps[index]["title"],
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: index <= currentStep ? Colors.black : Colors.grey,
                                              ),
                                            ),
                                            if (index <= currentStep)
                                              const SizedBox(height: 8),
                                              // Vérification si l'image existe
                                              if (repairSteps[index]["image"] != null)
                                                Image.asset(
                                                  repairSteps[index]["image"] ?? 'assets/images/default.jpg',
                                                  width: 100,
                                                  height: 100,
                                                  fit: BoxFit.cover,
                                                ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
