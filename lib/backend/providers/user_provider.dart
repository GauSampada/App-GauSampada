import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gausampada/backend/models/user_model.dart';
import 'package:gausampada/const/profile_image_picker.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class UserProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String uid = FirebaseAuth.instance.currentUser!.uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  UserModel? _user;
  UserModel get user => _user!;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserProvider() {
    listenToUserChanges();
  }

  void listenToUserChanges() {
    String? uid = _auth.currentUser?.uid;
    if (uid != null) {
      _firestore.collection('users').doc(uid).snapshots().listen((snap) {
        if (snap.exists) {
          _user = UserModel.fromSnapshot(snap);
        } else {
          _user = null;
        }
        notifyListeners();
      });
    }
  }

  Future<void> fetchUser() async {
    try {
      var snap = await _firestore.collection('users').doc(uid).get();
      _user = UserModel.fromSnapshot(snap);
    } catch (e) {
      // print("❌ Error fetching user data: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  File? _profileImage;
  File? get profileImage => _profileImage;

  String? _photoURL;
  String? get photoURL => _photoURL ?? _user?.photoURL;

  Future<void> selectImage(ImageSource source) async {
    _isLoading = true;
    notifyListeners();
    try {
      File? image = await CustomImagePicker().pickImage(source);
      _profileImage = image;
      notifyListeners();

      if (image != null) {
        await generateProfileUrl();
      }
    } catch (e) {
      // print("❌ Error selecting image: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> generateProfileUrl() async {
    try {
      String? imageUrl =
          await CustomImagePicker().uploadToCloudinary(imageFile: profileImage);

      if (imageUrl != null && imageUrl.isNotEmpty) {
        _photoURL = imageUrl;
        notifyListeners();

        await _firestore
            .collection('users')
            .doc(uid)
            .update({'photoURL': imageUrl});
      }
    } catch (e) {
      // print("❌ Error uploading image: $e");
    }
  }

  bool _isUpdate = false;
  bool get isUpdate => _isUpdate;

  Future<String> updateUserDetails({
    required String name,
    required String email,
    required String phonenumber,
    required String location,
  }) async {
    String res = '';

    try {
      final updatedUser = UserModel(
        uid: uid,
        name: name,
        email: email,
        phonenumber: phonenumber,
        photoURL: photoURL ?? "Photo Not Selected",
        location: location,
      );

      _isUpdate = true;
      notifyListeners();

      await _firestore.collection('users').doc(uid).update(updatedUser.toMap());

      _isUpdate = false;
      res = 'update';

      notifyListeners();
    } catch (error) {
      res = error.toString();
      // print("❌ Error updating user details: $error");
      throw Exception(error.toString());
    }

    return res;
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
      await GoogleSignIn().signOut();

      _user = null; // Reset user model
      notifyListeners(); // Ensure UI updates

      print("✅ User successfully logged out.");
    } catch (e) {
      print("❌ Error during logout: $e");
    }
  }
}
