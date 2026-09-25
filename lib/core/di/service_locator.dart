import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:my_first_app/core/di/service_locator.config.dart';

GetIt getIt = GetIt.instance;

@InjectableInit(
 initializerName: 'init', // default
 preferRelativeImports: true, // default
 asExtension: true, // default
)
void configureDependencies() => getIt.init();

//Future<void> setupGetIt() async{

//  LocalStorage localStorage = LocalStorage();
//  await localStorage.init();

//  Dio dio = DioFactory.getDio();

//  getIt.registerLazySingleton<LocalStorage>(()=> localStorage);
//  getIt.registerLazySingleton<DioFactory>(()=>DioFactory.getDio());
//  getIt.registerLazySingleton<RegisterRepo>(()=>RegisterRepo(getIt()));
//  getIt.registerLazySingleton<RegisterCubit>(()=>RegisterCubit(getIt()));
//}