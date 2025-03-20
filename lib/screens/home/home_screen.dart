import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/backend/auth/auth_methods.dart';
import 'package:gausampada/backend/providers/user_provider.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/screens/widgets/dialogs/logout_dialog.dart';
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
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  final bool isLoginOrSignUp;
  const HomeScreen({super.key, this.isLoginOrSignUp = false});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late int currentIndex = 0;
  final GlobalKey _scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.isLoginOrSignUp) {
      toastMessage(
        context: context,
        message: AppLocalizations.of(context)!.welcomeBack,
        leadingIcon: const Icon(Icons.emoji_emotions),
        position: DelightSnackbarPosition.top,
      );
    }
  }

  void getData() async {
    UserProvider userProvider = Provider.of(context, listen: false);
    await userProvider.fetchUser();
  }

  final List<Widget> screens = [
    const FeedScreen(),
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
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.home),
                    label: AppLocalizations.of(context)!.home,
                    tooltip: AppLocalizations.of(context)!.home,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.shopping_bag),
                    label: AppLocalizations.of(context)!.market,
                    tooltip: AppLocalizations.of(context)!.market,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.smart_toy_outlined),
                    label: AppLocalizations.of(context)!.aiDiagnosis,
                    tooltip: AppLocalizations.of(context)!.aiDiagnosis,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.pets),
                    label: AppLocalizations.of(context)!.breedInfo,
                    tooltip: AppLocalizations.of(context)!.breedInfo,
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.person_pin),
                    label: AppLocalizations.of(context)!.profile,
                    tooltip: AppLocalizations.of(context)!.profile,
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
                AppLocalizations.of(context)!.userName(provider.user.name),
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
              label: AppLocalizations.of(context)!.home,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.notifications,
              label: AppLocalizations.of(context)!.notifications,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.settings,
              label: AppLocalizations.of(context)!.settings,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingsScreen()));
              },
            ),
            Navbaritems(
              icon: Icons.logout,
              label: AppLocalizations.of(context)!.signOut,
              onTap: () {
                const CustomDialog().showLogoutDialog(
                  context: context,
                  label: AppLocalizations.of(context)!.logOut,
                  message: AppLocalizations.of(context)!.confirmLogout,
                  option2: AppLocalizations.of(context)!.cancel,
                  onPressed2: () {
                    Navigator.of(context).pop();
                  },
                  option1: AppLocalizations.of(context)!.yes,
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
