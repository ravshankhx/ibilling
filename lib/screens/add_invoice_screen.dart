
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/portal_target.dart';

class AddInvoiceScreen extends StatelessWidget {
  const AddInvoiceScreen({
    super.key,
    required this.textStyle,
    required this.inputDecoration,
  });

  final TextStyle textStyle;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Xizmat nomi",
            style: textStyle,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(

            style: textStyle,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Iltimos, mahsulot nomini kiriting. ';
              }
              return null;
            },
            decoration: inputDecoration,
            textInputAction: TextInputAction.next,
            // onFieldSubmitted: (_) {
            //
            //   FocusScope.of(context).requestFocus(
            //
            //     _priceFocus
            //   );
            //
            // },
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Invoice summasi",
            style: textStyle,
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(

            style: textStyle,
            decoration: inputDecoration,
            keyboardType: TextInputType.number,
            // focusNode: _priceFocus,
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            "Status of Invoice",
            style: textStyle,
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
        ],
      ),
    );
  }
}