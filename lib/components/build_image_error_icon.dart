import 'package:flutter/material.dart';

class BuildImageErrorIcon extends StatelessWidget {
  const BuildImageErrorIcon({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      child: Icon(icon, size: 80, color: Colors.purple),
    );
  }
}

