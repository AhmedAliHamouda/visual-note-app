import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:visual_notes/Helpers/db_helper.dart';
import 'package:visual_notes/Models/visual_note_model.dart';

final visualNoteProvider =
    ChangeNotifierProvider<VisualNoteProvider>((ref) => VisualNoteProvider());

class VisualNoteProvider extends ChangeNotifier {
  bool _loading = false;

  List<VisualNoteModel> _visualNotesList = [];

  List<VisualNoteModel> get visualNotesList => _visualNotesList;

  set visualNotesList(List<VisualNoteModel> value) {
    _visualNotesList = value;
    notifyListeners();
  }

  bool get loading => _loading;

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> getVisualNotes() async {
    loading = true;

    try {
      final data = await DBHelper.getData();
      _visualNotesList = data.map((e) => VisualNoteModel.fromMap(e)).toList();
      loading = false;
    } catch (error) {
      loading = false;
    }
  }

  Future<bool> addNewVisual(VisualNoteModel visualNoteModel) async {
    try {
      await DBHelper.insert(data: visualNoteModel.toMap());
      await getVisualNotes();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> editVisualNote(VisualNoteModel visualNoteModel) async {
    try {
      await DBHelper.update(values: visualNoteModel.toMap(), noteId: '${visualNoteModel.id}');
      await getVisualNotes();
      return true;
    } catch (error) {
      return false;
    }
  }

  Future<bool> deleteVisualNote({required int visualNoteId}) async {
    try {
      await DBHelper.delete(visualNoteId);
      await getVisualNotes();
      return true;
    } catch (error) {
      return false;
    }
  }
}
