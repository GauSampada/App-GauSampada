import 'package:flutter/material.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/home/home_screen.dart';
import 'package:gausampada/screens/onboarding/widgets/onboarding_sub.dart';
import 'package:gausampada/screens/widgets/buttons/elevated.dart';
import 'package:gausampada/screens/widgets/buttons/textfield.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingMainScreen extends StatefulWidget {
  const OnboardingMainScreen({super.key});

  @override
  State<OnboardingMainScreen> createState() => OnboardingMainScreenState();
}

class OnboardingMainScreenState extends State<OnboardingMainScreen> {
  final PageController controller = PageController(initialPage: 0);
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 4;
                });
              },
              children: const [
                OnboardingSubScreen(
                    title: "Welcome to GauSampada!",
                    isLottie: false,
                    address: "assets/feed/cow_info.jpg",
                    description:
                        "Connect with farmers and buyers via markets, cooperatives, and online platforms for fair pricing."),
                OnboardingSubScreen(
                  title: "AI-Powered Disease Detection & Prevention",
                  isLottie: false,
                  address: "assets/feed/ai_assist.jpg",
                  description:
                      "AI detects diseases early, monitors vitals, optimizes nutrition, and sends alerts for better cattle health.",
                ),
                OnboardingSubScreen(
                    title: "Sell Dairy Products Effortlessly",
                    isLottie: false,
                    address: "assets/feed/farmers.jpg",
                    description:
                        "Successful sales need smart pricing, inventory, and engagement, plus quality supply and marketing."),
                OnboardingSubScreen(
                    title: "Find Nearby Farmers & Buyers",
                    isLottie: false,
                    address: "assets/feed/products.jpg",
                    description:
                        "Smart pricing, inventory, and engagement boost sales and quality."),
                OnboardingSubScreen(
                    title: "Veterinary Doctor Appoinments",
                    isLottie: false,
                    address: "assets/feed/vetenary.jpg",
                    description:
                        "Veterinarians analyze cow health data for accurate diagnosis, timely treatment, and scheduling.")
              ],
            ),
          ),
          Positioned(
            bottom: 90,
            left: screenWidth * 0.37,
            child: SmoothPageIndicator(
              controller: controller,
              count: 5,
              effect: const WormEffect(
                dotWidth: 10.0,
                dotHeight: 10.0,
              ),
              onDotClicked: (index) {
                controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                );
              },
            ),
          ),
          isLastPage
              ? Positioned(
                  bottom: 25,
                  left: 115,
                  child: CustomElevatedButton(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    text: "Get Started",
                  ),
                )
              : Positioned(
                  bottom: 25,
                  left: 20,
                  right: 20,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextButton(
                        backgroundColor: Colors.grey[800],
                        foregroundColor: Colors.white,
                        text: "Skip",
                        onPressed: () {
                          controller.jumpToPage(4);
                        },
                      ),
                      CustomTextButton(
                        backgroundColor: Colors.grey[800],
                        foregroundColor: Colors.white,
                        text: "Next",
                        onPressed: () {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeOut,
                          );
                        },
                      ),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
