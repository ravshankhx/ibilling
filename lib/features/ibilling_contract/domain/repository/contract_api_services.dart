import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibilling/features/ibilling_contract/data/models/contract.dart';
import 'package:intl/intl.dart';


class ContractApiServices {
  final http.Client client;

  ContractApiServices({required this.client});

  List<Contract> _list = [];

  List<Contract> get list {
    return [..._list];
  }

  Future<List<Contract>> historyContract(
      String firstdateTime, String lastdateTime) async {
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
        if ((DateFormat("yyyy-MM-dd")
                    .parse(contract.dateTime)
                    .isBefore(DateFormat("yyyy-MM-dd").parse(lastdateTime)) ||
                DateFormat("yyyy-MM-dd").parse(contract.dateTime) ==
                    DateFormat("yyyy-MM-dd").parse(lastdateTime)) &&
            (DateFormat("yyyy-MM-dd")
                    .parse(contract.dateTime)
                    .isAfter(DateFormat("yyyy-MM-dd").parse(firstdateTime)) ||
                DateFormat("yyyy-MM-dd").parse(contract.dateTime) ==
                    DateFormat("yyyy-MM-dd").parse(firstdateTime))) {
          print("xx${contract}");
          loadedContracts.add(contract);
        }
      }

      _list = loadedContracts;
      return loadedContracts;
    } catch (e) {
      rethrow;
    }
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

  Future<List<Contract>> getContractbyFish(String fisher) async {
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

        if (contract.fish.toLowerCase().contains(fisher)) {
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

  Future<List<Contract>> deleteContract(String id) async {
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

        if (contract.id == id) {
          loadedContracts.remove(contract);
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
    String address,
    int its,
  ) async {
    final url = Uri.parse(
        'https://6423bdcd77e7062b3e37eefe.mockapi.io/api/v1/contract');

    try {
      final response = await client.get(url);
      final response1 = await client.post(
        url,
        body: jsonEncode(
          {
            'id': id,
            'dateTime': DateFormat("yyyy-MM-dd").format(DateTime.now()),
            'address': address,
            'number': number,
            'fish': fish,
            'status': status,
            'amount': amount,
            'its': its,
          },
        ),
      );
      print(response1.body);
      final Map<String,dynamic> dataList = jsonDecode(response1.body);

      final List dataList1 =  jsonDecode(response.body);
      print(dataList.runtimeType);
      final List<Contract> loadedContracts = [];

      // print(dataList);
      for (int i = 0; i < dataList1.length; i++) {
        final data = dataList1[i];
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

        if (contract.dateTime
            .contains(DateFormat("yyyy-MM-dd").format(DateTime.now()))) {
          loadedContracts.add(contract);
        }
      }
      final newProduct = Contract(
        fish: fish,
        id: id,
        number: number,
        amount: amount,
        dateTime: DateFormat("yyyy-MM-dd").format(DateTime.now()),
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
