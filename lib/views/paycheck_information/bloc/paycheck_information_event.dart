part of 'paycheck_information_bloc.dart';

@immutable
abstract class PaycheckInformationEvent {}

class LoadPaycheckInformationEvent extends PaycheckInformationEvent {
}

class UpdatePaycheckInformationEvent extends PaycheckInformationEvent {

}


class ChangePaycheckVisibilityEvent extends PaycheckInformationEvent {

}