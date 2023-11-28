import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../requests/backend_response.dart';



class UserInformationSource {
  Future<BackendResponse> getProfessionalUserInformation() async {
    return BackendResponse.fromResponse(Response(
        statusCode: 200,

        data: {
          "message": "success",
          "response": {

            "institutionalBody": "FURG",
            "Uorg": "UNIDADE",
            "id": "100000",
            "role": "Analista de Tec da Informacao"
          },
        }, requestOptions: RequestOptions(path: "")));
  }
}