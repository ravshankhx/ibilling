import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class FilterScreen extends StatelessWidget {
  final String appTitle;

  const FilterScreen({Key? key, required this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff000000),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(51),
        child: AppBar(
            backgroundColor: Color(0xff141416),
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              icon: Icon(Icons.arrow_back),
            ),

            elevation: 0,
            title: Text(appTitle)),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, top: 28, right: 16),

        child: Column(


          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Status",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Color(0xff999999)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 120,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                    SizedBox(height: 20,),
                    Container(
                      height: 24,
                      width: 120,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                SizedBox(
                  width: 43,
                ),
                Column(
                  children: [
                    Container(
                      height: 24,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                    SizedBox(height: 20,),
                    Container(
                      height: 24,
                      width: 180,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
            SizedBox(height: 32,),
            Text(
              "Date",
              style: TextStyle(
                  fontWeight: FontWeight.w700, color: Color(0xff999999)),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "31.11.2021",
                        style: TextStyle(color: Color(0xff999999)),
                      ),
                      Icon(IconlyBold.calendar, color: Color(0xff999999))
                    ],
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xffD1D1D1),
                      )),
                  width: 8,
                ),
                SizedBox(
                  width: 12,
                ),
                Container(
                  height: 37,
                  width: 116,
                  decoration: BoxDecoration(
                      color: Color(0xff2A2A2D),
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
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
