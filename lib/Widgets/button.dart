import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.icon, this.text, this.onPressHandler, {Key? key})
      : super(key: key);
  final IconData icon;
  final String text;
  final Function onPressHandler;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressHandler,
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 3),
            Text(text),
          ],
        ),
      ),
    );
  }
}
