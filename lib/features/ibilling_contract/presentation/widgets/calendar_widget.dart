import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  Calendar({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<String> weekDays = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"];

  DateTime thisDay = DateTime.now();
  DateTime dayTime = DateTime.now();

  @override
  void initState() {
    context.read<ContractBloc>().add(LoadContractsEvent(DateFormat("yyyy-MM-dd")
        .format(DateTime(thisDay.year, thisDay.month, thisDay.day))));
    dayTime = DateTime(thisDay.year, thisDay.month, thisDay.day);
    super.initState();
  }

  void previuosWeek() {
    setState(() {
      thisDay = DateTime(thisDay.year, thisDay.month, thisDay.day - 7);
    });
  }

  void nextWeek() {
    setState(() {
      thisDay = DateTime(thisDay.year, thisDay.month, thisDay.day + 7);
    });
  }

  @override
  Widget build(BuildContext context) {
    final itemTextStyle = TextStyle(fontSize: 14, color: Colors.white);
    final itemColor = Colors.white;
    print(dayTime);
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
                SizedBox(
                  width: 125,
                  height: 25,
                  child: Center(
                    child: Text(
                      DateFormat("MMMM, y").format(thisDay),
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => previuosWeek(),
                  child: SvgPicture.asset("assets/icons/arrow_back.svg"),
                ),
                const SizedBox(
                  width: 32,
                ),
                GestureDetector(
                  onTap: () {
                    nextWeek();
                  },
                  child: SvgPicture.asset("assets/icons/arrow_forward.svg"),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 72,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 9.17),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<ContractBloc>().add(LoadContractsEvent(
                          DateFormat("yyyy-MM-dd").format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 5))));

                      dayTime = DateTime(
                          thisDay.year, thisDay.month, thisDay.day - 5);
                    });
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day - 5))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          weekDays.elementAt(DateTime(thisDay.year,
                                      thisDay.month, thisDay.day - 5)
                                  .weekday -
                              1),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            DateFormat('dd').format(DateTime(
                                thisDay.year, thisDay.month, thisDay.day - 5)),
                            style: itemTextStyle),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: itemColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {});
                    context.read<ContractBloc>().add(LoadContractsEvent(
                        DateFormat("yyyy-MM-dd").format(DateTime(
                            thisDay.year, thisDay.month, thisDay.day - 4))));

                    dayTime =
                        DateTime(thisDay.year, thisDay.month, thisDay.day - 4);
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day - 4))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          weekDays.elementAt(DateTime(thisDay.year,
                                      thisDay.month, thisDay.day - 4)
                                  .weekday -
                              1),
                          // weekDays[thisDay.weekday - 1],
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            DateFormat('dd').format(DateTime(
                                thisDay.year, thisDay.month, thisDay.day - 4)),
                            style: itemTextStyle),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: itemColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<ContractBloc>().add(LoadContractsEvent(
                          DateFormat("yyyy-MM-dd").format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 3))));

                      dayTime = DateTime(
                          thisDay.year, thisDay.month, thisDay.day - 3);
                    });
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day - 3))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                            weekDays.elementAt(DateTime(thisDay.year,
                                        thisDay.month, thisDay.day - 3)
                                    .weekday -
                                1),
                            style: itemTextStyle),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          DateFormat('dd').format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 3)),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: itemColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<ContractBloc>().add(LoadContractsEvent(
                          DateFormat("yyyy-MM-dd").format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 2))));

                      dayTime = DateTime(
                          thisDay.year, thisDay.month, thisDay.day - 2);
                    });
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day - 2))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                            weekDays.elementAt(DateTime(thisDay.year,
                                        thisDay.month, thisDay.day - 2)
                                    .weekday -
                                1),
                            style: itemTextStyle),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                            DateFormat('dd').format(DateTime(
                                thisDay.year, thisDay.month, thisDay.day - 2)),
                            style: itemTextStyle),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: !(thisDay ==
                                    DateTime(dayTime.year, dayTime.month,
                                        dayTime.day - 2))
                                ? Colors.white
                                : Colors.red,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<ContractBloc>().add(LoadContractsEvent(
                          DateFormat("yyyy-MM-dd").format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 1))));
                      dayTime = DateTime(
                          thisDay.year, thisDay.month, thisDay.day - 1);
                    });
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day - 1))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          weekDays.elementAt(DateTime(thisDay.year,
                                      thisDay.month, thisDay.day - 1)
                                  .weekday -
                              1),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          DateFormat('dd').format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day - 1)),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: itemColor,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      context.read<ContractBloc>().add(LoadContractsEvent(
                          DateFormat("yyyy-MM-dd").format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day))));
                      dayTime =
                          DateTime(thisDay.year, thisDay.month, thisDay.day);
                    });
                  },
                  child: Container(
                    width: 46,
                    decoration: BoxDecoration(
                      color: !(dayTime ==
                              DateTime(
                                  thisDay.year, thisDay.month, thisDay.day))
                          ? const Color(0xff1E1E20)
                          : const Color(0xff00A795),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          weekDays.elementAt(
                              DateTime(thisDay.year, thisDay.month, thisDay.day)
                                      .weekday -
                                  1),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          DateFormat('dd').format(DateTime(
                              thisDay.year, thisDay.month, thisDay.day)),
                          style: itemTextStyle,
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 1,
                          width: 14.53,
                          decoration: BoxDecoration(
                            color: itemColor,
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
