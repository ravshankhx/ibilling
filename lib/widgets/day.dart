import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day extends StatelessWidget {
  final int index;
  final DateTime belgilanganKun;
  final Color dayColor;

  Day({
    Key? key,
    required this.index,
    required this.belgilanganKun,
    required this.dayColor,
  }) : super(key: key);

  String? weekAbr(int weekDay) {
    switch (weekDay) {
      case 1:
        return "Mo";
      case 2:
        return "Tu";
      case 3:
        return "We";
      case 4:
        return "Thu";
      case 5:
        return "Fri";
      case 6:
        return "Sa";
      case 7:
        return "Su";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: dayColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          Text(
            weekAbr(
                DateTime(belgilanganKun.year, belgilanganKun.month, index + 1)
                    .weekday)!,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            '${index + 1}',
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Container(
            height: 1,
            width: 14.53,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
