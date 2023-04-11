
import 'package:ibilling/features/ibilling_contract/data/models/contract.dart';

class ContractState {
}

class ContractInitial extends ContractState {
}

class ContractsLoadingState extends ContractState {}

class AddContractScreenState extends ContractState {}

class AddInvoiceScreenState extends ContractState {}

class ContractsLoadedState extends ContractState {
  final List<Contract> contracts;

  ContractsLoadedState(this.contracts);
}
class DeleteContractState extends ContractState {
  final List<Contract> contracts;

  DeleteContractState(this.contracts);
}
class HistoryContractsLoadedState extends ContractState {
  final List<Contract> contracts;

  HistoryContractsLoadedState(this.contracts);
}
class ContractsByFishLoadedState extends ContractState {
  final List<Contract> contracts;

  ContractsByFishLoadedState(this.contracts);
}

class ContractAddedState extends ContractState {
  final List<Contract> contracts;

  ContractAddedState(this.contracts);
}

class ContractDeletedState extends ContractState {
}
