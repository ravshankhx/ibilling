import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/contract_details_widget.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/date_widget.dart';
import 'package:iconly/iconly.dart';

import 'home_page.dart';

class HistoryScreen extends StatefulWidget {
  final String appTitle;

  HistoryScreen({Key? key, required this.appTitle}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  var _init = false;

  @override
  void didChangeDependencies() {
    if (!_init) {
      // context.read<TodoBloc>().add(LoadTodosEvent());
      // context.read<ActiveTodosBloc>().add(LoadActiveTodosEvent());
      // context.read<HistoryContractBloc>().add(LoadHistoryContractEvent());
      // context.read<TodoCubit>().getTodos();
      // context.read<ActiveTodosCubit>().getActiveTodos();
      // context.read<CompletedTodosCubit>().getCompletedTodos();
    }
    _init = true;
    super.didChangeDependencies();
  }

  // void openSearchBar(BuildContext context){
  //
  //   showSearch(context: context, delegate: SearchBar(
  //
  //   ));
  // }

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
          actions: [
            GestureDetector(
              onTap: () {
                PageControllerProvider.of(context)
                    ?.pageController
                    .animateToPage(5,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.linear);
              },
              child: SvgPicture.asset(
                "assets/icons/filter.svg",
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              width: 2,
              height: double.infinity,
              color: Colors.white,
            ),
            const SizedBox(
              width: 20,
            ),
            IconButton(
              onPressed: () {
                // openSearchBar(context)
              },
              icon: const Icon(
                IconlyLight.search,
              ),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
          elevation: 0,
          title: Text(
            widget.appTitle,
          ),
        ),
      ),
      body: Stack(
        children: [
          DateWidget(),
          BlocBuilder<ContractBloc, ContractState>(builder: (context, state) {
            if (state is HistoryContractsLoadedState) {
              return state.contracts.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 90),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: ListView.builder(
                          itemCount: state.contracts.length,
                          itemBuilder: (context, index) {
                            return ContractDetails(
                              contract: state.contracts[index],
                            );
                          },
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 330.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 11, vertical: 7.33),
                                width: 88,
                                height: 88,
                                // alignment: Alignment.center,
                                child: SvgPicture.asset(
                                    "assets/icons/no_contracts_made.svg")),
                            const SizedBox(
                              height: 8,
                            ),
                            const Text(
                              "No contracts are made",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
