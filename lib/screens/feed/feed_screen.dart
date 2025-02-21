import 'package:flutter/material.dart';
import 'package:gausampada/screens/chat_bot/ai_assistance.dart';
import 'package:gausampada/screens/widgets/appbar.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
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
    );
  }
}
