import 'package:flutter/material.dart';
import 'package:my_blogs/Core/Theme/Color_pallet.dart';
import 'package:my_blogs/Features/Auth/Presentation/Screens/LogInScreen.dart';
import 'package:my_blogs/Features/Auth/Presentation/Screens/SignUpScreen.dart';

class CusText extends StatelessWidget {
  final String text;

  const CusText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        text != 'Sign Up'
            ? Navigator.pushReplacement(context, LogInScreen.route())
            : Navigator.pushReplacement(context, SignUpScreen.route());
      },
      child: RichText(
        text: TextSpan(
          text: text == 'Sign Up'
              ? 'Don\'t have an account?  '
              : "Already have an account? ",
          style: TextStyle(),
          children: [
            TextSpan(
              text: text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: ColorPallet.gradient2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
