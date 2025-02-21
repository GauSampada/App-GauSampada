import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/app/provider/ai_provider.dart';
import 'package:gausampada/backend/providers/user_provider.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/const/image_picker_.dart';
import 'package:gausampada/firebase_options.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:gausampada/screens/feed/feed_screen.dart';
import 'package:gausampada/screens/home/home_screen.dart';
import 'package:gausampada/screens/onboarding/onboarding_main.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/DiseasePrediction/disease_prediction.dart';
import 'screens/chat_bot/ai_assistance.dart';
import 'screens/market/market_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AiProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickerService()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'GauSampada',
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: themeColor,
            foregroundColor: Colors.white,
          ),
        ),

        // home: StreamBuilder(
        //     stream: FirebaseAuth.instance.authStateChanges(),
        //     builder: (context, snapshot) {
        //       if (snapshot.hasData) {
        //         return const HomeScreen();
        //       } else if (snapshot.hasError) {
        //         return const Center(
        //           child: Text("error will loading the data"),
        //         );
        //       }
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(
        //           child: CircularProgressIndicator(
        //             color: themeColor,
        //           ),
        //         );
        //       }

        //       return const OnboardingMainScreen(); // for android
        //       // return const LoginScreen();
        //     }),
        home: const HomeScreen(),
      ),
    );
  }
}
