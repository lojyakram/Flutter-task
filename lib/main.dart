import 'package:flutter/material.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/core/networking/api_result.dart';
import 'package:my_first_app/wash_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


String? token;

voidmain()async{

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  token = prefs.getString('token');
  await setupGetIt();
  runApp(WashApp());
}

