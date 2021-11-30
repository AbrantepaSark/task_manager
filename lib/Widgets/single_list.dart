import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Screens/screens.dart';

class SingleList extends StatelessWidget {
  const SingleList({
    Key? key,
    required this.id,
    required this.title,
    required this.des,
    required this.date,
    required this.time,
    required this.createdDate,
  }) : super(key: key);
  final String id;
  final String title;
  final String des;
  final DateTime date;
  final String time;
  final DateTime createdDate;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context)
          .pushNamed(SingleTaskScreen.routeName, arguments: id),
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          alignment: Alignment.centerLeft,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$title $id',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17)),
                  const SizedBox(height: 10),
                  Text(DateFormat.yMMMEd().format(createdDate),
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
