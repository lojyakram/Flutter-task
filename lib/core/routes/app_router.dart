import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/feature/home/presentation/ui/home_screen.dart';
import 'package:my_first_app/feature/register/data/repo/register_repo.dart';
import 'package:my_first_app/feature/register/presentation/ui/register_screen.dart';
import '../../feature/register/presentation/cubit/register_cubit.dart';
import 'app_routes.dart';

class AppRouter{
  static Route? onGenerateRoutes(RouteSettings settings){
    switch(settings.name){
      case AppRoutes.registerScreen:

        return MaterialPageRoute(builder: (_)=>
            BlocProvider(
            create: (context) => RegisterCubit(getIt()),
            child: RegisterScreen(),
         ),
        );

      case AppRoutes.homeScreen:
        return MaterialPageRoute(builder: (_)=>HomeScreen());
    }
  }
}