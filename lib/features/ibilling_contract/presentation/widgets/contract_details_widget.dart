import 'package:flutter/material.dart';
import 'package:ibilling/features/ibilling_contract/data/models/contract.dart';
import 'package:iconly/iconly.dart';

class ContractDetails extends StatelessWidget {
  final Contract? contract;

  const ContractDetails({Key? key, required this.contract}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      height: 148,
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
              const Icon(
                IconlyBold.paper,
                size: 20,
                color: Color.fromRGBO(35, 11, 52, 1),
              ),
              Text(
                "№ ${contract?.number}",
                style: const TextStyle(
                    color: Color.fromRGBO(231, 231, 231, 1),
                    fontWeight: FontWeight.w700),
              ),
              const Spacer(),
              Container(
                height: 27,
                width: contract!.status.contains('paid')
                    ? 60
                    : contract!.status.toLowerCase().contains('in')
                        ? 105
                        : contract!.status.toLowerCase().contains('iq')
                            ? 125
                            : 160,
                decoration: BoxDecoration(
                  color: contract!.status.contains('paid')
                      ? Color(0xff49B7A5).withOpacity(0.15)
                      : contract!.status.toLowerCase().contains('in')
                          ? Color(0xffFDAB2A).withOpacity(0.15)
                          : Color(0xffF85379).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  child: Center(
                    child: Text(
                      contract!.status.contains('paid')
                          ? 'paid'
                          : contract!.status.toLowerCase().contains('in')
                              ? "In proccess"
                              : contract!.status.toLowerCase().contains('iq')
                                  ? "Rejected by iq"
                                  : "Rejected by payme",
                      style: TextStyle(
                          color: contract!.status.contains('paid')
                              ? Color(0xff49B7A5)
                              : contract!.status.toLowerCase().contains('in')
                                  ? Color(0xffFDAB2A)
                                  : Color(0xffFF426D),
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
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
                "Fish:  ",
                style: TextStyle(
                    color: Color.fromRGBO(231, 231, 231, 1),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                contract?.fish ?? '',
                style: const TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Text(
                "Amount  ",
                style: TextStyle(
                    color: Color.fromRGBO(231, 231, 231, 1),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "${contract?.amount.toStringAsFixed(2)} UZS",
                style: const TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                "Last invoice:  ",
                style: TextStyle(
                    color: Color.fromRGBO(231, 231, 231, 1),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                "№ ${contract?.number}",
                style: const TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                "Number of invoices:  ",
                style: TextStyle(
                    color: Color.fromRGBO(231, 231, 231, 1),
                    fontWeight: FontWeight.w500),
              ),
              const Text(
                "5",
                style: TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const Spacer(),
              Text(
                contract!.dateTime,
                style: const TextStyle(
                  color: Color.fromRGBO(153, 153, 153, 1),
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
