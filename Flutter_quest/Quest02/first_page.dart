import 'package:flutter/material.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}


class _FirstPageState extends State<FirstPage> {
  bool isCat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset(
          'lib/ch14/quest/images/cat1.jfif',
          width: 30,
          height: 30,
        ),  // Cat icon
        title: Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                print('isCat on First Page: $isCat');
                isCat = false;
                final result = await Navigator.pushNamed(context, '/second', arguments: isCat);
                if (result != null && result is bool) {
                  setState(() {
                    isCat = result;
                    print('isCat on First Page after return: $isCat');
                  });
                }
              },
              child: Text('Next!'),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'lib/ch14/quest/images/cat2.jfif',
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