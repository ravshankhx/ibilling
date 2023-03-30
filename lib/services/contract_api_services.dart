import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../logic/models/contract.dart';

class ContractApiServices {
  final http.Client client;

  ContractApiServices({required this.client});

  List<Contract> _list = [];

  List<Contract> get list {
    return [..._list];
  }

  Future<List<Contract>> getContract(String dateTime) async {
    final url = Uri.parse(
        'https://6423bdcd77e7062b3e37eefe.mockapi.io/api/v1/contract');
    try {
      final response = await client.get(url);
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }
      print(response.body);
      final List dataList = jsonDecode(response.body);

      final List<Contract> loadedContracts = [];

      // print(dataList);
      for (int i = 0; i < dataList.length; i++) {
        final data = dataList[i];
        // print(data);

        final contract = Contract(
            id: data['id'],
            fish: data['fish'],
            number: data['number'],
            address: data['address'],
            amount: double.parse(data['amount'].toString()),
            dateTime: data['dateTime'],
            status: data['status'],
            its: data['its']);

        if (contract.dateTime == dateTime) {
          loadedContracts.add(contract);
        }
      }

      _list = loadedContracts;
      print("aa${_list}");
      return loadedContracts;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Contract>> addContract(
    String fish,
    String id,
    int number,
    double amount,
    String status,
    String dateTime,
    String address,
    int its,
  ) async {
    final url = Uri.parse(
        'https://6423bdcd77e7062b3e37eefe.mockapi.io/api/v1/contract');

    final List<Contract> loadedContracts = [];
    try {
      final response = await client.post(
        url,
        body: jsonEncode(
          {
            'id': '14',
            'dateTime': dateTime,
            'address': address,
            'number': number,
            'fish': fish,
            'status': status,
            'amount': amount,
            'its': its,
          },
        ),
      );
      print("wrewg${response.body}");

      final newProduct = Contract(
        fish: fish,
        id: id,
        number: number,
        amount: amount,
        dateTime: dateTime,
        status: status,
        its: its,
        address: address,
      );
      loadedContracts.add(newProduct);
      print('aassss ${newProduct.fish}');
      return loadedContracts;
    } catch (error) {
      rethrow;
    }
  }
}
