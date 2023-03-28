import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FilterScreen extends StatelessWidget {
  final String appTitle;

  const FilterScreen({Key? key, required this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xff000000),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(51),
        child: AppBar(
            backgroundColor: const Color(0xff141416),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: const Icon(Icons.arrow_back),
            ),

            elevation: 0,
            title: Text(appTitle)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 28, right: 16),

        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Status",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Color(0xff999999)),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 120,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(IconlyBold.tick_square,
                              color: Color(0xff999999)),
                          SizedBox(width: 8,),
                          Text(
                            "Paid",
                            style: TextStyle(color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 24,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(IconlyBold.tick_square,
                              color: Color(0xff999999)),
                          SizedBox(width: 8,),
                          Text(
                            "Paid",
                            style: TextStyle(color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 43,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 24,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(IconlyBold.tick_square,
                              color: Color(0xff999999)),
                          SizedBox(width: 8,),
                          Text(
                            "Rejected by IQ",
                            style: TextStyle(color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      height: 24,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Icon(IconlyBold.tick_square,
                              color: Color(0xff999999)),
                          SizedBox(width: 8,),
                          Text(
                            "Rejected by Payme",
                            style: TextStyle(color: Color(0xff999999)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

              ],
            ),
            const SizedBox(height: 32,),
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
                Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: const Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "31.11.2021",
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                      Icon(IconlyBold.calendar, color: Color(0xff999999))
                    ],
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
                Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: const Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "To",
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                      SizedBox(
                        width: 63,
                      ),
                      Icon(IconlyBold.calendar, color: Color(0xff999999))
                    ],
                  ),
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
