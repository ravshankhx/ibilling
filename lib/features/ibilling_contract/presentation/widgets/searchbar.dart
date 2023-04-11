import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';



class SearchBar extends SearchDelegate {

  @override
  TextStyle? get searchFieldStyle => const TextStyle(color: Colors.white);

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        elevation: 0,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.cancel_outlined),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<ContractBloc,ContractState>(builder: (context,state){
      if (query.isNotEmpty ) {

        context.read<ContractBloc>().add(LoadContractsByFishEvent(query));

        print(state);
        return Scaffold(
            backgroundColor: Colors.red,
            body: 1==1
                ? const Center(
              child: Text("Can't find contracts"),
            )
                : Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      // ContractDetails(
                    //   contract: contracts[index],
                    );
                  },
                ),
              ),
            ));
      }
      return Container();

      // return  Scaffold(
      //   backgroundColor: Colors.white,
      //   body: Text("caca"),
      // );
    });

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff000000),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 230.0),
            child: Center(
              child: SvgPicture.asset(
                  "assets/icons/no_contracts_made.svg"),
            ),
          ),
        ],
      ),
    );
  }
}
