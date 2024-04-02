import 'package:flutter/material.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthField.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthGradientButton.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/CusText.dart';

class LogInScreen extends StatefulWidget {
  static route () => MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      );

  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Log In.',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              AuthField(
                hint: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              AuthField(
                hint: 'Password',
                controller: passController,
                isObscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              const AuthGradientButton(text: 'Log In'),
              const SizedBox(
                height: 20,
              ),
              const CusText(
                text: 'Sign Up',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
