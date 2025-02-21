import 'package:flutter/material.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/feed/widgets/info_cards.dart';
import 'package:gausampada/screens/onboarding/widgets/onboarding_sub.dart';
import 'package:gausampada/screens/widgets/buttons/elevated.dart';
import 'package:gausampada/screens/widgets/buttons/textfield.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class InfoMainScreen extends StatefulWidget {
  const InfoMainScreen({super.key});

  @override
  State<InfoMainScreen> createState() => InfoMainScreenState();
}

class InfoMainScreenState extends State<InfoMainScreen> {
  final PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: screenHeight * 0.2,
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 3;
                });
              },
              children: [
                InfoSubScreen(
                    title: "AI-Powered Disease\n Detection & Prevention",
                    address: "assets/feed/cow_info.jpg"),
                InfoSubScreen(
                  title: "Veterinary Doctor \n Appointments",
                  address: "assets/feed/vetenary.jpg",
                  width: 0.7,
                ),
                InfoSubScreen(
                    title: "Sell Dairy Products \nEffortlessly",
                    address: "assets/feed/products.jpg"),
                InfoSubScreen(
                    title: "AI Assistance for\n Cow Health",
                    address: "assets/feed/farmers.jpg"),
                InfoSubScreen(
                    title: "Find Nearby \nFarmers & Buyers",
                    address: "assets/feed/farmers.jpg"),
              ],
            ),
          ),
          SizedBox(height: 5),
          SmoothPageIndicator(
            controller: controller,
            count: 5,
            effect: const WormEffect(),
            onDotClicked: (index) {
              controller.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          ),
        ],
      ),
    );
  }
}
