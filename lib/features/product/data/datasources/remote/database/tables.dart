import 'package:drift/drift.dart';

class Products extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get count => integer()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
}
