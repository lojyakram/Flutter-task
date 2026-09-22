import 'package:flutter/material.dart';
import 'package:my_first_app/core/routes/app_routes.dart';
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
  getIntialPage(){
    if(token!=null){
      return AppRoutes.homeScreen;
    } else{
      return AppRoutes.registerScreen;

  }
}
