import 'package:flutter/material.dart';

import 'create_account.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  int _currentIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: PageView(
            controller: pageController,
            onPageChanged: (int index) {
              _currentIndex = index;
            },
            children: [
              Getonboarding(image: "assets/images/phone.jpeg", index: 0),
              Getonboarding(image: "assets/images/calendar.jpg", index: 1),
              Getonboarding(image: "assets/images/third.png", index: 2),
            ],
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: InkWell(
              onTap: () {
                if (_currentIndex == 2) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Activity()));
                }
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueAccent.shade700),
                child: const Text(
                  "Get Started",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}

class Getonboarding extends StatelessWidget {
  String image;
  int index;

  Getonboarding({required this.image, required this.index, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            image,
            height: 350,
            width: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 25,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: index == 0 ? 30 : 5,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blueAccent.shade700,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: index == 1 ? 30 : 5,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blueAccent.shade700,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Container(
              width: index == 2 ? 30 : 5,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.blueAccent.shade700,
              ),
            ),
          ]),
          const Spacer(),
          const Text(
            "Set Your Schedule",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 36,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Quickly see your upcoming event, task, conference calls, weather, and more",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
