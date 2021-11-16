import 'package:flutter/material.dart';
import 'package:flutter_new_app/Widgets/widgets.dart';

class SingleTaskScreen extends StatelessWidget {
  const SingleTaskScreen({Key? key}) : super(key: key);
  static const routeName = '/singleTask';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        title: const Text('Task Title'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                TaskInfo(
                  heading: 'DATE',
                  text: 'May 18, 2021',
                ),
                TaskInfo(
                  heading: 'TIME',
                  text: '10:00AM',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              'DESCRIPTION',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey.shade800),
            ),
            const SizedBox(
              height: 20,
              child: Divider(
                thickness: 3,
                indent: 50,
                endIndent: 50,
              ),
            ),
            const Text(
              'Due to the increase in course offerings and enrollment surges, the demand placed on facilities of'
              'academic institutions has become relentlessly high. The ability to work within the given constraints'
              'of time, facilities and resource persons becomes the greatest asset of any institution',
              style: TextStyle(
                height: 1.5,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 50),
            CustomButton(Icons.edit, 'Edit', () {})
          ],
        ),
      ),
    );
  }
}

class TaskInfo extends StatelessWidget {
  const TaskInfo({
    required this.heading,
    required this.text,
    Key? key,
  }) : super(key: key);
  final String heading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          heading,
          style: TextStyle(color: Colors.grey.shade700),
        ),
        const SizedBox(height: 3),
        Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
}
