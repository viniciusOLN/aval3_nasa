import 'package:flutter/material.dart';
import '../../teampage/team_page.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final Function() onPressed;
  const AppBarWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Galeria do Universo'),
      actions: [
        IconButton(
          icon: const Icon(Icons.group),
          onPressed: () async {
            return await showDialog(
              context: context,
              builder: (context) => const TeamPage(),
            );
          },
        ),
        IconButton(
          onPressed: () => onPressed(),
          icon: const Icon(Icons.refresh),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
