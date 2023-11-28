




import 'dart:math';

import 'package:dio/dio.dart';
import 'package:gov_flutter_copy_app/requests/backend_response.dart';

class PaycheckSource {

  Future<BackendResponse<Map<String, dynamic>>> getPaycheckInformation() async {
    return BackendResponse.fromResponse(Response(
        statusCode: 200,

        data: {
      "message": "success",
      "response": {
        "date": "2023-11-30",
        "paycheck": {
          "gross": [
            {
              "name": "VENCIMENTO BASICO",
              "value": 900 + Random().nextInt(100)
            },
            {
              "name": "PER CAPITA - SAUDE SUPLEMENTAR",
              "value": 100
            },
          ],
          "discounts": [
            {
              "name": "UNIMED/RS PER CAPITA PATROC",
              "value": 150
            },
            {
              "name": "CONT. PLANO SEGURIDADE SOCIAL",
              "value": 50 + Random().nextInt(50)
            }
          ]
        }
      }
    }, requestOptions: RequestOptions(path: "")));
  }
}