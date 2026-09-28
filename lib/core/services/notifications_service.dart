import 'package:firebase_messaging/firebase_messaging.dart';


class NotificationsService{
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

requestPermission()async{
 await firebaseMessaging.requestPermission();
}

init()async{
  await requestPermission();
  await getDeviceToken();
  FirebaseMessaging.onMessage.listen((message){
    print(message.notification?.title);
  });

}

getDeviceToken()async{
  final String? token = await firebaseMessaging.getToken();
  print("Device token: ${token}");
  return token;
}
}