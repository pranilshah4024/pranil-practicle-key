import '/backend/sqlite/queries/sqlite_row.dart';
import 'package:sqflite/sqflite.dart';

Future<List<T>> _readQuery<T>(
  Database database,
  String query,
  T Function(Map<String, dynamic>) create,
) =>
    database.rawQuery(query).then((r) => r.map((e) => create(e)).toList());

/// BEGIN GETEVENTS
Future<List<GetEventsRow>> performGetEvents(
  Database database,
) {
  const query = '''
Select * from Events
''';
  return _readQuery(database, query, (d) => GetEventsRow(d));
}

class GetEventsRow extends SqliteRow {
  GetEventsRow(super.data);

  int get id => data['Id'] as int;
  String get name => data['name'] as String;
  String get desc => data['desc'] as String;
  int get status => data['status'] as int;
}

/// END GETEVENTS
