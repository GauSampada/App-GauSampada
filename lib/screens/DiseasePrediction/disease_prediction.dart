import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DiseasePrediction extends StatefulWidget {
  const DiseasePrediction({super.key});

  @override
  State<DiseasePrediction> createState() => _DiseasePredictionState();
}

class _DiseasePredictionState extends State<DiseasePrediction> {
  File? _image;
  final String _responseText = "";
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _sendImageToServer() async {
    // if (_image == null) return;

    // List<int> imageBytes = await _image!.readAsBytes();
    // String base64Image = base64Encode(imageBytes);

    // final response = await http.post(
    //   Uri.parse("http://10.0.43.124:5000/image_to_text"),
    //   headers: {"Content-Type": "application/json"},
    //   body: jsonEncode({"image_base64": base64Image}),
    // );

    // if (response.statusCode == 200) {
    //   setState(() {
    //     _responseText = jsonDecode(response.body)['result'];
    //   });
    // } else {
    //   setState(() {
    //     _responseText = "Error: Unable to process image";
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image to Text")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _image != null
              ? Image.file(_image!, height: 200, width: 200, fit: BoxFit.cover)
              : const Text("No image selected"),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text("Pick Image"),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _sendImageToServer,
            child: const Text("Send to Server"),
          ),
          const SizedBox(height: 20),
          const Text("Response:",
              style: TextStyle(fontWeight: FontWeight.bold)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(_responseText, textAlign: TextAlign.center),
          ),
        ],
      ),
    );
  }
}
