import 'package:drift/drift.dart';

class Products extends Table {
  TextColumn get name => text().withLength(min: 1, max: 50)();
  IntColumn get id => integer().customConstraint('UNIQUE')();
  IntColumn get count => integer()();
  RealColumn get price => real()();
  IntColumn get categoryNumber => integer()();
}
