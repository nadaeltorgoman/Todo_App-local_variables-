import 'package:flutter/material.dart';
import 'package:todo_app/Widgets/elevated_button_style.dart';
import 'package:todo_app/Widgets/or_style.dart';
import '../Resources/text_style.dart';
import '../Widgets/social_media_registration.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'), // Path to your image
                fit: BoxFit.cover, // Adjust the image to cover the entire screen
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 100),
                Text(
                  'Do your\nTasks\nQuickly\nand Easily',
                  style: AppTextStyles.titleLarge,
                ),
                Text(
                  'your tasks, your rules, our support.',
                  style: AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w300),
                ),
                const SizedBox(height: 100),
                const ElevatedButtonStyle(buttonText: "Login", screen: LoginScreen()),
                const SizedBox(height: 15),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Create an account',
                    style: AppTextStyles.bodySmall.copyWith(decoration: TextDecoration.underline, fontWeight: FontWeight.w300),
                  ),
                ),
                const SizedBox(height: 15),
                const OrStyle(),
                const SizedBox(
                  height: 20,
                ),
                const SocialMediaRegistration(isLight: false,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
