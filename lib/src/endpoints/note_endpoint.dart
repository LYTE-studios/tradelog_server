import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class NoteEndpoint extends Endpoint { 
  @override
  bool get requireLogin => true;

  Future<void> addNote(Session session, Note note) async { 
    await Note.db.insertRow(session, note);
  }

  Future<void> deleteNote(Session session, Note note) async { 
    await Note.db.deleteRow(session, note);
  }

  Future<void> updateNote(Session session, Note note) async { 
    await Note.db.updateRow(session, note);
  }

  Future<List<Note>> getNotes(Session session) async { 
    return await Note.db.find(session);
  }
}