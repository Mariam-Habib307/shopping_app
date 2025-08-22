import 'package:flutter/material.dart';

class BuildOutlinedButton extends StatelessWidget {
  const BuildOutlinedButton({
    super.key,
    required this.label,
    required this.width,
    required this.height,
    required this.borderColor,
    required this.textColor,
    required this.onPressed,
  });

  final String label;
  final double width;
  final double height;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor,
          side: BorderSide(color: borderColor, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
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

