import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../logic/blocs/contract/contract_bloc.dart';
import '../logic/models/contract.dart';
import '../widgets/portal_target.dart';

class AddContractScreen extends StatefulWidget {
  AddContractScreen({
    super.key,
    required this.textStyle,
    required this.inputDecoration,
    this.contract,
  });

  final TextStyle textStyle;
  final InputDecoration inputDecoration;

  final Contract? contract;

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  final _form = GlobalKey<FormState>();

  String id = '';
  String fish = '';
  int number = 11;
  double amount = 12;

  String address = '';

  int its = 0;
  String dateTime =DateFormat("yyyy.MM.dd").format(DateTime.now());
  String status = "";

  void _submit(BuildContext context) {

    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      if (widget.contract == null) {
        // BlocProvider.of<TodoCubit>(context).addToDo(_title);
        context.read<ContractBloc>().add(AddNewContractEvent(
              fish,
              dateTime,
              address,
              its,
              status,
              id,
              number,
              amount,
            ));

      } else {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc, ContractState>(
      listener: (context, state) {
        if (state is AddContractScreenState) {
          Navigator.of(context).popAndPushNamed('/');
        }
      },
      builder: (context, state) {
        if (state is AddContractScreenState) {
          return Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Лицо", style: widget.textStyle),
                  const SizedBox(
                    height: 6,
                  ),
                  WPortalTarget(list: [
                    'Физическое',
                    'Юридическое',
                  ]),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Fisher's full name", style: widget.textStyle),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(
                    style: widget.textStyle,
                    initialValue:
                        widget.contract == null ? "" : widget.contract!.fish,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please,enter fish";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      fish = value!;
                    },
                    decoration: widget.inputDecoration,
                    keyboardType: TextInputType.number,
                    // focusNode: _priceFocus,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Address of organization",
                    style: widget.textStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(

                    style: widget.textStyle,
                    initialValue:
                        widget.contract == null ? "" : widget.contract!.address,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please,enter address";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address = value!;
                    },

                    decoration: widget.inputDecoration,
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    // focusNode: _priceFocus,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "ИНН",
                    style: widget.textStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  TextFormField(

                    style: widget.textStyle,
                    initialValue: widget.contract == null
                        ? "1"
                        : widget.contract!.its.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please,enter address";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      address = value!;
                    },
                    decoration: widget.inputDecoration,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  TextFormField(

                    style: widget.textStyle,
                    initialValue:
                        widget.contract == null ? "" : widget.contract!.status,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please,enter status";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      status = value!;
                    },
                    decoration: widget.inputDecoration,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Status of Contract",
                    style: widget.textStyle,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  WPortalTarget(
                    list: [
                      "Paid",
                      "In Process",
                      "Rejected by IQ",
                      "Rejected by Payme"
                    ],
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  ElevatedButton(
                    onPressed: () => _submit(context),
                    child: Text(
                      "Save Contract",
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
