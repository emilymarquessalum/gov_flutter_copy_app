
import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:gov_flutter_copy_app/requests/backend_response.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data/user_information_interactor.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_id.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_professional_information.dart';

part 'professional_information_event.dart';
part 'professional_information_state.dart';

class ProfessionalInformationBloc extends Bloc<ProfessionalInformationEvent, ProfessionalInformationState> {

  UserInformationInteractor _userInteractor = UserInformationInteractor();

  UserProfessionalInformation? _userProfessionalInformation;

  ProfessionalInformationBloc({bool loadRightAway=false}) : super(ProfessionalInformationInitial()) {

    on<LoadProfessionalInformationEvent>(
            (event, emit) async {

              emit(ProfessionalInformationLoading());

              if (_userProfessionalInformation != null) {
                emit(ProfessionalInformationLoaded(userProfessionalInformation:
                _userProfessionalInformation!));
                return;
              }

              await _fetchUpdateData(emit);
    });


    on<UpdateProfessionalInformationEvent>(
            (event, emit) async {

              emit(ProfessionalInformationLoading());

              await _fetchUpdateData(emit);

    });

    if(loadRightAway) {
      add(LoadProfessionalInformationEvent());
    }
    
  }

  Future<void> _fetchUpdateData(Emitter<ProfessionalInformationState> emit) async {

    BackendResponse response = await _userInteractor.fetchData(UserId(id: "id"));

    _updateInformationFromResponse(response, emit);

  }


  _updateInformationFromResponse(BackendResponse response, emit) {
    if(response.positiveStatus == false) {
      emit(ProfessionalInformationFailed());
      return;
    }

    _userProfessionalInformation = response.data;

    emit(ProfessionalInformationLoaded(userProfessionalInformation:
    response.data
    ));
  }
  
  
}
