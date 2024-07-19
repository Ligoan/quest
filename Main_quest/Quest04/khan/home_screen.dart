import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                child: Center(
                  child: Text(
                    'Khan Academy',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ),
              IconButton(
                icon: Image.asset(
                  'lib/ch14/quest_2/images/설정.png',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/config');
                },
              ),
              SizedBox(width: 16), // Adjust the width as needed
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.grey.withOpacity(0.5), // Semi-transparent gray background
            height: 20, // Adjust the height as needed (1cm in this case)
          ),
          Container(
            color: Colors.white,
            child: Center(
              child: Image.asset(
                'lib/ch14/quest_2/images/홈_비로그인_메인.png',
                width: 400, // Adjust width as needed
                height: 400, // Adjust height as needed
                fit:BoxFit.fill
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 20),
                Text(
                  '배울 준비가 되었나요?',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/learn');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.blue.withOpacity(0.5); // Adjust opacity as needed
                      }
                      return Colors.blue; // Default color
                    }),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      '학습하러 가기',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
