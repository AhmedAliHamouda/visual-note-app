import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Models/visual_note_model.dart';
import 'package:visual_notes/UI/Screens/VisualNote/edit_visual_note.dart';
import 'package:visual_notes/UI/Widgets/app_bar.dart';
import 'package:visual_notes/UI/Widgets/buttons/rounded_button.dart';
import 'package:visual_notes/Utils/colors_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visual_notes/Utils/custom_functions.dart';
import 'package:visual_notes/ViewModel/visual_note_provider.dart';

class VisualNoteDetail extends StatefulWidget {
  final VisualNoteModel visualNoteModel;
  VisualNoteDetail({required this.visualNoteModel});

  @override
  _VisualNoteDetailState createState() => _VisualNoteDetailState();
}

class _VisualNoteDetailState extends State<VisualNoteDetail> {
  String formattedDate = '';
  @override
  void initState() {
    super.initState();
    formattedDate =
        DateFormat('yyyy-MM-dd  |  hh:mm a').format(DateTime.parse(widget.visualNoteModel.date!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Visual Note Detail',
        back: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customText(
              title: 'ID : ${widget.visualNoteModel.id}',
              fontSize: 18.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            _customText(
              title: 'Title : ${widget.visualNoteModel.title}',
              fontSize: 18.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            _customText(
              title: 'Description : ${widget.visualNoteModel.description}',
              fontSize: 18.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            _customText(
              title: 'Date : $formattedDate',
              fontSize: 18.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            _customText(
              title: 'Status : ${widget.visualNoteModel.status! ? 'Open' : 'Closed'}',
              fontSize: 18.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            _customText(
              title: 'Picture ',
              fontSize: 20.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 220,
                width: 250,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorsUtils.kPrimaryColor, width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.file(
                    File(widget.visualNoteModel.picture!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomRoundedButton(
            text: 'Edit',
            fontSize: 18.0,
            height: 50,
            width: 120,
            textColor: ColorsUtils.whiteColor,
            pressed: () async {
              CustomNavigator.pushScreen(
                  widget: EditVisualNote(visualNoteModel: widget.visualNoteModel),
                  context: context);
            },
          ),
          CustomRoundedButton(
            text: 'Delete',
            fontSize: 18.0,
            height: 50,
            width: 120,
            textColor: ColorsUtils.whiteColor,
            pressed: () async {
              _deleteVisualNote();
            },
          ),
        ],
      ),
    );
  }

  Widget _customText({required String title, double fontSize = 15}) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
    );
  }

  void _deleteVisualNote() async {
    final _isDelete = await context
        .read(visualNoteProvider)
        .deleteVisualNote(visualNoteId: widget.visualNoteModel.id!);
    if (_isDelete) {
      CustomNavigator.popScreen(context);
    } else {
      CustomFunctions.showCustomSnackBar(
          text: 'an error occurred please try again ', context: context);
    }
  }
}
