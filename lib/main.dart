import 'package:flutter/material.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/core/networking/api_result.dart';
import 'package:my_first_app/core/networking/dio_factory.dart';
import 'package:my_first_app/wash_app.dart';
import 'package:shared_preferences/shared_preferences.dart';



void main()async{

  WidgetsFlutterBinding.ensureInitialized();




  configureDependencies();

  runApp(WashApp());
}

