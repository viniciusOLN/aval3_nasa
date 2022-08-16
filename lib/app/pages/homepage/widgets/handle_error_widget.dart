import 'package:flutter/material.dart';

class HandleError extends StatelessWidget {
  final Function() onPressed;
  const HandleError({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Erro de conexão ou na API, tente novamente.'),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => onPressed(),
              child: const Text('Atualizar lista'),
            ),
          ],
        ),
      ],
    );
  }
}
