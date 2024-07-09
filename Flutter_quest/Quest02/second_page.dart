import 'package:flutter/material.dart';


class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  bool isCat = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)!.settings.arguments != null) {
      isCat = ModalRoute.of(context)!.settings.arguments as bool;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'lib/ch14/quest/images/dog1.jfif',
          width: 30,
          height: 30,
        ), // Dog icon
        title: Text('Second Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  print('isCat on Second Page: $isCat');
                  Navigator.pop(context, true); // Pass true to isCat on FirstPage
                });
              },
              child: Text('Back!'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'lib/ch14/quest/images/dog2.jfif', // Replace with actual dog image path
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}