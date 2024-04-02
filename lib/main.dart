import 'package:flutter/material.dart';
import 'package:my_blogs/Core/Theme/Theme.dart';
import 'Features/Auth/Presentation/Screens/SignInScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LogInScreen(),
    );
  }
}