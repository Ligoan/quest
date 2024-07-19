import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart'; // Import for in-app webview

class ContentPlayScreen extends StatefulWidget {
  final String videoUrl = 'https://ko.khanacademy.org/math/linear-algebra/vectors-and-spaces/vectors/v/vector-introduction-linear-algebra'; // Replace with your video URL

  @override
  _ContentPlayScreenState createState() => _ContentPlayScreenState();
}

class _ContentPlayScreenState extends State<ContentPlayScreen> {
  InAppWebViewController? webViewController;

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
      body: Stack(
        children: [
          // Black container for video (more than half of the body)
          Container(
            color: Colors.black,
            height: MediaQuery.of(context).size.height * 0.7, // Adjust height as needed (more than half)
            child: InAppWebView(
              initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(widget.videoUrl))),
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
          ),
          // Play button positioned on top of the black container
        ],
      ),
    );
  }

  void _playVideo() async {
    if (webViewController != null) {
      await webViewController!.evaluateJavascript(source: 'document.querySelector("video").play();');
    } else {
      // Handle the case where the web view controller is not yet available
      print('Web view controller not available for playing video');
    }
  }
}
