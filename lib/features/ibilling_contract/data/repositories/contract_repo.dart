

import 'package:ibilling/features/ibilling_contract/data/models/contract.dart';
import 'package:ibilling/features/ibilling_contract/domain/repository/contract_api_services.dart';

class ContractRepository {
  final ContractApiServices contractApiServices;

  ContractRepository({required this.contractApiServices});

  Future<List<Contract>> historyContract(String firstdateTime,String lastdateTime) async {

    return await contractApiServices.historyContract(firstdateTime,lastdateTime);
  }
  Future<List<Contract>> getContract(String dateTime) async {

    return await contractApiServices.getContract(dateTime);
  }  Future<List<Contract>> deleteContract(String id) async {

    return await contractApiServices.deleteContract(id);
  }
  Future<List<Contract>> getContractByFish(String fish) async {

    return await contractApiServices.getContractbyFish(fish);
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
    return await contractApiServices.addContract(
      fish,
      id,
      number,
      amount,
      status,
      address,
      its,
    );
  }
}
