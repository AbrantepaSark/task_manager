import 'package:flutter/material.dart';

class SingleTaskScreen extends StatelessWidget {
  const SingleTaskScreen({Key? key}) : super(key: key);
  static const routeName = '/singleTask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: const Text('Task'),
    );
  }
}
