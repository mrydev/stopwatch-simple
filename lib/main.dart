import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kronometre/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kronometre',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            centerTitle: true,
            systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.dark),
            elevation: 15,
            shadowColor: Colors.white,
            shape: const RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30))),
            backgroundColor: Colors.grey[300]),
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
