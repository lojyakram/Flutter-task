import 'package:flutter/material.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/core/routes/app_routes.dart';
import 'package:my_first_app/core/utils/app_constants.dart';
import 'package:my_first_app/core/utils/local_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/routes/app_router.dart';
import 'main.dart';


class WashApp extends StatelessWidget {
  const WashApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:getIntialPage(),
      onGenerateRoute:AppRouter.onGenerateRoutes,
    );
  }
  getIntialPage() {
   String? token = getIt<LocalStorage>().getString(AppConstants.token);
    if (token != null) {
      return AppRoutes.homeScreen;
    } else {
      return AppRoutes.registerScreen;
    }
  }
}
