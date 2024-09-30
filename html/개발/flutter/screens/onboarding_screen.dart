import 'package:ai_assistant/widgets/custom_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../helper/global.dart';
import '../models/onboard.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();

    final list = [
      // onboarding 1
      Onboard(
        title: 'Ask me Anything',
        subtitle:
            'I can be your Best Friend & You can ask me anything & I will help you',
        lottie: 'ai_ask_me',
      ),

      // onboarding2
      Onboard(
        title: 'Imagination to Reality',
        subtitle:
            'Just Imagine anything & let me know, I will create something wodnerful for you!',
        lottie: 'ai_play',
      ),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, idx) {
          final isLast = idx == list.length - 1;
          return Column(
            children: [
              // lottie
              Lottie.asset(
                'assets/lottie/${list[idx].lottie}.json',
                height: mq.height * .6,
                width: isLast ? mq.width * .85 : null,
              ),

              // title
              Text(
                list[idx].title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  letterSpacing: .5,
                ),
              ),

              // for adding some space
              SizedBox(
                height: mq.height * .015,
              ),

              // subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[idx].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 13.5,
                    letterSpacing: .5,
                    color: Colors.black38,
                  ),
                ),
              ),

              const Spacer(),

              // dots
              Wrap(
                spacing: 10,
                children: List.generate(
                  2,
                  (i) => Container(
                    width: i == idx ? 15 : 10,
                    height: 8,
                    decoration: BoxDecoration(
                      color: i == idx ? Colors.blue : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              const Spacer(),

              // button
              CustomBtn(
                  onTap: () {
                    if (isLast) {
                      // Navigator.of(context).pushReplacement(
                      //   MaterialPageRoute(
                      //     builder: (_) => const HomeScreen(),
                      //   ),
                      // );
                      Get.off(
                        () => const HomeScreen(),
                      );
                    } else {
                      c.nextPage(
                        duration: const Duration(
                          milliseconds: 600,
                        ),
                        curve: Curves.ease,
                      );
                    }
                  },
                  text: isLast ? 'Finish' : 'Next'),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
