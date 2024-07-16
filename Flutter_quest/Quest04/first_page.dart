import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_markdown/flutter_markdown.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String prediction  = "";   // 분류 결과
  String probability = "";   // 확률
  String result = "";
  String server_url = 'https://f0cf-121-143-147-92.ngrok-free.app/sample';   // 서버 주소
  Future<void> fetchData() async {
    try {
      final response = await http.get(
        Uri.parse(server_url + "/sample"),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '69420',
        },
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          prediction  = data['Prediction'];   
          probability = data['Probability'];
        });
      } else {
        setState(() {
          result = "Failed to fetch data. Status Code: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        result = "Error: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바 타이틀, 해파리 아이콘
        leading: Image.asset(
          'lib/jellyfish/앱바해파리.jfif',
          width: 30,
          height: 30,
        ),
        title: Text('Jellyfish Classifier'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Image.asset(
                'lib/jellyfish/jellyfish.jpg',
                width: 300,
                height: 300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: fetchData,
                  child: Text("분류하기")
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Markdown(
                    data: prediction)
                  ),
                ElevatedButton(
                  onPressed: fetchData,
                  child: Text("확률")
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Markdown(
                    data: probability)
                  )
              ]
            )
          ]
        )
      )
    );
  }
}