import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/core/networking/api_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../di/service_locator.dart';
import '../utils/app_constants.dart';
import '../utils/local_storage.dart';


@LazySingleton()
class DioFactory{
  @LazySingleton()
    Dio get _dio => Dio(
     BaseOptions(
         baseUrl: ApiConstants.baseUrl,
         receiveTimeout: Duration( seconds: 30),
         connectTimeout: Duration( seconds: 30),
         sendTimeout: Duration( seconds: 30),
         headers: {
           'Accept':'application/json',
           'content-type':'application/json',

         }
     )
 );

}