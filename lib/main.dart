import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
     String _message = '';
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  
_register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }
  Widget build(BuildContext context) {
    return MaterialApp(
     home:Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.white,  
        title: Text('Notification',style:TextStyle(color:Colors.black)),
      ),
      body: Center(child: Text('No notification yet')),
     
    ),);
  }

}
