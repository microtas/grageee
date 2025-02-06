import 'package:flutter/material.dart';
import 'package:intro_screen_onboarding_flutter/introduction.dart';
import 'package:intro_screen_onboarding_flutter/introscreenonboarding.dart';
import 'package:kia_garage/home.dart';

class Onboardingpage extends StatelessWidget {
  const Onboardingpage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Introduction> list = [
      Introduction(
      imageUrl: 'assets/cars.png', 
      title: 'cars',
      subTitle: 'supcar'),
      Introduction(
      imageUrl: 'assets/car1.png',
      title: 'cars2',
      subTitle: 'supcar2'),
      Introduction(
      imageUrl: 'assets/homme.png',
      title: 'title', 
      subTitle: 'subTitle')
    ];
    return IntroScreenOnboarding(
      introductionList: list,
      backgroudColor: Colors.white, 
      foregroundColor: Color.fromARGB(241, 63, 49, 217),
      onTapSkipButton: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage())),
      skipTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
      
    );
  }
}
