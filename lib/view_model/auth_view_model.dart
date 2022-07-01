import 'package:flutter/material.dart';
import 'package:laundris/models/base_response.dart';
import 'package:laundris/network/api_response.dart';
import 'package:laundris/repository/auth_repository.dart';

class AuthViewModel extends ChangeNotifier {
  final _repository = AuthRepository();

  ApiResponse<NoDataResponse> checkTokenResponse = ApiResponse.loading();

  void _setCheckToken(ApiResponse<NoDataResponse> response) {
    checkTokenResponse = response;
    notifyListeners();
  }

  Future<void> fetchCheckToken() async {
    _setCheckToken(ApiResponse.loading());
    _repository
        .checkToken()
        .then((value) => _setCheckToken(ApiResponse.completed(value)))
        .onError((error, stackTrace) => _setCheckToken(ApiResponse.error(error.toString())));
  }
}
