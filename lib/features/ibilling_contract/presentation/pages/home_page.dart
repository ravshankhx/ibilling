import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/core/utils/constants.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/pages/filter_screen.dart';
import 'package:ibilling/features/ibilling_contract/presentation/pages/history_screen.dart';
import 'package:ibilling/features/ibilling_contract/presentation/pages/profile_screen.dart';
import 'package:ibilling/features/ibilling_contract/presentation/pages/saved_screen.dart';
import 'package:iconly/iconly.dart';

import 'contracts_screen.dart';
import 'new_contract_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int previous = 0;
  static final List<Widget> _widgetOptions = <Widget>[];
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  void show(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return PageControllerProvider(
      pageController: pageController,
      child: Scaffold(
        body: PageView(
          controller: pageController,
          children: [
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
            FilterScreen(
              appTitle: 'Filter',
              previous: previous,
            )
          ],
        ),
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

                            previous = index;
                            setState(() {
                              _currentIndex = index;
                            });
                            Navigator.of(context).pop();
                            pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear);
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

                            previous = index;
                            setState(() {
                              _currentIndex = index;
                            });
                            Navigator.of(context).pop();
                            pageController.animateToPage(index,
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.linear);
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
              previous = index;
              setState(() {
                _currentIndex = index;
              });
              pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear);
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
      ),
    );
  }
}

class PageControllerProvider extends InheritedWidget {
  final PageController pageController;

  const PageControllerProvider(
      {super.key, required super.child, required this.pageController});

  static PageControllerProvider? of(BuildContext context) {
    return (context
        .dependOnInheritedWidgetOfExactType<PageControllerProvider>());
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
