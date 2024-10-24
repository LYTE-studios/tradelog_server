import 'package:serverpod/serverpod.dart';
import 'package:tradelog_server/src/generated/protocol.dart';

class NoteEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Note> getNoteForDate(Session session, DateTime date) async {
    AuthenticationInfo? info = await session.authenticated;

    assert(info?.userId != null);

    date = DateTime(date.year, date.month, date.day);

    Note? note = (await Note.db.find(
      session,
      where: (t) => t.date.equals(date),
    ))
        .firstOrNull;

    return note ??
        Note(
          content: '',
          userId: info!.userId,
          date: date,
        );
  }

  Future<void> deleteNote(Session session, Note note) async {
    await Note.db.deleteRow(session, note);
  }

  Future<void> updateNote(Session session, Note note) async {
    if (note.id == null) {
      note = await Note.db.insertRow(session, note);
    } else {
      await Note.db.updateRow(session, note);
    }
  }

  Future<List<Note>> getNotes(Session session) async {
    return await Note.db.find(session);
  }
}
