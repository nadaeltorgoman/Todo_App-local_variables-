import 'package:flutter/material.dart';

class ElevatedButtonStyle extends StatelessWidget {
  final String buttonText;
  final Widget screen;
  const ElevatedButtonStyle({
    super.key,
    required this.buttonText,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 15,
        minimumSize: const Size(215, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Text(buttonText),
    );
  }
}
