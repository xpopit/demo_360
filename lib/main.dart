import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shoplive_mvp/models/user.dart';
import 'package:shoplive_mvp/page/home_page.dart';
import 'package:shoplive_mvp/page/login_page.dart';

import 'models/event_bus.dart';
import 'models/fb_accounts_data.dart';
import 'models/user.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<User>(create: (_) => User()),
          ChangeNotifierProvider<AccountsData>(create: (_) => AccountsData()),
          ChangeNotifierProvider<EventBus>(create: (_) => EventBus())
        ],
        child: MaterialApp(
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: <String, WidgetBuilder>{
            '/': (context) => LoginPage(),
            '/Home': (context) => HomePage(),
          },
        ));
  }
}
