import 'package:flutter/material.dart';
import 'package:todo_app/Resources/color_pallete.dart';
import 'package:todo_app/Screens/transition_screen.dart';

import '../Resources/icons.dart';
import '../Resources/text_style.dart';
import '../Widgets/elevated_button_style.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(contractBackgroundImage), // Path to your image
                fit: BoxFit.cover, // Adjust the image to cover the entire screen
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  'Let’s make a contract ',
                  style: AppTextStyles.bodyLarge.copyWith(fontSize: 18, fontWeight: FontWeight.w900, color: ColorsPalette.blackColor),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'I will',
                    style: AppTextStyles.bodyBold,
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  '•  ☀️ Plan tasks. \n•  🎯 Set goals. \n•  🚶‍♂️ Take breaks. \n•  💪 Move and refresh. \n•  📝 Prioritize. \n•  🔍 Break tasks down. \n•  🚫 No multitasking. \n•  📵 Minimize distractions. \n•  ⏰ Limit social media.',
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 16, fontWeight: FontWeight.w500, color: ColorsPalette.blackColor, height: 2),
                ),
              ),
              const SizedBox(height: 50),
              const Center(
                child: ElevatedButtonStyle(
                  buttonText: 'I AGREE',
                  screen: TransitionScreen(),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
