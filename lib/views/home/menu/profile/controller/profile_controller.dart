import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

final profileProvider = ChangeNotifierProvider<ProfileProvider>((ref) {
  return ProfileProvider();
});

class ProfileProvider extends ChangeNotifier {
  File? _image;

  File? get image => _image;

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
      print('this is >> $_image');
      notifyListeners();
    }
  }

  void clearImage() {
    _image = null;
    notifyListeners();
  }
}
