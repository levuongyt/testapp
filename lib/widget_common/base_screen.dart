import 'package:flutter/material.dart';
class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {super.key, required this.tittleScreen, required this.bodyScreen});
  final String tittleScreen;
  final Widget bodyScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tittleScreen),
      ),
      body: bodyScreen,
    );
  }
}
