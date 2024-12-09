import 'package:flutter/material.dart';
import 'package:todo_app/Resources/color_pallete.dart';
import 'package:todo_app/Resources/icons.dart';
import 'package:todo_app/Resources/text_style.dart';
import 'package:todo_app/Screens/contract_screen.dart';
import 'package:todo_app/Widgets/elevated_button_style.dart';
import 'package:todo_app/Widgets/or_style.dart';

import '../Widgets/social_media_registration.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(loginBackgroundImage), // Path to your image
                fit: BoxFit.cover, // Adjust the image to cover the entire screen
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  'Log in to HabitHUB',
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 18, fontWeight: FontWeight.w700, color: const Color(0xffC67ED2)),
                ),
                const SizedBox(height: 20),
                Text(
                  'Welcome back! Sign in using your social',
                  style: AppTextStyles.bodySmall.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsPalette.blackColor),
                ),
                Text(
                  'account or email to continue us',
                  style: AppTextStyles.bodySmall.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsPalette.blackColor),
                ),
                const SizedBox(height: 30),
                const SocialMediaRegistration(
                  isLight: true,
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: OrStyle(),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      hintStyle: AppTextStyles.bodySmall.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsPalette.blackColor),
                      filled: true,
                      fillColor: ColorsPalette.whiteColor,
                      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: AppTextStyles.bodySmall.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: ColorsPalette.blackColor),
                      filled: true,
                      fillColor: ColorsPalette.whiteColor,
                      contentPadding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                const ElevatedButtonStyle(
                  buttonText: 'Login',
                  screen: ContractScreen(),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
