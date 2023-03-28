import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import 'day.dart';

class Calendar extends StatefulWidget {
  late DateTime belgilanganKun;

  Calendar({
    Key? key,
    required this.belgilanganKun,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  void previuosDate() {
    setState(() {
      widget.belgilanganKun = DateTime(widget.belgilanganKun.year,
          widget.belgilanganKun.month - 1, widget.belgilanganKun.day);
    });
  }

  void nextDate() {
    setState(() {
      widget.belgilanganKun = DateTime(
          widget.belgilanganKun.year, widget.belgilanganKun.month + 1, widget.belgilanganKun.day);
    });
  }

  void setThisDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2024),
    ).then((kun) {
      setState(() {
        if (kun != null) {
          widget.belgilanganKun = kun;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
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
            margin: const EdgeInsets.only(
              top: 12,
              left: 16,
              right: 16,
              bottom: 10,
            ),
            child: Row(
              children: [
                TextButton(
                    onPressed: () => setThisDate(context),
                    child: SizedBox(
                      width: 125,
                      height: 25,
                      child: Center(
                        child: Text(
                          DateFormat("MMMM, y").format(widget.belgilanganKun),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                      ),
                    )),
                const Spacer(),
                GestureDetector(
                  onTap: previuosDate,
                  child: SvgPicture.asset("assets/icons/arrow_back.svg"),
                ),
                const SizedBox(
                  width: 32,
                ),
                GestureDetector(
                  onTap: nextDate,
                  child: SvgPicture.asset("assets/icons/arrow_forward.svg"),
                ),
              ],
            ),
          ),
          Container(
            height: 72,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: DateTime(widget.belgilanganKun.year,
                      widget.belgilanganKun.month + 1, 0)
                  .day,
              itemBuilder: (context, index) {
                return Day(
                  index: index,
                  belgilanganKun: widget.belgilanganKun,
                  dayColor: Colors.red,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 72 / 46,
                  crossAxisCount: 1,
                  mainAxisSpacing: 15),
            ),
          )
        ],
      ),
    );
  }
}
