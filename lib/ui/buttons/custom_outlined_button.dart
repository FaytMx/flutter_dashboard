import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.color = Colors.blue,
    this.isFilled = false,
  }) : super(key: key);

  final Function onPressed;
  final String text;
  final Color color;
  final bool isFilled;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: color),
        ),
        backgroundColor: MaterialStateProperty.all(
            isFilled ? color.withOpacity(0.3) : Colors.transparent),
      ),
      onPressed: () => this.onPressed(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          this.text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}