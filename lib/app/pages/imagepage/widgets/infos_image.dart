import 'package:flutter/material.dart';

import '../../../utils/format_date.dart';

class InfosImage extends StatelessWidget {
  final String title;
  final String date;
  final String explanation;
  const InfosImage({
    Key? key,
    required this.title,
    required this.explanation,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Arial',
              ),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(FormatDate.getFormattedDate(date)),
          ),
          SizedBox(height: 20),
          Text(
            explanation,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
