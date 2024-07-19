import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Color.fromARGB(255, 11, 33, 73),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 0, 0), // Adjust top padding as needed
              child: IconButton(
                icon: Image.asset(
                  'lib/ch14/quest_2/images/뒤로.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/content'); // Navigate to '/content' page
              },
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Image.asset(
                    'lib/ch14/quest_2/images/벡터와 공간.png',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
