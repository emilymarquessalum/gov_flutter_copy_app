part of 'professional_information_bloc.dart';

@immutable
abstract class ProfessionalInformationState {}

class ProfessionalInformationInitial extends ProfessionalInformationState {}

class ProfessionalInformationLoading extends ProfessionalInformationState {}

class ProfessionalInformationFailed extends ProfessionalInformationState {}

class ProfessionalInformationLoaded extends ProfessionalInformationState {
  final UserProfessionalInformation userProfessionalInformation;
  ProfessionalInformationLoaded({required this.userProfessionalInformation});
}