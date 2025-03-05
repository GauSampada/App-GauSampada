import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/backend/auth/auth_methods.dart';
import 'package:gausampada/backend/providers/user_provider.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/const/logout_dialog.dart';
import 'package:gausampada/const/toast.dart';
import 'package:gausampada/screens/DiseasePrediction/disease_prediction.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/bread/bread_info_screen.dart';
import 'package:gausampada/screens/feed/feed_screen.dart';
import 'package:gausampada/screens/home/widgets/nav_bar_items.dart';
import 'package:gausampada/screens/market/market_screen.dart';
import 'package:gausampada/screens/notifications/notification.dart';
import 'package:gausampada/screens/profile/user_profile.dart';
import 'package:gausampada/screens/settings/settings.dart';
import 'package:gausampada/screens/widgets/appbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoginOrSignUp;
  const HomeScreen({super.key, this.isLoginOrSignUp = false});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  @override
  void initState() {
    super.initState();
    // Display toast immediately
    if (widget.isLoginOrSignUp) {
      toastMessage(
        context: context,
        message: "Welcome Back!",
        leadingIcon: const Icon(Icons.emoji_emotions),
        position: DelightSnackbarPosition.top,
      );
    }

    // // Delayed execution for dialogs
    // Future.delayed(const Duration(seconds: 1), () {
    //   const CustomDialog().showLogoutDialog(
    //     context: context,
    //     label: "Notifications",
    //     message: "Allow SafeGaurd to send notifications",
    //     option1: "Allow",
    //     onPressed1: () {
    //       Navigator.of(context).pop();
    //     },
    //     option2: "Deny",
    //     onPressed2: () {
    //     },
    //   );
    // });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  void getData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.fetchUser();
  }

  final List<Widget> screens = [
    const FeedScreen(),
    // MapScreen(),
    const MarketAccessScreen(),
    DiseasePredictionScreen(),
    const BreadInfoScreen(),
    const UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(builder: (context, userProvider, _) {
      return userProvider.isLoading
          ? const Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: CircularProgressIndicator(
                  color: themeColor,
                ),
              ),
            )
          : Scaffold(
              key: _scaffoldKey,
              drawer: customNavigationBar(provider: userProvider),
              body: screens[currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_bag),
                    label: 'Market',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.smart_toy_outlined),
                    label: 'AI Diagnosis',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.pets),
                    label: 'Breed Info',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_pin),
                    label: 'Profile',
                  ),
                ],
                onTap: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                selectedItemColor: const Color(0xFF0A7643),
                unselectedItemColor: Colors.grey,
                iconSize: 30,
                selectedLabelStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
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
            // Navbaritems(icon: Icons.person, label: "Profile", onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const UserProfileScreen()));
            //   },),
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
                    AuthService().logout();
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
