import 'package:sqflite/sqflite.dart';

/// BEGIN ADDEVENT
Future performAddEvent(
  Database database, {
  String? name,
  String? desc,
  int? status,
}) {
  final query = '''
INSERT INTO Events (name, desc, status) VALUES ('$name', '$desc',$status);
''';
  return database.rawQuery(query);
}

/// END ADDEVENT
