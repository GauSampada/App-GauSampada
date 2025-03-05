import 'dart:io';
import 'package:direct_caller_sim_choice/direct_caller_sim_choice.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/app/provider/ai_provider.dart';
import 'package:gausampada/const/colors.dart';
import 'package:gausampada/const/image_picker_.dart';
import 'package:gausampada/screens/chat_bot/ai_assistance.dart';
import 'package:gausampada/screens/doctors/doctors.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:formatted_text/formatted_text.dart';

class DiseasePredictionScreen extends StatelessWidget {
  DiseasePredictionScreen({super.key});

  final TextEditingController _promptController = TextEditingController();

  Future<void> _makePhoneCall(BuildContext context, String phoneNumber) async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      bool? result = await DirectCaller().makePhoneCall(phoneNumber);
      if (result != true) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text("Failed to make the call. Please try again.")),
        );
      }
    } else if (status.isDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Permission denied. Cannot make a call.")),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Permission permanently denied. Enable in settings."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final aiProvider = Provider.of<AiProvider>(context);
    final imagePickerService = Provider.of<ImagePickerService>(context);

    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   // onPressed: () {
      //   //   aiProvider.reset();
      //   //   imagePickerService.clearImage();
      //   // },
      //   // child: const Icon(Icons.refresh),
      //   // ),
      //   child: const Icon(Icons.chat),
      //   onPressed: () {
      //     Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => const ChatScreen(),
      //       ),
      //     );
      //   },
      // ),
      appBar: AppBar(
        backgroundColor: themeColor,
        title: const Text("Disease Prediction"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Image Selection Area - Always available for new selection
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(12),
              ),
              child: imagePickerService.selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(imagePickerService.selectedImage!.path),
                        fit: BoxFit.cover,
                      ),
                    )
                  : const Center(child: Text("No image selected")),
            ),

            // Image Source Selection - Always available
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => imagePickerService.pickImage(
                      context: context,
                      isCamera: false,
                    ),
                    icon: const Icon(Icons.photo_library),
                    label: const Text("Gallery"),
                  ),
                  const SizedBox(width: 16),
                  OutlinedButton.icon(
                    onPressed: () => imagePickerService.pickImage(
                      context: context,
                      isCamera: true,
                    ),
                    icon: const Icon(Icons.camera_alt),
                    label: const Text("Camera"),
                  ),
                ],
              ),
            ),

            // Prompt Input - Always available for new input
            TextField(
              controller: _promptController,
              decoration: const InputDecoration(
                labelText: "Enter your details",
                hintText: "Describe symptoms or ask a specific question",
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),

            // Analyze Button - Always available unless loading
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: ElevatedButton(
                onPressed: aiProvider.isLoading ||
                        imagePickerService.selectedImage == null
                    ? null
                    : () async {
                        final currentImage = imagePickerService.selectedImage!;
                        final currentPrompt = _promptController.text;

                        await aiProvider.analyzeImage(
                          context: context,
                          image: currentImage,
                          prompt: currentPrompt,
                        );

                        // Clear text field after submission
                        _promptController.clear();
                      },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: aiProvider.isLoading
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                          SizedBox(width: 12),
                          Text("Analyzing..."),
                        ],
                      )
                    : const Text("Analyze Image"),
              ),
            ),

            // Previous Analysis Results
            if (aiProvider.hasAnalyzed)
              Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Analysis Report",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),

                    // Previous Image and Question in a Row
                    if (aiProvider.analyzedImagePath != null)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Thumbnail of analyzed image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(aiProvider.analyzedImagePath!),
                                width: 64,
                                height: 64,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Previous question
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Your Question:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    aiProvider.analyzedPrompt,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                    // Analysis Results
                    const Text(
                      "Results:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    FormattedText(
                      aiProvider.imageTextResponse,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),

            // Doctor Recommendation Section (Only shown after model response)
            if (aiProvider.hasAnalyzed &&
                aiProvider.imageTextResponse.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Recommended Doctor",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => DoctorListScreen()));
                            },
                            child: Text("View All"))
                      ],
                    ),
                    const Divider(),
                    ListTile(
                      leading: const ClipOval(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/ai_model/doctor.jpg"),
                          ),
                        ),
                      ),
                      title: const Text("Dr. Rajesh Kumar"),
                      subtitle: const Text("Specialist: Veterinarian"),
                      trailing: SizedBox(
                        width: 40,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            _makePhoneCall(context, "+917386154884");
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(Icons.call, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
