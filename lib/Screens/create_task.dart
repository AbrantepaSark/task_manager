// ignore_for_file: avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../Widgets/widgets.dart';
import '../Provider/Tasks_provider.dart';

class CreateTask extends StatefulWidget {
  static const routeName = '/createTask';
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  // final _titleController = TextEditingController();
  String title = '';
  String des = '';
  DateTime? pickedDate;
  String? pickedTime;
  bool _isLoading = false;

  void datePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    ).then((date) {
      if (date == null) {
        return;
      }
      setState(() {
        pickedDate = date;
      });
    });
  }

  void timePicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((time) {
      if (time == null) {
        return;
      }
      setState(() {
        pickedTime = time.format(context);
      });
    });
  }

  void _showInfoDialog(String message) {
    showDialog(
      barrierDismissible: true,
      barrierColor: Colors.black54,
      context: context,
      builder: (ctx) => CustomDialog('Alert!!!', message, ''),
    );
  }

  Future<void> _submit() async {
    final isValid = _formkey.currentState!.validate();
    if (!isValid && pickedDate == null && pickedTime == null) {
      _showInfoDialog('Provide all details.');
      return;
    }

    _formkey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    //_isLoading ? loader(context) : null;
    try {
      print('here');
      // await Provider.of<Tasks>(context, listen: false)
      //     .createTask(title, des, pickedDate!, pickedTime!);
      Provider.of<Tasks>(context, listen: false).test();
      //Save task

    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      // showDialog(
      //   barrierDismissible: true,
      //   barrierColor: Colors.black54,
      //   context: context,
      //   builder: (ctx) => CustomDialog('Alert', e.toString(), ''),
      //);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create new task'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Title:',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 55,
                child: TextFormField(
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 5),
                    hintText: 'Enter task title',
                    hintStyle: const TextStyle(fontSize: 13),
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.blue.shade100,
                    errorStyle: const TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please provide title.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    title = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Pick date:',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pickedDate == null
                          ? 'No picked date:'
                          : DateFormat.yMMMEd().format(pickedDate!),
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    TextButton(
                        onPressed: datePicker,
                        child: const Text('Select date')),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Pick time:',
                style: TextStyle(fontWeight: FontWeight.w800),
              ),
              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pickedTime == null ? 'No picked date:' : pickedTime!,
                      style: TextStyle(color: Colors.grey.shade700),
                    ),
                    TextButton(
                        onPressed: timePicker,
                        child: const Text('Select time')),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'DESCRIPTION',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(
                height: 20,
                child: Divider(
                  thickness: 3,
                  indent: 50,
                  endIndent: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 40),
                color: Colors.white,
                child: TextFormField(
                  cursorColor: Colors.black45,
                  maxLines: 5,
                  textInputAction: TextInputAction.done,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    hintText: 'Enter task description',
                    hintStyle: TextStyle(fontSize: 13),
                    border: InputBorder.none,
                    errorStyle: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide task description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    des = value.toString();
                  },
                ),
              ),
              CustomButton(Icons.save, 'Save', _submit),
            ],
          ),
        ),
      ),
    );
  }
}
