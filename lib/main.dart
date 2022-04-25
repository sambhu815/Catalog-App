import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/routes/cart_page.dart';
import 'package:catalog_app/routes/home_detail_page.dart';
import 'package:catalog_app/routes/home_page.dart';
import 'package:catalog_app/routes/login_page.dart';
import 'package:catalog_app/utils/key_constant.dart';
import 'package:catalog_app/widget/themes.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(VxState(store: MyStore(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(routes: {
        "/": (_, __) => const MaterialPage(child: LoginPage()),
        homePage: (_, __) => const MaterialPage(child: HomePage()),
        homeDetailPage: (uri, __) {
          final catalog = (VxState.store as MyStore)
              .catalog
              .getById(int.parse(uri.queryParameters["id"]!));
          return MaterialPage(child: HomeDetailPage(catalog: catalog));
        },
        cartPage: (_, __) => const MaterialPage(child: CartPage()),
      })
      /*initialRoute: loginPage,
      routes: {
        "/": (context) => const LoginPage(),
        homePage: (context) => const HomePage(),
        cartPage: (context) => const CartPage(),
      }*/
      ,
    );
  }
}
