import 'package:dio/dio.dart';
import 'package:my_first_app/core/networking/api_constants.dart';
import 'package:my_first_app/core/networking/api_error_handler.dart';
import 'package:my_first_app/core/networking/api_result.dart';
import 'package:my_first_app/feature/register/data/models/register_request_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterRepo{
  final Dio _dio;
  RegisterRepo(this._dio);

  Future<ApiResult> register(RegisterRequestModel registerModel)async{
    try{
      final response = await _dio.post(ApiConstants.register,
        data: registerModel.toJson()
      );
      saveToken(response.data['data']['token'])
      return Success(response.data['message']);
    }on DioException catch(e){
      return Error(ApiErrorHandler.handle(e).message);
    }
  }

  saveToken(String token)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token);
  }
}