import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CustomFunctions {
  static void showCustomSnackBar({
   required String? text,
    bool? hasIcon=false,
    IconData? iconType,
    required BuildContext context,
    Color? iconColor,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: [
          hasIcon!
              ? Icon(
                  iconType,
                  color: iconColor,
                )
              : Container(
                  height: 22.0,
                ),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text!,
              style: TextStyle(fontSize: 15.0),
            ),
          ),
        ],
      ),
    ));
  }

  static Future<File?> pickImage() async {
    final ImagePicker _picker = ImagePicker();

    final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final String fileName = pickedFile.path.split('/').last;

      // final imageFile = await MultipartFile.fromFileSync('file',
      //     filename: fileName,
      //     contentType: MediaType('image', fileName.split('.').last));

      return File(pickedFile.path);
    } else {
      return null;
    }
  }
}
