import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:my_first_app/core/networking/dio_factory.dart';
import 'package:my_first_app/feature/register/data/repo/register_repo.dart';

GetIt getIt = GetIt.instance;

 Future<void> setupGetIt() async{
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<DioFactory>(()=>DioFactory.getDio());
  getIt.registerLazySingleton<RegisterRepo>(()=>RegisterRepo(getIt()));
}