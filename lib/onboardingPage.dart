import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:kia_garage/home.dart';
import 'package:kia_garage/inscription.dart';
import 'package:kia_garage/login_screen.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
        imageUrl: 'assets/buy.png',
        title: 'Explorez Nos Nouveautés',
        subTitle: 'Découvrez les derniers modèles et consultez nos tarifs en ligne.',
        titleTextStyle: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subTitleTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
      ),
      Introduction(
        imageUrl: 'assets/repare.png',
        title: 'Suivi en Temps Réel',
        subTitle: 'Restez informé de l\'avancement des réparations de votre véhicule.',
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subTitleTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
      ),
      Introduction(
        imageUrl: 'assets/support.png',
        title: 'Assistance 24/7',
        subTitle: 'Accédez à nos conseillers disponibles à toute heure, chaque jour.',
        titleTextStyle: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        subTitleTextStyle: TextStyle(
          fontSize: 15,
          color: Colors.black54,
        ),
      ),
    ];

    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: Colors.white,
      foregroundColor:  Colors.black,
      onTapSkipButton: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) =>LoginScreen())),
      skipTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}