import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:sttal/core/constants/variables.dart';
import 'package:sttal/data/datasources/auth_local_datasource.dart';
import 'package:sttal/data/models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
      String nrp, String password) async {
    final url = Uri.parse('${Variables.baseUrl}/api/login');
    final response = await http.post(url,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json'
        },
        body: jsonEncode({'nrp': nrp, 'password': password}));

    if (response.statusCode == 200) {
      return Right(AuthResponseModel.fromJson(response.body));
    } else {
      return const Left('failed to login');
    }
  }

  //logout
  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/logout');
    final response = await http.post(url, headers: {
      'Accepted': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${authData?.token}',
    });

    if (response.statusCode == 200) {
      return const Right('Logout Successful');
    } else {
      return const Left('failed to logout');
    }
  }
}
