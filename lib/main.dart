import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:ibilling/features/ibilling_contract/data/repositories/contract_repo.dart';
import 'package:ibilling/features/ibilling_contract/domain/repository/contract_api_services.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'features/ibilling_contract/presentation/pages/filter_screen.dart';
import 'features/ibilling_contract/presentation/pages/home_page.dart';
import 'package:http/http.dart';
import 'features/ibilling_contract/presentation/pages/new_contract_screen.dart';
import 'features/ibilling_contract/presentation/pages/saved_screen.dart';
import 'features/ibilling_contract/presentation/pages/search_screen.dart';
import 'features/ibilling_contract/presentation/pages/single_contract_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContractRepository(
        contractApiServices: ContractApiServices(client: Client()),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (ctx) => ContractBloc(ctx.read<ContractRepository>())),
        ],
        child: Portal(
          child: MaterialApp(
            routes: {
              '/new-contract': (context) =>
                  NewContractScreen(appTitle: 'NewContract'),
              '/search': (context) => const SearchScreen(
                    appTitle: 'Saved',
                  ),
              '/filter': (context) => const FilterScreen(
                    appTitle: 'Filters',
                  ),
              '/saved': (context) => const SavedScreen(
                    appTitle: 'Saved',
                  ),
              '/single': (context) => SingleContractScreen(
                    appTitle: "Single",
                  ),
            },
            debugShowCheckedModeBanner: false,
            title: 'iBilling',
            theme: ThemeData(
              // fontFamily: 'Ubuntu',
              primarySwatch: Colors.blue,
            ),
            home: const HomePage(),
          ),
        ),
      ),
    );
  }
}
