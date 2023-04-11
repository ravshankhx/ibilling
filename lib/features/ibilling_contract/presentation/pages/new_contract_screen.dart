import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';

import 'add_contract_screen.dart';
import 'add_invoice_screen.dart';

class NewContractScreen extends StatelessWidget {
  final String appTitle;

   NewContractScreen({Key? key, required this.appTitle}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = const TextStyle(
      color: Color(0xffF1F1F1),
    );
    final InputDecoration inputDecoration = InputDecoration(
      labelStyle: TextStyle(color: Colors.white),
      focusColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          width: 1.2,
          style: BorderStyle.solid,
          color: Color(0xff1F1F1F),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4.0),
        borderSide: const BorderSide(
          color: Color(0xff1F1F1F),
          style: BorderStyle.solid,
          width: 1.2,
        ),
      ),
    );
    return BlocBuilder<ContractBloc, ContractState>(builder: (context, state) {
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
            title: Text((state is AddContractScreenState)
                ? "New Contract"
                : "New Invoice"),
          ),
        ),
        body: (state is AddContractScreenState)
            ? AddContractScreen(textStyle: textStyle, inputDecoration: inputDecoration)
            : AddInvoiceScreen(textStyle: textStyle, inputDecoration: inputDecoration),
      );
    });
  }
}

