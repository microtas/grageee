import 'package:flutter/material.dart';
import 'package:kia_garage/home.dart';
import 'package:kia_garage/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  bool _isPasswordVisible = false;
  String _errorMessage = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Gradient
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[50],
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo
                    Image.asset(
                      'assets/signup.png',
                      height: 400,
                    ),
                    const SizedBox(height: 30),

                    // Sign Up Card
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              const Text(
                                'Créer un compte',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Name Field
                              _buildTextFormField(
                                label: 'Nom',
                                icon: Icons.person,
                                controller: _nameController,
                                validator: (value) => value!.isEmpty ? 'Le nom est obligatoire' : null,
                              ),
                              const SizedBox(height: 20),

                              // Email Field
                              _buildTextFormField(
                                label: 'Email',
                                hint: 'ex: test@gmail.com',
                                icon: Icons.email,
                                controller: _emailController,
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 20),

                              // Password Field
                              _buildTextFormField(
                                label: 'Mot de Passe',
                                hint: '********',
                                icon: Icons.lock,
                                controller: _passwordController,
                                obscureText: !_isPasswordVisible,
                                validator: _validatePassword,
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                              ),
                              const SizedBox(height: 10),

                              // Confirm Password Field
                              _buildTextFormField(
                                label: 'Confirmer le Mot de Passe',
                                hint: '********',
                                icon: Icons.lock,
                                controller: _confirmPasswordController,
                                obscureText: !_isPasswordVisible,
                                validator: (value) {
                                  if (value != _passwordController.text) {
                                    return 'Les mots de passe ne correspondent pas';
                                  }
                                  return _validatePassword(value);
                                },
                              ),
                              const SizedBox(height: 10),

                              // Error Message
                              AnimatedOpacity(
                                opacity: _errorMessage.isNotEmpty ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  _errorMessage,
                                  style: const TextStyle(color: Colors.red),
                                ),
                              ),
                              const SizedBox(height: 20),

                              // Submit Button
SizedBox(
  height: 55,
  width: double.infinity,
  child: ElevatedButton(
    onPressed: () {
      setState(() {
        // Réinitialiser le message d'erreur avant de valider
        _errorMessage = '';
      });

      if (_formKey.currentState?.validate() ?? false) {
        // Si le formulaire est valide, naviguer vers la page d'accueil
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Veuillez corriger les erreurs ci-dessus.';
        });
      }
    },
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      backgroundColor: Colors.black,
      elevation: 4,
    ),
    child: const Text(
      'S\'inscrire',
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),
                             
                                const SizedBox(height: 20),
                    // Navigate to Login
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      ),
                      child: const Text("Déjà un compte ? Connectez-vous"),
                    ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField({
    required String label,
    required TextEditingController controller,
    required String? Function(String?) validator,
    String? hint,
    bool obscureText = false,
    IconData? icon,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: icon != null ? Icon(icon, color: Colors.black54) : null,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
    );
  }

  void _submitForm() {
    setState(() {
      _errorMessage = '';
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Le mot de passe est obligatoire';
    }
    if (value.length < 8) {
      return 'Le mot de passe doit contenir au moins 8 caractères';
    }
    return null;
  }
}