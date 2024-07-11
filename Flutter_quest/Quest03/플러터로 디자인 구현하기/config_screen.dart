import 'package:flutter/material.dart';


class ConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration Page'),
      ),
      body: Center(
        child: Text('This is the configuration page.'),
      ),
    );
  }
}