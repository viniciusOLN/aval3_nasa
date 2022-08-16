import 'package:flutter/material.dart';

class ContainerInfos extends StatelessWidget {
  final String title;
  final String date;
  const ContainerInfos({
    Key? key,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.all(15),
      color: const Color.fromARGB(106, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          Text(
            date,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
