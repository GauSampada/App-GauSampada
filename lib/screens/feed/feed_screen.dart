import 'package:flutter/material.dart';
import 'package:gausampada/screens/chat_bot/ai_assistance.dart';
import 'package:gausampada/screens/feed/widgets/bookings_swiper.dart';
import 'package:gausampada/screens/feed/widgets/breed_info_card.dart';
import 'package:gausampada/screens/feed/widgets/custom_headings.dart';
import 'package:gausampada/screens/feed/widgets/info_main.dart';
import 'package:gausampada/screens/feed/widgets/products.dart';
import 'package:gausampada/screens/widgets/appbar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          // onPressed: () {
          //   aiProvider.reset();
          //   imagePickerService.clearImage();
          // },
          // child: const Icon(Icons.refresh),
          // ),
          child: const Icon(Icons.chat),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChatScreen(),
              ),
            );
          },
        ),
        appBar: const CustomAppbar(
          label: "GauSampada",
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                    height: screenHeight * 0.24,
                    width: screenWidth,
                    child: InfoMainScreen()),
                SizedBox(
                  height: 10,
                ),
                CustomHeadingsScreen(label: "My Orders", onPressed: () {}),
                SwiperBuilder(),
                SizedBox(
                  height: 10,
                ),
                CustomHeadingsScreen(
                    label: "Breed Information", onPressed: () {}),
                BreedInfoCardScreen(),
                CustomHeadingsScreen(label: "Products", onPressed: () {}),
                DairyProductsCardScreen(),
              ],
            ),
          ),
        ));
  }
}
