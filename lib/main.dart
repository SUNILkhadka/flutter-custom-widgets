import 'package:custom_components/core/color.dart';
import 'package:custom_components/core/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      onGenerateRoute: Routes.routesSetting,
      initialRoute: Routes.home,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColor.backgroundshadeblue,
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.navbar),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
