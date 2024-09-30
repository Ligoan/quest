import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../helper/global.dart';
import '../helper/pref.dart';
import '../models/home_type.dart';
import '../widgets/home_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    Pref.showOnBoarding = false;
  }

  @override
  Widget build(BuildContext context) {
    // initializing device size
    mq = MediaQuery.sizeOf(context);

    // sample api call
    // APIs.getAnswer('hi');

    return Scaffold(
      // app bar
      appBar: AppBar(
        title: const Text(
          appName,
        ),

        // actions
        actions: [
          IconButton(
            padding: const EdgeInsets.only(
              right: 10,
            ),
            onPressed: () {},
            icon: const Icon(
              Icons.brightness_4_rounded,
              color: Colors.blue,
              size: 26,
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: mq.width * .04,
          vertical: mq.height * .015,
        ),
        children: HomeType.values
            .map(
              (e) => HomeCard(
                homeType: e,
              ),
            )
            .toList(),
      ),
    );
  }
}
