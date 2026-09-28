import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:my_first_app/core/di/service_locator.dart';
import 'package:my_first_app/core/networking/api_result.dart';
import 'package:my_first_app/core/networking/dio_factory.dart';
import 'package:my_first_app/core/services/notifications_service.dart';
import 'package:my_first_app/wash_app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';


@pragma('vm:entry_point')
Future<void> firebaseBackHandler(RemoteMessage message)async{
  print("title: ${message.notification?.title}");
}

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(firebaseBackHandler);

  NotificationsService notificationsService = NotificationsService();
  await notificationsService.init();

  configureDependencies();

  runApp(WashApp());
}

