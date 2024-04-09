import 'package:flutter/material.dart';
import 'package:my_blogs/Features/Blog/Presentation/Screens/CreateBlogScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Blogs'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateBlogScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.add_circle_outline)),
        ],
      ),
      body: Center(child: const Text('Home Screen')),
    );
  }
}
