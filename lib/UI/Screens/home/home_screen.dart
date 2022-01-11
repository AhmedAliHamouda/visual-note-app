import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:visual_notes/Helpers/routes.dart';
import 'package:visual_notes/Models/visual_note_model.dart';
import 'package:visual_notes/UI/Screens/VisualNote/add_visual_note.dart';
import 'package:visual_notes/UI/Screens/home/visual_note_detail.dart';
import 'package:visual_notes/UI/Widgets/app_bar.dart';
import 'package:visual_notes/UI/Widgets/buttons/rounded_button.dart';
import 'package:visual_notes/Utils/colors_utils.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visual_notes/ViewModel/visual_note_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 0), () async {
      final prov = context.read(visualNoteProvider);
      await prov.getVisualNotes();
      final data = prov.visualNotesList;

      log(data.map((e) => e.toMap()).toList().toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        title: 'Visual Notes',
        back: false,
      ),
      body: Consumer(
        builder: (context, watch, _) {
          final prov = watch(visualNoteProvider);
          return prov.loading
              ? Center(child: CircularProgressIndicator())
              : prov.visualNotesList.isEmpty
                  ? Center(
                      child: Text('No Visual Notes Added Yet!',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),),
                    )
                  : ListView.builder(
                      itemCount: prov.visualNotesList.length,
                      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            CustomNavigator.pushScreen(
                                widget:
                                    VisualNoteDetail(visualNoteModel: prov.visualNotesList[index]),
                                context: context);
                          },
                          child: Card(
                            margin: EdgeInsets.symmetric(vertical: 10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            elevation: 3.0,
                            child: _customListTile(prov.visualNotesList[index]),
                          ),
                        );
                      },
                    );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomRoundedButton(
        text: 'New Visual Note',
        height: 50,
        width: 150,
        textColor: ColorsUtils.whiteColor,
        pressed: () async {
          CustomNavigator.pushScreen(widget: AddVisualNote(), context: context);
        },
      ),
    );
  }

  Widget _customListTile(VisualNoteModel visualNoteModel) {
    String formattedDate =
        DateFormat('yyyy-MM-dd  |  hh:mm a').format(DateTime.parse(visualNoteModel.date!));
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      title: Text(
        visualNoteModel.title!,
        style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        maxLines: 1,
      ),
      subtitle: Text(
        formattedDate,
        style: TextStyle(fontWeight: FontWeight.w700),
        maxLines: 1,
      ),
      leading: CircleAvatar(
        backgroundImage: FileImage(
          File(visualNoteModel.picture!),
        ),
        radius: 35,
      ),
      trailing: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Icon(
          Icons.circle,
          size: 15,
          color: visualNoteModel.status! ? Colors.green : Colors.red,
        ),
      ),
    );
  }
}
