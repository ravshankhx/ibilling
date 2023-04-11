import 'package:bloc/bloc.dart';
import 'package:ibilling/core/utils/constants.dart';
import 'package:ibilling/features/ibilling_contract/data/repositories/contract_repo.dart';
import 'package:ibilling/features/ibilling_contract/presentation/bloc/contract/bloc.dart';


class ContractBloc extends Bloc<ContractEvent, ContractState> {
  final ContractRepository contractRepository;

  ContractBloc(this.contractRepository) : super(ContractInitial()) {
    on<LoadContractsEvent>(_getContracts);
    on<DeleteContractEvent>(_deleteContract);
    on<LoadHistoryContractsEvent>(_historyContracts);
    on<LoadContractsByFishEvent>(_getContractsByFish);
    on<SetScreenEvent>(_setScreen);
    on<AddNewContractEvent>(_addContract);
  }

  Future<void> _getContracts(
      LoadContractsEvent event, Emitter<ContractState> emit) async {
    emit(ContractsLoadingState());
    final contracts =
        await contractRepository.getContract(event.dateTime.toString());
    emit(ContractsLoadedState(contracts));
  }

  Future<void> _historyContracts(
      LoadHistoryContractsEvent event, Emitter<ContractState> emit) async {
    emit(ContractsLoadingState());
    final contracts = await contractRepository.historyContract(
        event.firstdateTime.toString(), event.lastdateTime.toString());
    emit(HistoryContractsLoadedState(contracts));
  }

  Future<void> _getContractsByFish(
      LoadContractsByFishEvent event, Emitter<ContractState> emit) async {
    emit(ContractsLoadingState());
    final contracts = await contractRepository.getContractByFish(event.fish);
    emit(ContractsByFishLoadedState(contracts));
  }

  Future<void> _addContract(
      AddNewContractEvent event, Emitter<ContractState> emit) async {
    final contracts = await contractRepository.addContract(
      event.fish,
      event.id,
      event.number,
      event.amount,
      event.status,
      event.address,
      event.its,
    );

    emit(AddContractScreenState());
    emit(ContractsLoadedState(contracts));
  }

  Future<void> _deleteContract(
      DeleteContractEvent event, Emitter<ContractState> emit) async {
    emit(ContractsLoadingState());
    final contracts = await contractRepository.deleteContract(event.id);
    emit(DeleteContractState(contracts));
  }

  void _setScreen(SetScreenEvent event, Emitter<ContractState> emit) {
    if (event.screenEnum == ScreenEnum.contractScreen) {
      emit(AddContractScreenState());
    } else {
      emit(AddInvoiceScreenState());
    }
  }
}
