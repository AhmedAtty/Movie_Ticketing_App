
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:move_ticketing_app/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:move_ticketing_app/views/home_views/home_view.dart';




void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(GetMaterialApp(
    theme: getThemeData(),
    debugShowCheckedModeBanner: false,
    home:  const HomeView(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

