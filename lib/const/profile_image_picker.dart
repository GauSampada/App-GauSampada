import 'dart:io';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class CustomImagePicker {
  File? imageFile;
  final picker = ImagePicker();
  String? uploadedImageUrl;

  // Pick image from gallery or camera
  Future<File?> pickImage(ImageSource source) async {
    try {
      print("📷 Selecting image...");
      final pickedFile = await picker.pickImage(source: source);
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
        return imageFile;
      }
    } catch (e) {
      print("❌ Error selecting image: $e");
    }
    return null;
  }

  // Upload image to Cloudinary using Dio
  Future<String?> uploadToCloudinary({required File? imageFile}) async {
    if (imageFile == null) {
      print("No image selected.");
    }

    String cloudName = "dvd0mdeon";
    String apiKey = "713689833837367";

    String uploadUrl =
        "https://api.cloudinary.com/v1_1/$cloudName/image/upload";

    String preset = "GauSampada_UserData";
    String folder = "GauSampada_UserData";

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(imageFile!.path),
      "upload_preset": preset,
      "api_key": apiKey,
      "folder": folder,
    });

    try {
      Dio dio = Dio();
      Response response = await dio.post(uploadUrl, data: formData);

      if (response.statusCode == 200) {
        uploadedImageUrl = response.data["secure_url"];
        print("✅Uploaded Image URL: $uploadedImageUrl");
        return uploadedImageUrl;
      } else {
        print("Upload failed: ${response.statusMessage}");
        return null;
      }
    } catch (e) {
      print("❌ Error selecting image: $e");
      return null;
    }
  }
}
