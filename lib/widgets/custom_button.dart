import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  CustomButton({required this.text, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: TextStyle(color: Colors.white),
            primary: Colors.blue,
          ),
          child: Text(text),
          onPressed: onTap,
        ),);
  }
}
