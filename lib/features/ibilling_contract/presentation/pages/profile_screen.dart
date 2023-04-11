import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

class ProfileScreen extends StatelessWidget {
  final String appTitle;

  const ProfileScreen({Key? key, required this.appTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(51),
        child: AppBar(
          centerTitle: false,
          backgroundColor: const Color(0xff141416),
          leading: Ink(
            height: 24,
            width: 24,
            child: Container(
              margin: const EdgeInsets.only(
                left: 20,
                bottom: 13,
                top: 14,
                right: 12,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromRGBO(255, 194, 0, 1),
                        Color.fromRGBO(5, 0, 255, 1),
                        Color.fromRGBO(255, 199, 0, 1),
                        Color.fromRGBO(173, 0, 255, 1),
                        Color.fromRGBO(0, 255, 148, 1),
                      ])),
            ),
          ),
          elevation: 0,
          title: Text(
            appTitle,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20.05),
            margin: const EdgeInsets.only(
                bottom: 11.89, right: 16, left: 16, top: 20),
            height: 188,
            width: double.infinity,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 18,
                      spreadRadius: -2,
                      color: Color.fromRGBO(0, 0, 0, 0.15))
                ],
                color: const Color.fromRGBO(42, 42, 45, 1),
                borderRadius: BorderRadius.circular(6)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: Color.fromRGBO(0, 167, 149, 1),
                      child: Icon(IconlyBold.profile),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Otabek Abdusamatov",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(0, 167, 149, 1),
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Graphic Designer",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Container(
                              height: 3,
                              width: 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(1.5)),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "IQ Education",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: const [
                    Text(
                      "Date of birth:  ",
                      style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "27.06.1999",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Phone Number:  ",
                      style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "+998903331060",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "E-mail:  ",
                      style: TextStyle(
                          color: Color.fromRGBO(231, 231, 231, 1),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "xasanovravshan2706@gmail.com",
                      style: TextStyle(
                        color: Color.fromRGBO(153, 153, 153, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) {
                    return AlertDialog(
                      shadowColor: const Color(0xff0C0C0C),
                      backgroundColor: const Color(0xff2A2A2D),
                      content: const Text(
                        'Choose a language',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      actions: [
                        ListTile(
                          leading: SvgPicture.asset(
                            "assets/icons/language_uz.svg",
                            fit: BoxFit.fill,
                          ),
                          title: const Text("O'zbek (Lotin)"),
                          trailing: SvgPicture.asset(
                              "assets/icons/choose_language.svg"),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            "assets/icons/language_ru.svg",
                            fit: BoxFit.fill,
                          ),
                          title: const Text("O'zbek (Lotin)"),
                          trailing: SvgPicture.asset(
                              "assets/icons/choose_language.svg"),
                        ),
                        ListTile(
                          leading: SvgPicture.asset(
                            "assets/icons/language_eng.svg",
                            fit: BoxFit.fill,
                          ),
                          title: const Text("O'zbek (Lotin)"),
                          trailing: SvgPicture.asset(
                              "assets/icons/choose_language.svg"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel")),
                            ElevatedButton(
                                onPressed: () {}, child: const Text("Done")),
                          ],
                        )
                      ],
                    );
                  });
            },
            child: Container(
              margin: const EdgeInsets.only(
                bottom: 11,
                right: 16,
                left: 16,
              ),
              height: 44,
              width: double.infinity,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 18,
                        spreadRadius: -2,
                        color: Color.fromRGBO(0, 0, 0, 0.15))
                  ],
                  color: const Color.fromRGBO(42, 42, 45, 1),
                  borderRadius: BorderRadius.circular(6)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "English (USA)",
                  ),
                  const Spacer(),
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Color(0xff1A000000),
                          offset: Offset(2, 4),
                          blurRadius: 20,
                          spreadRadius: 0)
                    ], borderRadius: BorderRadius.circular(20)),
                    child: SvgPicture.asset(
                      "assets/icons/language_eng.svg",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
