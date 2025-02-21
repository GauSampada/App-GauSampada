import 'dart:convert';

import 'package:http/http.dart' as http;

class AiProvider {
  String _imageTextResponse = "";
  String get imageTextResponse => _imageTextResponse;

  Future<void> getImageTextResponse({
    required String prompt,
    required String imageBase64,
  }) async {
    final response = await http.post(
      Uri.parse("http://10.0.43.124:5000/image_to_text"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"image_base64": imageBase64}),
    );

    if (response.statusCode == 200) {
      _imageTextResponse = jsonDecode(response.body)['result'];
    } else {
      _imageTextResponse = "Error: Unable to process image";
    }
  }
}
