import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/app/provider/ai_provider.dart';
import 'package:gausampada/const/image_picker_.dart';
import 'package:gausampada/firebase_options.dart';
import 'package:provider/provider.dart';

import 'screens/DiseasePrediction/disease_prediction.dart';
import 'screens/chat_bot/ai_assistance.dart';

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
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: MaterialApp(
          title: 'GauSampada',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: DiseasePredictionScreen()),
    );
  }
}
