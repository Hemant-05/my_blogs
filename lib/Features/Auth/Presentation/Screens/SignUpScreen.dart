import 'package:flutter/material.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthField.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthGradientButton.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/CusText.dart';

class SignUpScreen extends StatefulWidget {
  static route ()=> MaterialPageRoute(
    builder: (context) => const SignUpScreen(),
  );
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    nameController.dispose();
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
                'Sign Up.',
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
                hint: 'Name',
                controller: nameController,
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
              const AuthGradientButton(text: 'Sign Up'),
              const SizedBox(
                height: 20,
              ),
              const CusText(text: 'Sign In',),
            ],
          ),
        ),
      ),
    );
  }
}
