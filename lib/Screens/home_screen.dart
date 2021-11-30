import 'package:flutter/material.dart';
import '../Provider/provider.dart';

import './screens.dart';

import '../Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
          child: Column(
            children: [
              Container(
                height: 45,
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'My ToDo',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                ),
              ),
              const Text('Keep your tasks safe and accessible'),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 8),
                  child: ListView.builder(
                    itemCount: taskList.length,
                    itemBuilder: (ctx, i) => SingleList(
                      id: taskList[i].id,
                      title: taskList[i].title,
                      des: taskList[i].description,
                      date: taskList[i].date,
                      time: taskList[i].time,
                      createdDate: taskList[i].createdDate,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(CreateTask.routeName);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
