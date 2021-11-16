import 'package:flutter/material.dart';
import '../Screens/screens.dart';

class SingleList extends StatelessWidget {
  const SingleList({
    Key? key,
    required this.id,
    required this.title,
    required this.des,
    required this.date,
    required this.time,
  }) : super(key: key);
  final String id;
  final String title;
  final String des;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(SingleTaskScreen.routeName, arguments: id),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.blue.shade100,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 17)),
                  const SizedBox(height: 10),
                  Text('$date, $time',
                      style: const TextStyle(fontWeight: FontWeight.w300)),
                ],
              ),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios),
            ],
          )),
    );
  }
}
