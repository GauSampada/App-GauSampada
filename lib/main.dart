import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/app/provider/ai_provider.dart';
import 'package:gausampada/const/image_picker_.dart';
import 'package:gausampada/firebase_options.dart';
import 'package:gausampada/screens/auth/login.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/DiseasePrediction/disease_prediction.dart';

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
      ],
      child: MaterialApp(
          title: 'GauSampada',
          debugShowCheckedModeBanner: false,
          theme: ThemeData().copyWith(
              textTheme: GoogleFonts.dmSansTextTheme(
            Theme.of(context).textTheme,
          )),
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
          //             color: blueColor,
          //           ),
          //         );
          //       }

          //       return const OnboardingMainScreen(); // for android
          //       // return const LoginScreen();
          //     }),
          home: LoginScreen()),
    );
  }
}
