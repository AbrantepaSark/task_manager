import 'package:flutter/material.dart';

void loader(BuildContext context) {
  showDialog(
    barrierDismissible: true,
    barrierColor: Colors.black54,
    context: context,
    builder: (ctx) => Dialog(
      child: SizedBox(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    ),
  );
}
