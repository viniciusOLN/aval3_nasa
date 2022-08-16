import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final IconData icon;
  const ButtonWidget({
    Key? key,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onPressed(),
      icon: Icon(icon),
    );
  }
}
