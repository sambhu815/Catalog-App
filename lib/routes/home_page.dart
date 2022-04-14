import 'package:catalog_app/widget/my_drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CateLog App"),
      ),
      body: const Center(
        child: Text("Welcome to CateLog Application."),
      ),
      drawer: const MyDrawer(),
    );
  }
}
