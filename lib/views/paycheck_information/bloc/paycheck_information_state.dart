part of 'paycheck_information_bloc.dart';

@immutable
abstract class PaycheckInformationState {}

class PaycheckInformationInitial extends PaycheckInformationState {}


class PaycheckInformationLoading extends PaycheckInformationState {}


class PaycheckInformationLoaded extends PaycheckInformationState {
  final PaycheckRecord paycheckRecord;
  PaycheckInformationLoaded({required this.paycheckRecord});
}

class PaycheckInformationError extends PaycheckInformationState {
  final String message;
  PaycheckInformationError({required this.message});
}

