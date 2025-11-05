// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE',
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryNumberMeta = const VerificationMeta(
    'categoryNumber',
  );
  @override
  late final GeneratedColumn<int> categoryNumber = GeneratedColumn<int>(
    'category_number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    name,
    id,
    count,
    price,
    categoryNumber,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(
    Insertable<Product> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('category_number')) {
      context.handle(
        _categoryNumberMeta,
        categoryNumber.isAcceptableOrUnknown(
          data['category_number']!,
          _categoryNumberMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNumberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      categoryNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_number'],
      )!,
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final String name;
  final int id;
  final int count;
  final double price;
  final int categoryNumber;
  const Product({
    required this.name,
    required this.id,
    required this.count,
    required this.price,
    required this.categoryNumber,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['name'] = Variable<String>(name);
    map['id'] = Variable<int>(id);
    map['count'] = Variable<int>(count);
    map['price'] = Variable<double>(price);
    map['category_number'] = Variable<int>(categoryNumber);
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      name: Value(name),
      id: Value(id),
      count: Value(count),
      price: Value(price),
      categoryNumber: Value(categoryNumber),
    );
  }

  factory Product.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      name: serializer.fromJson<String>(json['name']),
      id: serializer.fromJson<int>(json['id']),
      count: serializer.fromJson<int>(json['count']),
      price: serializer.fromJson<double>(json['price']),
      categoryNumber: serializer.fromJson<int>(json['categoryNumber']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'name': serializer.toJson<String>(name),
      'id': serializer.toJson<int>(id),
      'count': serializer.toJson<int>(count),
      'price': serializer.toJson<double>(price),
      'categoryNumber': serializer.toJson<int>(categoryNumber),
    };
  }

  Product copyWith({
    String? name,
    int? id,
    int? count,
    double? price,
    int? categoryNumber,
  }) => Product(
    name: name ?? this.name,
    id: id ?? this.id,
    count: count ?? this.count,
    price: price ?? this.price,
    categoryNumber: categoryNumber ?? this.categoryNumber,
  );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      name: data.name.present ? data.name.value : this.name,
      id: data.id.present ? data.id.value : this.id,
      count: data.count.present ? data.count.value : this.count,
      price: data.price.present ? data.price.value : this.price,
      categoryNumber: data.categoryNumber.present
          ? data.categoryNumber.value
          : this.categoryNumber,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('price: $price, ')
          ..write('categoryNumber: $categoryNumber')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(name, id, count, price, categoryNumber);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.name == this.name &&
          other.id == this.id &&
          other.count == this.count &&
          other.price == this.price &&
          other.categoryNumber == this.categoryNumber);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<String> name;
  final Value<int> id;
  final Value<int> count;
  final Value<double> price;
  final Value<int> categoryNumber;
  final Value<int> rowid;
  const ProductsCompanion({
    this.name = const Value.absent(),
    this.id = const Value.absent(),
    this.count = const Value.absent(),
    this.price = const Value.absent(),
    this.categoryNumber = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsCompanion.insert({
    required String name,
    required int id,
    required int count,
    required double price,
    required int categoryNumber,
    this.rowid = const Value.absent(),
  }) : name = Value(name),
       id = Value(id),
       count = Value(count),
       price = Value(price),
       categoryNumber = Value(categoryNumber);
  static Insertable<Product> custom({
    Expression<String>? name,
    Expression<int>? id,
    Expression<int>? count,
    Expression<double>? price,
    Expression<int>? categoryNumber,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (name != null) 'name': name,
      if (id != null) 'id': id,
      if (count != null) 'count': count,
      if (price != null) 'price': price,
      if (categoryNumber != null) 'category_number': categoryNumber,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsCompanion copyWith({
    Value<String>? name,
    Value<int>? id,
    Value<int>? count,
    Value<double>? price,
    Value<int>? categoryNumber,
    Value<int>? rowid,
  }) {
    return ProductsCompanion(
      name: name ?? this.name,
      id: id ?? this.id,
      count: count ?? this.count,
      price: price ?? this.price,
      categoryNumber: categoryNumber ?? this.categoryNumber,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (categoryNumber.present) {
      map['category_number'] = Variable<int>(categoryNumber.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('name: $name, ')
          ..write('id: $id, ')
          ..write('count: $count, ')
          ..write('price: $price, ')
          ..write('categoryNumber: $categoryNumber, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [products];
}

typedef $$ProductsTableCreateCompanionBuilder =
    ProductsCompanion Function({
      required String name,
      required int id,
      required int count,
      required double price,
      required int categoryNumber,
      Value<int> rowid,
    });
typedef $$ProductsTableUpdateCompanionBuilder =
    ProductsCompanion Function({
      Value<String> name,
      Value<int> id,
      Value<int> count,
      Value<double> price,
      Value<int> categoryNumber,
      Value<int> rowid,
    });

class $$ProductsTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get categoryNumber => $composableBuilder(
    column: $table.categoryNumber,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductsTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get categoryNumber => $composableBuilder(
    column: $table.categoryNumber,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsTable> {
  $$ProductsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<int> get categoryNumber => $composableBuilder(
    column: $table.categoryNumber,
    builder: (column) => column,
  );
}

class $$ProductsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductsTable,
          Product,
          $$ProductsTableFilterComposer,
          $$ProductsTableOrderingComposer,
          $$ProductsTableAnnotationComposer,
          $$ProductsTableCreateCompanionBuilder,
          $$ProductsTableUpdateCompanionBuilder,
          (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
          Product,
          PrefetchHooks Function()
        > {
  $$ProductsTableTableManager(_$AppDatabase db, $ProductsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> name = const Value.absent(),
                Value<int> id = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<int> categoryNumber = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion(
                name: name,
                id: id,
                count: count,
                price: price,
                categoryNumber: categoryNumber,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String name,
                required int id,
                required int count,
                required double price,
                required int categoryNumber,
                Value<int> rowid = const Value.absent(),
              }) => ProductsCompanion.insert(
                name: name,
                id: id,
                count: count,
                price: price,
                categoryNumber: categoryNumber,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductsTable,
      Product,
      $$ProductsTableFilterComposer,
      $$ProductsTableOrderingComposer,
      $$ProductsTableAnnotationComposer,
      $$ProductsTableCreateCompanionBuilder,
      $$ProductsTableUpdateCompanionBuilder,
      (Product, BaseReferences<_$AppDatabase, $ProductsTable, Product>),
      Product,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
}
