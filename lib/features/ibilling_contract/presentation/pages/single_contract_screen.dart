import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/contract_details_widget.dart';
import 'package:iconly/iconly.dart';

class SingleContractScreen extends StatelessWidget {
  final String appTitle;

  const SingleContractScreen({
    Key? key,
    required this.appTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final index = ModalRoute.of(context)!.settings.arguments as int;

    return BlocBuilder<ContractBloc, ContractState>(builder: (context, state) {
      if (state is ContractsLoadedState) {
        return Scaffold(
          backgroundColor: const Color(0xff000000),
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 51),
            child: AppBar(
              backgroundColor: const Color(0xff141416),
              leading: Icon(
                IconlyBold.paper,
                color: Color(0xff008F7F),
              ),
              title: Text("№ ${state.contracts[index].number}"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(IconlyLight.bookmark),
                ),
                SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.all(16),
                    height: 310,
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
                            Text(
                              "Fisher’s full name: ",
                              style: const TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${state.contracts[index].fish}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Status of the contract: ",
                              style: const TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${state.contracts[index].status}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Text(
                              "Amount: ",
                              style: const TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "${state.contracts[index].amount}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Last invoice: ",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${state.contracts[index].number}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Address of the organization: ",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${state.contracts[index].address}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "ITN/IEC of the organization:  ",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${state.contracts[index].its}",
                              style: const TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Created at:   ",
                              style: TextStyle(
                                  color: Color.fromRGBO(231, 231, 231, 1),
                                  fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${state.contracts[index].dateTime}",
                              style: TextStyle(
                                color: Color.fromRGBO(153, 153, 153, 1),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 40,
                          width: (MediaQuery.of(context).size.width - 48) / 2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color(0xffFF426D).withOpacity(0.23)),
                              onPressed: () {
                                context
                                    .read<ContractBloc>()
                                    .add(DeleteContractEvent(index.toString()));
                                print(state.contracts.length);

                                Navigator.of(context).pushReplacementNamed('/');
                              },
                              child: Text(
                                "Delete contract",
                                style: TextStyle(
                                  color: Color(0xffFF426D),
                                  letterSpacing: -0.17,
                                ),
                              ))),
                      SizedBox(
                        width: 16,
                      ),
                      SizedBox(
                        height: 40,
                        width: (MediaQuery.of(context).size.width - 48) / 2,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff008F7F)),
                            onPressed: () {
                              context
                                  .read<ContractBloc>()
                                  .add(AddNewContractEvent(
                                    state.contracts[index].fish,
                                    state.contracts[index].address,
                                    state.contracts[index].its,
                                    state.contracts[index].status,
                                    state.contracts[index].id,
                                    state.contracts[index].number,
                                    state.contracts[index].amount,
                                  ));

                              Navigator.of(context).pushReplacementNamed('/');
                            },
                            child: Text(
                              "Create contract",
                              style: TextStyle(
                                color: Color(0xffFDFDFD),
                                letterSpacing: -0.17,
                              ),
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    margin: EdgeInsets.all(16),
                    height: 44,
                    width: 250,
                    child: Text(
                      "Other contracts with ${state.contracts[index].fish}",
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: state.contracts.isNotEmpty ? 470 : 330,
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
              )
            ],
          ),
        );
      }
      return Container(
        child: CircularProgressIndicator(),
      );
    });
  }
}
