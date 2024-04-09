import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_blogs/Core/Common/Cubit/AppUser/app_user_cubit.dart';
import 'package:my_blogs/Core/Theme/Theme.dart';
import 'package:my_blogs/Features/Auth/Presentation/Bloc/auth_bloc.dart';
import 'package:my_blogs/Features/Blog/Presentation/Screens/HomeScreen.dart';
import 'package:my_blogs/init_dependencies.dart';

import 'Features/Auth/Presentation/Screens/LogInScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => serviceLocator<AppUserCubit>(),
        ),
        BlocProvider(
          create: (context) => serviceLocator<AuthBloc>(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Blogs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: BlocSelector<AppUserCubit, AppUserState, bool>(
        selector: (state) {
          return state is AppUserLoggedIn;
        },
        builder: (context, state) {
          if (state) {
            return const HomeScreen();
          }
          return const LogInScreen();
        },
      ),
    );
  }
}
