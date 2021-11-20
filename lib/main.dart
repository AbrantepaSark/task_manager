import 'package:flutter/material.dart';
import './Screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App With Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        SingleTaskScreen.routeName: (ctx) => const SingleTaskScreen(),
        CreateTask.routeName: (ctx) => const CreateTask(),
      },
    );
  }
}
