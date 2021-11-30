import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final String message, title;
  final String cun;
  const CustomDialog(this.title, this.message, this.cun, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3,
      insetPadding:
          const EdgeInsets.symmetric(horizontal: 60.0, vertical: 24.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
          height: 160,
          //width: 80,
          padding: const EdgeInsets.only(bottom: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  //height: 50,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(14),
                      topRight: Radius.circular(14),
                    ),
                    color: Colors.brown,
                  ),
                  child: Text(
                    title,
                    maxLines: 1,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  alignment: Alignment.center,
                  child: Text(message),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (cun != '')
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: const Text(
                          'Cuncel',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
