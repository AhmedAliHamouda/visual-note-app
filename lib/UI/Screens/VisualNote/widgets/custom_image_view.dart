import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visual_notes/Utils/colors_utils.dart';

class CustomImageView extends StatefulWidget {
  File? file;
  VoidCallback onPressed;
  CustomImageView({ this.file, required this.onPressed});

  @override
  _CustomImageViewState createState() => _CustomImageViewState();
}

class _CustomImageViewState extends State<CustomImageView> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          Container(
            height: 220,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(color: ColorsUtils.kPrimaryColor, width: 1.0),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: widget.file == null
                ? Container()
                : ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.file(
                      File(widget.file!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          Positioned(
            top: 0.0,
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: widget.file != null ? ColorsUtils.whiteColor : ColorsUtils.greyTextColor,
                size: 50.0,
              ),
              onPressed: widget.onPressed,
              /*  onPressed: () async {
                final image = await CustomFunctions.pickImage();
                widget.file = image!;
                setState(() {});
              },*/
            ),
          )
        ],
      ),
    );
  }
}
