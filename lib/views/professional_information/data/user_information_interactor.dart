


import 'package:gov_flutter_copy_app/requests/backend_response.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data/user_information_source.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_professional_information.dart';

import '../data_classes/user_id.dart';

class UserInformationInteractor {


  UserInformationSource _informationSource = UserInformationSource();



  Future<BackendResponse> fetchData(UserId userId) async {
    await Future.delayed(const Duration(seconds: 2));


    BackendResponse response = await _informationSource
        .getProfessionalUserInformation();

    if(response.positiveStatus) {
      return await translateSuccessData(response);
    }

    return response;
  }


  Future<BackendResponse> translateSuccessData(BackendResponse backendResponse) async {


    return BackendResponse(backendResponse.statusCode,
        backendResponse.message, UserProfessionalInformation.fromMap(backendResponse.data));

  }


}