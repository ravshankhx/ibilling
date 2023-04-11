

import 'package:flutter/material.dart';

enum ScreenEnum { contractScreen, invoiceScreen }
enum StatusOf { paid, Inprocess, RejectedbyPayme,RejectedbyIq}

class ContractColor {
  static const Color purple = Color(0xFF554E8F);
  static const Color purpleLight = Color(0xFF7EB6FF);
  static const Color purpleDark = Color(0xFF5F87E7);
  static const Color greenLight = Color(0xFF5DE61A);
  static const Color greenDark = Color(0xFF39A801);
  static const Color personal = Color(0xFFFFD506);
  static const Color work = Color(0xFF1ED102);
  static const Color meeting = Color(0xFFD10263);
  static const Color study = Color(0xFF3044F2);
  static const Color shopping = Color(0xFFF29130);
  static const Color party = Color(0xFF09ACCE);
  static const Color fltLight = Color(0xFFF857C3);
  static const Color fltDark = Color(0xFFE0139C);
}

class ContractStyle {
  static const TextStyle entry = TextStyle(
      fontSize: 22, color: ContractColor.purple, fontWeight: FontWeight.w600);
  static const TextStyle btn = TextStyle(fontSize: 15);
  static const TextStyle label = TextStyle(fontSize: 12);
  static const TextStyle appBar = TextStyle(fontSize: 18);
  static const TextStyle taskCard = TextStyle(
      fontSize: 14, color: ContractColor.purple, fontWeight: FontWeight.bold);
  static const TextStyle cardTime = TextStyle(fontSize: 11, color: Colors.grey);
  static const TextStyle panelTitle =
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold);
  static const TextStyle panelCategory =
      TextStyle(fontSize: 14, color: Colors.grey);
  static const TextStyle alertTitle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}

class ContractImage {
  static const String onboarding = 'assets/images/onboarding.png';
  static const String empty = 'assets/images/no_tasks.png';
  static const String appBar = 'assets/images/Frame.png';
  static const String bell = 'assets/icons/bell.png';
}

class ContractIcon {
  static const String add = 'assets/icons/add.png';
}

class ContractShadow {
  static const todoCard =
      BoxShadow(color: Colors.grey, offset: Offset(0, 4), blurRadius: 5);
  static const floatingBtn = BoxShadow(
    color: ContractColor.fltLight,
    blurRadius: 7,
    offset: Offset(0, 4),
  );
  static const category =
      BoxShadow(color: Colors.grey, offset: Offset(0, 5), blurRadius: 10);
}

class ContractRadius {
  static const elliptical =
      BorderRadius.vertical(top: Radius.elliptical(200, 30));
  static const categoryCard = BorderRadius.all(Radius.circular(5));
  static const gradientBtn = BorderRadius.all(Radius.circular(10));
  static const todoCard = BorderRadius.all(Radius.circular(7));
}

class ContractSize {
  static const double panelMaxHeight = 370;
  static const double iOSfabBottomPad = 63;
  static const double androidFabBottomPad = 28;
  static const double appBarNoAlert = 70;
  static const double appBarAlert = 200;
}
