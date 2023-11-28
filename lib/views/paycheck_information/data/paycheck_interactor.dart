


import 'package:gov_flutter_copy_app/requests/backend_response.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data/paycheck_source.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_information.dart';
import 'package:gov_flutter_copy_app/views/paycheck_information/data_classes/paycheck_relatory.dart';
import 'package:gov_flutter_copy_app/views/professional_information/data_classes/user_id.dart';


class PaycheckRecordInteractor {


  final PaycheckSource _paycheckSource = PaycheckSource();



  Future<BackendResponse> fetchData(UserId id) async {

    await Future.delayed(Duration(seconds: 2));

    BackendResponse response = await _paycheckSource.getPaycheckInformation();



    if (response.positiveStatus) {
      return await translateSuccessData(response);
    }

    return response;
  }


  Future<BackendResponse<PaycheckRecord>>
  translateSuccessData(BackendResponse backendResponse) async {

    PaycheckRecord paycheckRecord = PaycheckRecord.fromJson(
        backendResponse.data);

    return BackendResponse(backendResponse.statusCode,
        backendResponse.message, paycheckRecord);
  }

}