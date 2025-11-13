import 'package:drift/drift.dart';

class Products extends Table {
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get id => integer().autoIncrement()();
  IntColumn get count => integer()();
  RealColumn get price => real()();
  TextColumn get category => text().withLength(min: 1, max: 50)();
}
