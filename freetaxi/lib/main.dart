import 'package:flutter/material.dart';
import 'package:freetaxi/helper/binding.dart';
import 'package:freetaxi/screen/auth/onBording.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

SharedPreferences? sharedPreferences;
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('ar', 'AE'),
      debugShowCheckedModeBanner: false,
      title: 'Free Taxi',
      initialBinding: Binding(),
      home: const OnBording(),
      theme: ThemeData(
        fontFamily: 'PortadaARA',
      ),
    );
  }
}
