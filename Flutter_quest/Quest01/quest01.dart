import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Create a Flutter app'), // Centered title
          centerTitle: true,
          backgroundColor: Colors.blue, // Blue app bar
          leading: Icon(Icons.home), // Icon on top left
        ),
        body: Stack(
          children: [
            // Center the button
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {
                  debugPrint('Button was pressed');
                },
                child: Text('Text'),
              ),
            ),
            // Container stack at the bottom center
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  for (var i = 0; i < 5; i++) // Loop for 5 containers
                    Positioned(
                      left: 330, // Adjust horizontal spacing
                      top: 400, // Adjust vertical spacing
                      child: Container(
                        width: 300.0 - 60.0 * i,
                        height: 300.0 - 60.0 * i,
                        color: Colors.primaries[i], // Use default colors
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
[회고]
김동규: 하나도 모륵겠습니다.
강대식: 파트별로 이해는 어느 정도 되었으나 합쳐서 적용하는데 아직 많은 어려움을 느낍니다.
*/
