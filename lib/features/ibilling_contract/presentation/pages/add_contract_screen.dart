import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ibilling/features/ibilling_contract/data/models/contract.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';
import 'package:ibilling/features/ibilling_contract/presentation/widgets/portal_target.dart';
import 'package:iconly/iconly.dart';
import 'package:intl/intl.dart';


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
  List list = ["Paid", "In Process", "Rejected by IQ", "Rejected by Payme"];

  @override
  State<AddContractScreen> createState() => _AddContractScreenState();
}

class _AddContractScreenState extends State<AddContractScreen> {
  bool _isOpen = true;
  String _value = '';
  final _form = GlobalKey<FormState>();

  String id = '';
  String fish = '';
  int number = 11;
  double amount = 120000;
  String address = '';
  int its = 0;
  String dateTime = DateFormat("yyyy.MM.dd").format(DateTime.now());
  String status = "";

  void _submit(BuildContext context) {
    if (_form.currentState!.validate()) {
      _form.currentState!.save();
      if (widget.contract == null) {
        context.read<ContractBloc>().add(AddNewContractEvent(
              fish,
              address,
              its,
              status,
              id,
              number,
              amount,
            ));
      } else {}
    }
    // Navigator.of(context).pushReplacementNamed('/single', arguments: 0);
  }

  List<MyRadioListTile<String>> listOfMyRadioListTile() {
    List<MyRadioListTile<String>> myRadioListTile = [];
    for (int i = 0; i < widget.list.length; i++) {
      myRadioListTile.add(MyRadioListTile<String>(
        value: widget.list[i],
        groupValue: _value,
        title: Text(
          widget.list[i],
          style: const TextStyle(color: Color(0xffE7E7E7)),
        ),
        onChanged: (value) => setState(() {
          _value = value!;

          status = _value;
          _isOpen = !_isOpen;
        }),
      ));
    }
    return myRadioListTile;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContractBloc, ContractState>(
      listener: (context, state) {
        if (state is AddContractScreenState) {
          Navigator.of(context).pushReplacementNamed('/single', arguments: 2);
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
                        ? ""
                        : widget.contract!.its.toString(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please,enter ИНН";
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

                  PortalTarget(
                    visible: true,
                    anchor: const Aligned(
                        follower: Alignment.topCenter,
                        target: Alignment.bottomCenter),
                    portalFollower: AnimatedCrossFade(
                      firstChild: const SizedBox(),
                      secondChild: IntrinsicHeight(
                        child: Container(
                          width: double.infinity,
                          margin: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: listOfMyRadioListTile(),
                          ),
                        ),
                      ),
                      crossFadeState: _isOpen
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 200),
                      reverseDuration: const Duration(milliseconds: 200),
                    ),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isOpen = !_isOpen;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: const Border(
                              top: BorderSide(
                                width: 1.2,
                                style: BorderStyle.solid,
                                color: Color(0xff1F1F1F),
                              ),
                              bottom: BorderSide(
                                width: 1.2,
                                style: BorderStyle.solid,
                                color: Color(0xff1F1F1F),
                              ),
                              right: BorderSide(
                                width: 1.2,
                                style: BorderStyle.solid,
                                color: Color(0xff1F1F1F),
                              ),
                              left: BorderSide(
                                width: 1.2,
                                style: BorderStyle.solid,
                                color: Color(0xff1F1F1F),
                              ),
                            ),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // TextFormField(),

                              Text(
                                _value,
                                style: const TextStyle(
                                    color: Color(0xffF1F1F1), fontSize: 14),
                              ),
                              const Spacer(),

                              const Icon(
                                IconlyBold.arrow_down_circle,
                                color: Color(0xff200E32),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // WPortalTarget(
                  //   // status: status,
                  //   list: [
                  //     "Paid",
                  //     "In Process",
                  //     "Rejected by IQ",
                  //     "Rejected by Payme"
                  //   ],
                  // ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 46,
                    width: MediaQuery.of(context).size.width - 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff008F7F)),
                      onPressed: () => _submit(context),
                      child: Text(
                        "Save Contract",
                        style: TextStyle(
                            color: Color(0xffFDFDFD),
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
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

class MyRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final Widget? title;
  final ValueChanged<T?> onChanged;

  const MyRadioListTile({
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    final title = this.title;
    return InkWell(
      onTap: () => onChanged(value),
      child: Container(
        color: const Color(0xff2A2A2D),
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            if (title != null) title,
            const Spacer(),
            _customRadioButton,
          ],
        ),
      ),
    );
  }

  Widget get _customRadioButton {
    final isSelected = value == groupValue;
    return isSelected
        ? SvgPicture.asset("assets/icons/button_checked.svg")
        : SvgPicture.asset("assets/icons/button_unchecked.svg");
  }
}
