import 'package:flutter/material.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/screens/bread/bread_info_screen.dart';
import 'package:gausampada/screens/chat_bot/ai_assistance.dart';
import 'package:gausampada/screens/feed/widgets/bookings_swiper.dart';
import 'package:gausampada/screens/feed/widgets/breed_info_card.dart';
import 'package:gausampada/screens/feed/widgets/info_main.dart';
import 'package:gausampada/screens/feed/widgets/products.dart';
import 'package:gausampada/screens/maps/maps.dart';
import 'package:gausampada/screens/market/market_screen.dart';
import 'package:gausampada/screens/notifications/notification.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      backgroundColor: Colors.grey[50],
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Icon(
          Icons.chat_bubble_rounded,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ChatScreen(),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: themeColor,
        toolbarHeight: 70,
        title: Text(
          AppLocalizations.of(context)!.gauSampada,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.location_on,
              color: Colors.white,
            ),
            tooltip: 'Location',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const MapScreen(),
                ),
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            tooltip: 'Notifications',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ),
              );
            },
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Hero section with gradient overlay
            const SizedBox(
              height: 8,
            ),
            SizedBox(
                height: screenHeight * 0.24,
                width: screenWidth,
                child: const InfoMainScreen()),
            const SizedBox(
              height: 10,
            ),

            // Breed Information Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomHeadingsScreen(
                    label: AppLocalizations.of(context)!.breedInformation,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const BreadInfoScreen(),
                        ),
                      );
                    },
                    icon: Icons.pets_rounded,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const BreedInfoCardScreen(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Products Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomHeadingsScreen(
                    label: AppLocalizations.of(context)!.dairyProducts,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const MarketAccessScreen(),
                        ),
                      );
                    },
                    icon: Icons.shopping_basket_rounded,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const DairyProductsCardScreen(),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),
            // My Orders Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  CustomHeadingsScreen(
                    label: AppLocalizations.of(context)!.dairyProducts,
                    onPressed: () {},
                    icon: Icons.shopping_bag_rounded,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const SwiperBuilder(),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// You should also update your CustomHeadingsScreen widget to include an icon
// Here's what it might look like:

class CustomHeadingsScreen extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? icon;

  const CustomHeadingsScreen({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                Icon(
                  icon,
                  color: Theme.of(context).primaryColor,
                  size: 20,
                ),
                const SizedBox(width: 8),
              ],
              Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
