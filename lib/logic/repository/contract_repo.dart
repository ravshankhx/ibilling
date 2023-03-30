import '../../services/contract_api_services.dart';
import '../models/contract.dart';

class ContractRepository {
  final ContractApiServices contractApiServices;

  ContractRepository({required this.contractApiServices});

  Future<List<Contract>> getContract(String dateTime) async {
    return await contractApiServices.getContract(dateTime);
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
    return await contractApiServices.addContract(
      fish,
      id,
      number,
      amount,
      status,
      dateTime,
      address,
      its,
    );
  }
}
