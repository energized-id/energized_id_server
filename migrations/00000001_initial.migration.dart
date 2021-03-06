import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    database.createTable(SchemaTable("StudentTable", [
      SchemaColumn("id", ManagedPropertyType.integer,
          isPrimaryKey: true,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("firstName", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("lastName", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("gradeLevel", ManagedPropertyType.integer,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("lastPrinted", ManagedPropertyType.datetime,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: true,
          isUnique: false)
    ]));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {
    const students = [
      {
        "id": 1540120,
        "firstName": "Kai",
        "lastName": "Page",
        "gradeLevel": 11,
      },
      {
        "id": 1659616,
        "firstName": "Micah",
        "lastName": "Guttman",
        "gradeLevel": 9
      },
    ];

    for (final student in students) {
      await store.execute(
          "INSERT INTO StudentTable (id, firstName, lastName, gradeLevel) "
          "VALUES (@id, @firstName, @lastName, @gradeLevel);",
          substitutionValues: student);
    }
  }
}
