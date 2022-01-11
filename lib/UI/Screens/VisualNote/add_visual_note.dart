import 'dart:io';

import 'package:flutter/material.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Models/visual_note_model.dart';
import 'package:visual_notes/UI/Screens/VisualNote/widgets/custom_image_view.dart';
import 'package:visual_notes/UI/Widgets/app_bar.dart';
import 'package:visual_notes/UI/Widgets/buttons/rounded_button.dart';
import 'package:visual_notes/UI/Widgets/textfields.dart';
import 'package:visual_notes/Utils/colors_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:visual_notes/Utils/custom_functions.dart';
import 'package:visual_notes/ViewModel/visual_note_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddVisualNote extends StatefulWidget {
  const AddVisualNote({Key? key}) : super(key: key);

  @override
  _AddVisualNoteState createState() => _AddVisualNoteState();
}

class _AddVisualNoteState extends State<AddVisualNote> {
  final _formKey = GlobalKey<FormState>();
  VisualNoteModel _visualNoteModel = VisualNoteModel();
  bool _status = false;
  File? _file;

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
                  horizontalPadding: 15.0,
                  labelText: 'Title',
                  hintText: 'Enter Title',
                  onSaved: (val) {
                    _visualNoteModel.title = val;
                  },
                  validator: (val) {
                    if (val!.isEmpty) return 'Enter a Title';
                  },
                ),
                SizedBox(height: 30.0),
                AppTextFormField(
                  horizontalPadding: 15.0,
                  labelText: 'Description',
                  hintText: 'Enter Description',
                  maxLines: 4,
                  onSaved: (val) {
                    _visualNoteModel.description = val;
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
                CustomImageView(file: _file, onPressed: ()async{
                  final image = await CustomFunctions.pickImage();
                  _file= image!;
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
                  value: _status,
                  onChanged: (val) {
                    _status = val;
                    setState(() {});
                  },
                  title: Text(
                    _status ? 'Open for inspection' : 'Closed',
                  ),
                ),
                SizedBox(height: 15.0),
                Align(
                  alignment: Alignment.center,
                  child: CustomRoundedButton(
                    text: 'Save',
                    height: 50,
                    width: 120,
                    textColor: ColorsUtils.whiteColor,
                    fontSize: 18.0,
                    pressed: () async {
                      _addVisualNote();
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



  void _addVisualNote() async {
    bool _isValidate = _formKey.currentState!.validate();

    if (_file != null) {
      if (_isValidate) {
        _formKey.currentState!.save();
        _visualNoteModel.picture = _file!.path;
        _visualNoteModel.date = DateTime.now().toIso8601String();
        _visualNoteModel.status = _status;
        FocusScope.of(context).unfocus();
        final _isDone = await context.read(visualNoteProvider).addNewVisual(_visualNoteModel);
        if (_isDone) {
          CustomNavigator.popScreen(context);
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
