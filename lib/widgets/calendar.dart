import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  const Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime belgilanganKun = DateTime.now();


  void previuosDate() {
    setState(() {
      belgilanganKun = DateTime(
          belgilanganKun.year, belgilanganKun.month, belgilanganKun.day - 1);
    });
  }

  void nextDate() {
    setState(() {
      belgilanganKun = DateTime(
          belgilanganKun.year, belgilanganKun.month, belgilanganKun.day + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 18,
                spreadRadius: 0,
                color: Color.fromRGBO(0, 0, 0, 0.15))
          ],
          color: Color(0xff1E1E20),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(6),
            bottomRight: Radius.circular(6),
          )),
      height: 148,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 24,
            ),
            child: Row(
              children: [
                Text(
                  "${DateFormat("MMMM, y").format(belgilanganKun)}",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),

                GestureDetector(
                  onTap:
                  previuosDate,
                    child: SvgPicture.asset("assets/icons/arrow_back.svg")),
                SizedBox(
                  width: 32,
                ),
                SvgPicture.asset("assets/icons/arrow_forward.svg"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Mo",
                          // "${DateFormat("E").format(belgilanganKun)}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                         " ${DateFormat("dd").format(belgilanganKun)}",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Tu",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff00A795),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "We",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Th",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Fr",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
                Container(
                  height: 72,
                  width: 46,
                  decoration: BoxDecoration(
                    color: Color(0xff1E1E20),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12),
                    child: Column(
                      children: [
                        Text(
                          "Sa",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "22",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
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
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
