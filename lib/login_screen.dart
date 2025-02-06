import 'package:flutter/material.dart';
import 'package:kia_garage/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

final _formKey = GlobalKey<FormState>();

class _LoginScreenState extends State<LoginScreen> {
  // Contrôleur pour l'email et le mot de passe
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false; // Gérer la visibilité du mot de passe
  String _errorMessage = '';
  bool _isLoading = false;


@override
void dispose() {
  _emailController.dispose();
  _passwordController.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    "Bienvenue!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 230), // Positionner sous le conteneur
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        height: 300,
                      ),
                      const SizedBox(height: 40),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            _buildTextFormField(
                              label: 'Email',
                              hint: 'ex: test@gmail.com',
                              controller: _emailController,
                              validator: _validateEmail,
                            ),
                            const SizedBox(height: 20),
                            _buildTextFormField(
                              label: 'Mot de Passe',
                              controller: _passwordController,
                              obscureText: !_isPasswordVisible,
                              validator: _validatePassword,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 55,
                              width: double.infinity,
                              child: ElevatedButton(
                                //onPressed: _submit,
                                onPressed: () => HomePage(),
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  backgroundColor: Colors.lightBlue,
                                ),
                                child:_isLoading
                    ? Center(
                      child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                ),
                    )
                            : const Text(
                                        'Soumettre',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 18),
                                      ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Méthode pour construire un TextFormField
  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    bool obscureText = false,
    required String? Function(String?) validator,
    Widget? suffixIcon,
    String? hint,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle:
              const TextStyle(color: Color.fromARGB(178, 171, 186, 193)),
          hintText: hint,
          filled: true,
          fillColor: const Color.fromARGB(239, 240, 249, 252),
          enabledBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 238, 238, 238)),
            borderRadius: BorderRadius.circular(25),
          ),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }

  // Validation de l'email
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'L\'email est obligatoire';
    }
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Veuillez entrer un email valide';
    }
    return null;
  }

  // Validation du mot de passe
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est obligatoire';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }

  // Soumission du formulaire
  /*void _submit() async {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _errorMessage = '';
        _isLoading = true; // Active le chargement
      });

      try {
        // Appeler la méthode post pour vérifier les informations de connexion
        final user = await THttpHelper.post<User>(
          'GetUser', // Endpoint de l'API
          {
            'Login': _emailController.text,
            'Pass': _passwordController.text,
          },
          (responseBody) {
            // Analyser la réponse XML et retourner une liste de Citoyen
            return parseUser(responseBody);
          },
        );

if (user.isNotEmpty) {
  final loggedInUser = user.first;
  CurrentUser.setLoggedInUser(loggedInUser);

  if (loggedInUser.Nature == 1) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeEnseigant()),
    );
  } else if (loggedInUser.Nature == 2) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeEtudiant()),
    );
  }
} 
 else {
          // Si la liste est vide, afficher un message d'erreur
          setState(() {
            _errorMessage = 'Email ou mot de passe incorrcet.';
          });
        }
      } catch (e) {
        // En cas d'erreur (par ex., problème réseau ou serveur)
        setState(() {
          _errorMessage = '$e';
          print(e);
        });
      }
    } else {
      // Afficher un message si le forf mulaire est invalide
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez corriger les erreurs')),
      );
    }
  }*/
}
