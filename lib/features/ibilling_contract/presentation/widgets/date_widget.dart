import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';

class DateWidget extends StatefulWidget {
  DateWidget({Key? key}) : super(key: key);

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
  bool isSet = false;

  DateTime firstDay = DateTime.now();
  DateTime lastDay = DateTime.now();

  void setfirstDate(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((kun) {
      setState(() {
        // context.read<ContractBloc>().add(LoadAllContractsEvent(
        //   DateFormat("yyyy.MM.dd").format(firstDay),
        //   DateFormat("yyyy.MM.dd").format(lastDay),
        // ));
        if ((kun != null) || (kun!.isBefore(lastDay))) {
          firstDay = kun;
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
        if ((kun != null) || (kun!.isAfter(firstDay))) {
          lastDay = kun;
          isSet = true;

          context.read<ContractBloc>().add(LoadHistoryContractsEvent(
                DateFormat("yyyy-MM-dd").format(firstDay),
                DateFormat("yyyy-MM-dd").format(lastDay),
              ));
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
                        DateFormat("dd.MM.y").format(firstDay),
                        style: const TextStyle(color: Color(0xff999999)),
                      ),
                      const Icon(IconlyBold.calendar, color: Color(0xff999999))
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
                        isSet ? DateFormat("dd.MM.y").format(lastDay) : "To",
                        style: const TextStyle(color: Color(0xff999999)),
                      ),
                      SizedBox(
                        width: isSet ? 0 : 63,
                      ),
                      const Icon(IconlyBold.calendar, color: Color(0xff999999))
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
