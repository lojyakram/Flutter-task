import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/core/networking/api_constants.dart';
import 'package:my_first_app/core/networking/api_error_handler.dart';
import 'package:my_first_app/core/networking/api_result.dart';
import 'package:my_first_app/core/utils/app_constants.dart';
import 'package:my_first_app/core/utils/local_storage.dart';
import 'package:my_first_app/feature/register/data/models/register_request_model.dart';


@LazySingleton()
class RegisterRepo{

  final Dio _dio;
  RegisterRepo(this._dio);

  Future<ApiResult> register(RegisterRequestModel registerModel)async{
    try{
      final response = await _dio.post(ApiConstants.register,
        data: registerModel.toJson()
      );
      saveToken(response.data['data']['token']);
      return Success(response.data['message']);
    }on DioException catch(e){
      return Error(ApiErrorHandler.handle(e).message);
    }
  }

  saveToken(String token){
    getIt<LocalStorage>().setString(key: AppConstants.token, value: token);
  }
}