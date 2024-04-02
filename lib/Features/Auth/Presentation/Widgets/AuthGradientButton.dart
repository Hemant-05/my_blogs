import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_blogs/Core/Theme/Color_pallet.dart';

class AuthGradientButton extends StatelessWidget {
  final String text;

  const AuthGradientButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            ColorPallet.gradient1,
            ColorPallet.gradient3
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(370, 55),
          shadowColor: ColorPallet.transparentColor,
          backgroundColor: ColorPallet.transparentColor,
        ),
      ),
    );
  }
}
