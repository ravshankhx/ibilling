import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/screens/contracts_screen.dart';
import 'package:ibilling/screens/history_screen.dart';
import 'package:ibilling/screens/new_contract_screen.dart';
import 'package:ibilling/screens/profile_screen.dart';
import 'package:ibilling/screens/saved_screen.dart';
import 'package:ibilling/utils/constants.dart';
import 'package:iconly/iconly.dart';

import 'logic/blocs/contract/contract_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    ContractsScreen(
      appTitle: "Contracts",
    ),
    HistoryScreen(
      appTitle: "History",
    ),
    NewContractScreen(
      appTitle: "New",
    ),
    const SavedScreen(
      appTitle: "Saved",
    ),
    const ProfileScreen(
      appTitle: "Profile",
    ),
  ];

  void show(BuildContext context) {}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widgetOptions[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        iconSize: 27,
        onTap: (index) {
          if (index == 2) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) {
                  return AlertDialog(
                    shadowColor: const Color(0xff0C0C0C),
                    backgroundColor: const Color(0xff2A2A2D),
                    content: const Text(
                      'Что вы хотите создать?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          context.read<ContractBloc>().add(SetScreenEvent(
                              screenEnum: ScreenEnum.contractScreen));
                          setState(() {
                            _currentIndex = index;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 46,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xff4E4E4E).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            children: const [
                              Icon(IconlyBold.document),
                              SizedBox(
                                width: 14,
                              ),
                              Text("Contract"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<ContractBloc>().add(SetScreenEvent(
                              screenEnum: ScreenEnum.invoiceScreen));
                          setState(() {
                            _currentIndex = index;
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff4E4E4E).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(4)),
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          height: 46,
                          width: double.infinity,
                          child: Row(
                            children: const [
                              Icon(IconlyBold.document),
                              SizedBox(
                                width: 14,
                              ),
                              Text("Invoice"),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  );
                });
          } else {
            setState(() {
              _currentIndex = index;
            });
          }
        },
        items: const [
          BottomNavigationBarItem(
            label: "Contracts",
            activeIcon: Icon(IconlyBold.document),
            icon: Icon(IconlyLight.document),
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(IconlyBold.time_circle),
            icon: Icon(IconlyLight.time_circle),
            label: "History",
          ),
          BottomNavigationBarItem(
            label: "New",
            activeIcon: Icon(IconlyBold.plus),
            icon: Icon(IconlyLight.plus),
          ),
          BottomNavigationBarItem(
            label: "Saved",
            activeIcon: Icon(IconlyBold.bookmark),
            icon: Icon(IconlyLight.bookmark),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(IconlyBold.profile),
            icon: Icon(IconlyLight.profile),
          ),
        ],
      ),
    );
  }
}
