import 'package:flutter/material.dart';
import 'package:todo_app/Resources/color_pallete.dart';
import 'package:todo_app/Resources/text_style.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.secondaryColor,
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Profile Screen',
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 26),
          ),
          const SizedBox(height: 20),
          cardContainer('Account'),
          const SizedBox(height: 20),
          cardContainer('Help'),
          const SizedBox(height: 20),
          cardContainer('Log out'),
        ],
      )),
    );
  }

  Container cardContainer(String text) {
    return Container(
      height: 80,
      width: 380,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: ColorsPalette.whiteColor,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: AppTextStyles.bodyMedium.copyWith(fontSize: 20),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 24,
          )
        ],
      ),
    );
  }
}
