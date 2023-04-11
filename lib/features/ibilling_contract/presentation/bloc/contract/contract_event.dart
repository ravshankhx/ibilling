import 'package:flutter/cupertino.dart';
import 'package:ibilling/core/utils/constants.dart';

@immutable
abstract class ContractEvent {}

class LoadingContractsEvent extends ContractEvent {}

class LoadContractsEvent extends ContractEvent {
  final String dateTime;

  LoadContractsEvent(this.dateTime);
}

class DeleteContractEvent extends ContractEvent {
  final String id;

  DeleteContractEvent(this.id);
}

class LoadHistoryContractsEvent extends ContractEvent {
  final String firstdateTime;
  final String lastdateTime;

  LoadHistoryContractsEvent(this.firstdateTime, this.lastdateTime);
}

class LoadContractsByFishEvent extends ContractEvent {
  final String fish;

  LoadContractsByFishEvent(this.fish);
}

class SetScreenEvent extends ContractEvent {
  final ScreenEnum screenEnum;

  SetScreenEvent({required this.screenEnum});
}

class AddNewContractEvent extends ContractEvent {
  final String fish;
  final String id;
  final int number;
  final double amount;
  final String status;
  final String address;
  final int its;

  AddNewContractEvent(this.fish, this.address, this.its, this.status, this.id,
      this.number, this.amount);
}

class DeleteTodoEvent extends ContractEvent {
  final String id;

  DeleteTodoEvent(this.id);
}
