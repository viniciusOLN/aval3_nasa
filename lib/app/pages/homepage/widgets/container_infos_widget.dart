import 'package:flutter/material.dart';

import '../../../utils/format_date.dart';

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
            style: const TextStyle(color: Colors.white),
          ),
          const SizedBox(height: 5),
          Text(
            FormatDate.getFormattedDate(date),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
