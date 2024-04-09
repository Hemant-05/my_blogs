import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:my_blogs/Core/Theme/Color_pallet.dart';
import 'package:my_blogs/Features/Blog/Presentation/Widget/BlogEditor.dart';

class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('New Blog'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.done)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DottedBorder(
                color: Colors.grey,
                dashPattern: const [10, 5],
                radius: const Radius.circular(20),
                borderType: BorderType.RRect,
                strokeCap: StrokeCap.round,
                child: Container(
                  height: 180,
                  width: double.infinity,
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.folder_open_rounded,
                        size: 40,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Select photo',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                    'Technology',
                    'Programing',
                    'Business',
                    'Entertainment',
                  ]
                          .map(
                            (e) => Chip(
                              label: Text(e),
                              side: const BorderSide(
                                  color: ColorPallet.borderColor),
                            ),
                          )
                          .toList())),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(controller: titleController, hintText: 'Blog title'),
              const SizedBox(
                height: 10,
              ),
              BlogEditor(
                  controller: contentController, hintText: 'Blog content'),
            ],
          ),
        ),
      ),
    );
  }
}
