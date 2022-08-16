import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text('Equipe'),
      content: Text(
          'Vinicius Oliveira do Nascimento\nJoão de Castro Oliveira\nHenrique Gleison Silva'),
    );
  }
}
