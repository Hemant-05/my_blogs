import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blogs/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthField.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/AuthGradientButton.dart';
import 'package:my_blogs/Features/Auth/Presentation/Widgets/CusText.dart';

import '../../../../Core/Common/Widget/Loader.dart';
import '../../../../Core/Utils/ShowSnackBar.dart';

class LogInScreen extends StatefulWidget {
  static route() => MaterialPageRoute(
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
                  AuthGradientButton(
                    text: 'Log In',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                email: emailController.text.trim(),
                                pass: passController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CusText(
                    text: 'Sign Up',
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
