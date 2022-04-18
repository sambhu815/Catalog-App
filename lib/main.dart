import 'package:catalog_app/routes/home_detail_page.dart';
import 'package:catalog_app/routes/home_page.dart';
import 'package:catalog_app/routes/login_page.dart';
import 'package:catalog_app/utils/key_constant.dart';
import 'package:catalog_app/widget/themes.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      initialRoute: homePage,
      routes: {
        "/": (context) => const LoginPage(),
        homePage: (context) => const HomePage(),
      },
    );
  }
}
