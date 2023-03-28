import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
   late final DateTime firstDay;

   late final DateTime toDay;

  DateWidget({Key? key, required this.firstDay, required this.toDay})
      : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool isSet = false;

  void setfirstDate(
    BuildContext context,
  ) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((kun) {
      setState(() {
        if((kun != null)||(widget.firstDay.isBefore(widget.toDay))) {
          widget.firstDay = kun!;
        }
      });
    });
  }

  void setToDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((kun) {
      setState(() {
        if ((kun != null)||(widget.firstDay.isBefore(widget.toDay))) {

          widget.toDay = kun!;
          isSet =true;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Date",
            style: TextStyle(
                fontWeight: FontWeight.w700, color: Color(0xff999999)),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () => setfirstDate(context),
                child: Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: const Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        DateFormat("dd.MM.y").format(widget.firstDay),
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                      Icon(IconlyBold.calendar, color: Color(0xff999999))
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 2,
                  color: const Color(0xffD1D1D1),
                )),
                width: 8,
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () => setToDate(context),
                child: Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: const Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isSet
                            ? DateFormat("dd.MM.y").format(widget.toDay)
                            : "To",
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                      SizedBox(
                        width: isSet ? 0 : 63,
                      ),
                      Icon(IconlyBold.calendar, color: Color(0xff999999))
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
