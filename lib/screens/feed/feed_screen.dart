import 'package:flutter/material.dart';
import 'package:gausampada/backend/providers/user_provider.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/const/logout_dialog.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/bread/bread_info_screen.dart';
import 'package:gausampada/screens/bread/breed_details.dart';
import 'package:gausampada/screens/chat_bot/ai_assistance.dart';
import 'package:gausampada/screens/feed/widgets/bookings_swiper.dart';
import 'package:gausampada/screens/feed/widgets/breed_info_card.dart';
import 'package:gausampada/screens/feed/widgets/custom_headings.dart';
import 'package:gausampada/screens/feed/widgets/info_main.dart';
import 'package:gausampada/screens/feed/widgets/products.dart';
import 'package:gausampada/screens/home/home_screen.dart';
import 'package:gausampada/screens/home/widgets/nav_bar_items.dart';
import 'package:gausampada/screens/maps/maps.dart';
import 'package:gausampada/screens/market/market_screen.dart';
import 'package:gausampada/screens/notifications/notification.dart';
import 'package:gausampada/screens/profile/user_profile.dart';
import 'package:gausampada/screens/settings/settings.dart';
import 'package:gausampada/screens/widgets/appbar.dart';
import 'package:provider/provider.dart';

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

    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return Scaffold(
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
        drawer: customNavigationBar(provider: userProvider),
        appBar: AppBar(
          backgroundColor: themeColor,
          toolbarHeight: 70,
          title: const Text(
            "GauSampada",
            style: TextStyle(
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
            userProvider.user.photoURL != ''
                ? CircleAvatar(
                    backgroundImage: NetworkImage(userProvider.user.photoURL!),
                  )
                : CircleAvatar(
                    child: Text(
                      userProvider.user.name[0],
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
            const SizedBox(width: 10),
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
                      label: "Breed Information",
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
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
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
                      label: "Dairy Products",
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
                      label: "My Orders",
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
    });
  }

  Drawer customNavigationBar({required UserProvider provider}) {
    return Drawer(
      backgroundColor: backgroundColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: themeColor),
              onDetailsPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => const UserProfileScreen())),
              accountName: Text(
                provider.user.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                provider.user.email,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              currentAccountPicture: provider.user.photoURL != ''
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(provider.user.photoURL!),
                    )
                  : CircleAvatar(
                      child: Text(
                        provider.user.name[0],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
            ),
            const SizedBox(height: 10),
            Navbaritems(
              icon: Icons.home,
              label: "Home",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.person,
              label: "Profile",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const UserProfileScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.notifications,
              label: "Notifications",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.settings,
              label: "Settings",
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.logout,
              label: "SignOut",
              onTap: () {
                const CustomDialog().showLogoutDialog(
                  context: context,
                  label: "LogOut",
                  message: "Are you sure you want to  Log Out?",
                  option2: "Cancel",
                  onPressed2: () {
                    Navigator.of(context).pop();
                  },
                  option1: "Yes",
                  onPressed1: () {
                    UserProvider().logout();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
                  },
                );
              },
              labelColor: Colors.red,
            ),
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
