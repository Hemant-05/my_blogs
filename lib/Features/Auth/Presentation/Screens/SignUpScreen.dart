import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blogs/Core/Common/Widget/Loader.dart';
import 'package:my_blogs/Core/Utils/ShowSnackBar.dart';
import 'package:my_blogs/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthField.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthGradientButton.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/CusText.dart';

class SignUpScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      );

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();

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
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
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
                  AuthGradientButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                name: nameController.text.toString().trim(),
                                email: emailController.text.toString().trim(),
                                pass: passController.text.toString().trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CusText(
                    text: 'Sign In',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
