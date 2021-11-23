import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Widgets/widgets.dart';

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
  String description = '';
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

  Future<void> _submit() async {
    // ignore: avoid_print
    print('here');
    final isValid = _formkey.currentState!.validate();
    if (!isValid) {
      return;
    }

    _formkey.currentState!.save();
    setState(() {
      _isLoading = true;
    });

    _isLoading
        ? showDialog(
            barrierDismissible: true,
            barrierColor: Colors.black54,
            context: context,
            builder: (ctx) => Dialog(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text('loading'),
                ],
              ),
            ),
          )
        : Null;

    // try {
    //Save task

    // } catch (e) {
    // setState(() {
    // _isLoading = false;
    // });
    // showDialog(
    //   barrierDismissible: true,
    //   barrierColor: Colors.black54,
    //   context: context,
    //   builder: (ctx) => CustomDialog('Alert', e.toString(), ''),
    // );
    //}
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
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide task description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    description = value.toString();
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
