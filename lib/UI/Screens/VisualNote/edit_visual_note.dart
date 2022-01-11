import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Models/visual_note_model.dart';
import 'package:visual_notes/UI/Screens/home/visual_note_detail.dart';
import 'package:visual_notes/UI/Widgets/app_bar.dart';
import 'package:visual_notes/UI/Widgets/buttons/rounded_button.dart';
import 'package:visual_notes/UI/Widgets/textfields.dart';
import 'package:visual_notes/Utils/colors_utils.dart';
import 'package:visual_notes/Utils/custom_functions.dart';
import 'package:visual_notes/ViewModel/visual_note_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/custom_image_view.dart';

class EditVisualNote extends StatefulWidget {
  final VisualNoteModel visualNoteModel;
  EditVisualNote({required this.visualNoteModel});
  @override
  _EditVisualNoteState createState() => _EditVisualNoteState();
}

class _EditVisualNoteState extends State<EditVisualNote> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'New Visual Note ',
        back: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTextFormField(
                  initialValue: widget.visualNoteModel.title,
                  horizontalPadding: 15.0,
                  labelText: 'Title',
                  hintText: 'Enter Title',
                  onSaved: (val) {
                    widget.visualNoteModel.title = val;
                  },
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter a Title';
                  },
                ),
                SizedBox(height: 30.0),
                AppTextFormField(
                  initialValue: widget.visualNoteModel.description,
                  horizontalPadding: 15.0,
                  labelText: 'Description',
                  hintText: 'Enter Description',
                  maxLines: 4,
                  onSaved: (val) {
                    widget.visualNoteModel.description = val;
                  },
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter a Description';
                  },
                ),
                SizedBox(height: 30.0),
                Text(
                  'Picture',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.0),
//                _customImageView(),
                CustomImageView(
                    file: File(widget.visualNoteModel.picture!),
                    onPressed: () async {
                      final image = await CustomFunctions.pickImage();
                      widget.visualNoteModel.picture = image!.path;
                      setState(() {});
                    }),
                SizedBox(height: 15.0),
                Text(
                  'Status Note',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15.0),
                SwitchListTile(
                  value: widget.visualNoteModel.status!,
                  onChanged: (val) {
                    widget.visualNoteModel.status = val;
                    setState(() {});
                  },
                  title: Text(
                    widget.visualNoteModel.status! ? 'Open for inspection' : 'Closed',
                  ),
                ),
                SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.center,
                  child: CustomRoundedButton(
                    text: 'Save Edits',
                    height: 50,
                    width: 120,
                    textColor: ColorsUtils.whiteColor,
                    fontSize: 18.0,
                    pressed: () async {
                      _editVisualNote();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editVisualNote() async {
    bool _isValidate = _formKey.currentState!.validate();

    if (widget.visualNoteModel.picture != null) {
      if (_isValidate) {
        _formKey.currentState!.save();
        widget.visualNoteModel.date = DateTime.now().toIso8601String();
        FocusScope.of(context).unfocus();
        final _isDone =
            await context.read(visualNoteProvider).editVisualNote(widget.visualNoteModel);
        if (_isDone) {
          CustomNavigator.pushScreenReplacementToFirstPage(
              widget: VisualNoteDetail(visualNoteModel: widget.visualNoteModel), context: context);
        } else {
          CustomFunctions.showCustomSnackBar(
              text: 'an error occurred please try again ', context: context);
        }
      }
    } else {
      CustomFunctions.showCustomSnackBar(text: 'Please Upload Picture', context: context);
    }
  }
}
