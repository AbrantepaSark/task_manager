import 'package:flutter/material.dart';

class CreateTask extends StatelessWidget {
  static const routeName = '/createTask';
  CreateTask({Key? key}) : super(key: key);
  final GlobalKey<FormState> _formkey = GlobalKey();
  // final _titleController = TextEditingController();
  //bool _isLoading = false;

  final Map<String, String> _authData = {
    'title': '',
    'date': '',
    'time': '',
    'description': '',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Create new task'),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Title:'),
              const SizedBox(height: 5),
              SizedBox(
                height: 40,
                child: TextFormField(
                  cursorColor: Colors.black45,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    hintText: 'Enter task title',
                    hintStyle: const TextStyle(fontSize: 13),
                    filled: true,
                    fillColor: Colors.blue.shade100,
                  ),
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'Username must be 3 characters or more.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['tile'] = value.toString();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
