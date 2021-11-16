import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Provider/provider.dart';

import '../Widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: Column(
            children: [
              Container(
                height: 60,
                width: double.infinity,
                alignment: Alignment.bottomLeft,
                child: const Text(
                  'ToDo List',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w400),
                ),
              ),
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
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
