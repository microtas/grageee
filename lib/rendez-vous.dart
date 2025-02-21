import 'package:flutter/material.dart';
import 'package:kia_garage/home.dart';
import 'package:kia_garage/login_screen.dart';

class RendezVousPage extends StatefulWidget {
  @override
  _RendezVousPageState createState() => _RendezVousPageState();
}

class _RendezVousPageState extends State<RendezVousPage> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _matriculeController = TextEditingController();
  final TextEditingController _additionalCarModelController = TextEditingController();
  final TextEditingController _secondCarModelController = TextEditingController();
  final TextEditingController _secendCarMatriculController = TextEditingController();



  String? selectedCarModel;
  String? selectedtext;

  final List<String> carModels = [
    "KIA PICANTO",
    "KIA STONIC",
    "KIA SONET",
    "KIA SELTOS",
    "KIA NIRO HYBRIDE",
    "KIA SPORTAGE",
    "KIA SPORTAGE HYBRIDE",
    "KIA EV6",
    "KIA EV6 GT",
  ];

  String? customCarModel;

  void _pickDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  void _pickTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      setState(() {
        selectedTime = time;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Prendre un Rendez-vous",style: TextStyle(fontWeight: FontWeight.bold,letterSpacing: 1.2),),
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 22),
        //iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              "Informations Client",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
                shadows: [
                  Shadow(
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Name Field
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: "Nom et Prénom",
                labelStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                prefixIcon: const Icon(Icons.person, color: Colors.black),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
            ),
            const SizedBox(height: 20),

            // Car Model Dropdown with "Other" option
            DropdownButtonFormField<String>(
              value: selectedCarModel,
              hint: const Text("Sélectionnez un modèle de voiture"),
              decoration: InputDecoration(
                labelStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                prefixIcon: const Icon(Icons.directions_car, color: Colors.black),
              ),
              items: [
                ...carModels.map((String model) {
                  return DropdownMenuItem<String>(
                    value: model,
                    child: Text(model),
                  );
                }).toList(),
                const DropdownMenuItem<String>(
                  value: 'Autre',
                  child: Text('Autre modèle'),
                ),
              ],
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue == 'Autre') {
                    customCarModel = '';
                    selectedCarModel = null;  // Set it to null for custom input
                  } else {
                    customCarModel = null; // Clear custom model if one is selected
                    selectedCarModel = newValue;
                  }
                });
              },
            ),
            if (selectedCarModel == null && customCarModel != null) // Show text input for custom car model
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: TextField(
                  controller: _additionalCarModelController,
                  decoration: InputDecoration(
                    labelText: "Modèle de la voiture (ajoutez un modèle)",
                    labelStyle: const TextStyle(color: Colors.black54),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.black54),
                    ),
                    prefixIcon: const Icon(Icons.car_repair, color: Colors.black),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  ),
                  onChanged: (value) {
                    customCarModel = value;
                  },
                ),
              ),
            const SizedBox(height: 12),

            // Matricule Field for car
            TextField(
              controller: _matriculeController,
              decoration: InputDecoration(
                labelText: "Matricule de la voiture",
                labelStyle: const TextStyle(color: Colors.black54),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.black54),
                ),
                prefixIcon: const Icon(Icons.local_parking, color: Colors.black),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              ),
            ),
            const SizedBox(height: 20),
// Add additional car model
            ElevatedButton.icon(
              onPressed: () {
                setState(() {
                  selectedtext = selectedtext == null ? "Ajouter une 2ème voiture" : null;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 122, 31),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 3,
              ),
              icon: const Icon(Icons.add, size: 20),
              label: Text(selectedtext ?? "Ajouter une 2ème voiture"),
            ),
            if (selectedtext != null)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    TextField(
                      controller: _secondCarModelController,
                      decoration: InputDecoration(
                        labelText: "Modèle de la 2ème voiture",
                        labelStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black54),
                        ),
                        prefixIcon: const Icon(Icons.car_repair, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextField(
                      controller: _secendCarMatriculController,
                      decoration: InputDecoration(
                        labelText: "Matricule de la voiture",
                        labelStyle: const TextStyle(color: Colors.black54),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.black54),
                        ),
                        prefixIcon: const Icon(Icons.local_parking, color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            // Date Selection Button
            ElevatedButton.icon(
              onPressed: () => _pickDate(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 3,
              ),
              icon: const Icon(Icons.calendar_today, size: 20),
              label: Text(selectedDate == null
                  ? "Choisir une date"
                  : "Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"),
            ),
            const SizedBox(height: 10),

            // Time Selection Button
            ElevatedButton.icon(
              onPressed: () => _pickTime(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                elevation: 3,
              ),
              icon: const Icon(Icons.access_time, size: 20),
              label: Text(selectedTime == null
                  ? "Choisir une heure"
                  : "Heure: ${selectedTime!.format(context)}"),
            ),
            const SizedBox(height: 10),

            // Confirm Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (selectedDate != null && selectedTime != null && _nameController.text.isNotEmpty && (selectedCarModel != null || customCarModel != null)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Rendez-vous confirmé!")),
                    );
                                 Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) =>HomePage()),
            );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Veuillez remplir tous les champs et sélectionner une date et une heure")),
                    );
                  }
                },
               
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 32),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 4,
                ),
                child: const Text("Confirmer le rendez-vous"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
