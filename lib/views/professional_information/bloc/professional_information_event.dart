part of 'professional_information_bloc.dart';

@immutable
abstract class ProfessionalInformationEvent {}

class LoadProfessionalInformationEvent extends ProfessionalInformationEvent {}
class UpdateProfessionalInformationEvent extends ProfessionalInformationEvent {}