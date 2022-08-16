import 'package:flutter/material.dart';

import 'button_widget.dart';

class QuantityOptions extends StatelessWidget {
  final Function() onPressedPlus;
  final Function() onPressedRemove;
  const QuantityOptions({
    Key? key,
    required this.onPressedPlus,
    required this.onPressedRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ButtonWidget(
          onPressed: () => onPressedPlus(),
          icon: Icons.add,
        ),
        ButtonWidget(
          onPressed: () => onPressedRemove(),
          icon: Icons.remove,
        ),
      ],
    );
  }
}
