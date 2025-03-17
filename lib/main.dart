import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/app/providers.dart';
import 'package:gausampada/firebase_options.dart';
import 'package:gausampada/screens/onboarding/onboarding_main.dart';
import 'package:gausampada/const/colors.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      child: MaterialApp(
        title: 'GauSampada',
        debugShowCheckedModeBanner: false,
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: Colors.white,
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
        // home: const HomeScreen(),
        home: const OnboardingMainScreen(),
      ),
    );
  }
}
