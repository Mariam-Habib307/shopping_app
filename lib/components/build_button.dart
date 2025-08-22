import 'package:flutter/material.dart';

class BuidButton extends StatelessWidget {
  const BuidButton({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });

  final String label;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 5,
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Suwannaphum-Regular',
            fontWeight: FontWeight.bold,
            fontSize: width * 0.08,
          ),
        ),
      ),
    );
  }
}
