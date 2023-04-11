import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/pages/home_page.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/calendar_widget.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/contract_details_widget.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/searchbar.dart';


class ContractsScreen extends StatefulWidget {
  final String appTitle;

  ContractsScreen({Key? key, required this.appTitle}) : super(key: key);

  @override
  State<ContractsScreen> createState() => _ContractsScreenState();
}

class _ContractsScreenState extends State<ContractsScreen> {
  var _init = false;

  @override
  void didChangeDependencies() {
    if (!_init) {
      // context
      //     .read<ContractBloc>()
      //     .add(LoadContractsEvent(DateTime.now().toString()));
      // context
      //     .read<ContractBloc>()
      //     .add(DeleteContractEvent());
    }
    _init = true;
    super.didChangeDependencies();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(51),
        child: AppBar(
          backgroundColor: const Color(0xff000000),
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
            GestureDetector(
              onTap: () {
                showSearch(context: context, delegate: SearchBar());
                // Navigator.of(context).pushNamed('/search');
              },
              child: SvgPicture.asset(
                "assets/icons/search.svg",
              ),
            ),
            const SizedBox(
              width: 24,
            ),
          ],
          elevation: 0,
          title: Text(
            widget.appTitle,
            style: TextStyle(fontFamily: 'Ubuntu'),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.topLeft,
        children: [
          Calendar(),
          BlocBuilder<ContractBloc, ContractState>(
            builder: (context, state) {
              if (state is ContractsLoadingState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ContractsLoadedState) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: state.contracts.isNotEmpty ? 148 : 330,
                  ),
                  child: state.contracts.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: CustomScrollView(
                            slivers: [
                              SliverToBoxAdapter(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      height: 33,
                                      width: 92,
                                      decoration: BoxDecoration(
                                        color: Color(0xff00A795),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Contracts",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      height: 33,
                                      width: 92,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Invoice",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    childCount: state.contracts.length,
                                    (context, index) {
                                  final contract = state.contracts[index];

                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed('/single',
                                              arguments: index);
                                    },
                                    child: ContractDetails(
                                      contract: contract,
                                    ),
                                  );
                                }),
                              ),
                            ],
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/no_contracts_made.svg"),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "No contracts are made",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                ),
                              )
                            ],
                          ),
                        ),
                );
              } else if (state is ContractAddedState) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: state.contracts.isNotEmpty ? 148 : 330,
                  ),
                  child: state.contracts.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(16),
                          child: ListView.builder(
                            itemCount: state.contracts.length,
                            itemBuilder: (context, index) {
                              final contract = state.contracts[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacementNamed(
                                      '/single',
                                      arguments: index);
                                  context.read<ContractBloc>().add(
                                      LoadContractsByFishEvent(
                                          state.contracts[index].fish));
                                },
                                child: ContractDetails(
                                  contract: contract,
                                ),
                              );
                            },
                          ),
                        )
                      : Center(
                          child: Column(
                            children: [
                              SvgPicture.asset(
                                  "assets/icons/no_contracts_made.svg"),
                              const SizedBox(
                                height: 8,
                              ),
                              const Text(
                                "No contracts are made",
                                style: TextStyle(
                                  color: Color(0xffFFFFFF),
                                ),
                              )
                            ],
                          ),
                        ),
                );
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    );
  }
}
