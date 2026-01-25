import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';

import '../factories/logger.dart';
import '../usecases/file/get_database_directory.dart';

class DatabaseClient {
  static Database? _instance;
  static final _logger = createSdkLogger('DatabaseClient');

  static const String _dbFileName = 'mala.db';
  static const int _dbVersion = 1;

  DatabaseClient._();

  static Future<Database> getInstance() async {
    if (_instance != null) return _instance!;

    final dir = await getDatabaseDirectory();
    final dbPath = p.join(dir.path, _dbFileName);

    _logger.i('Opening database at: $dbPath');
    _instance = sqlite3.open(dbPath);

    await _initializeDatabase(_instance!);
    return _instance!;
  }

  static Future<void> _initializeDatabase(Database db) async {
    db.execute('PRAGMA foreign_keys = ON');
    db.execute('PRAGMA journal_mode = WAL');

    final result = db.select('PRAGMA user_version');
    final currentVersion = result.first['user_version'] as int;

    if (currentVersion == 0) {
      _logger.i('Creating new database schema');
      await _createSchema(db);
      db.execute('PRAGMA user_version = $_dbVersion');
    } else if (currentVersion < _dbVersion) {
      _logger.i('Migrating database from version $currentVersion to $_dbVersion');
      await _migrateDatabase(db, currentVersion, _dbVersion);
      db.execute('PRAGMA user_version = $_dbVersion');
    }
  }

  static Future<void> _createSchema(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS addresses (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        zip_code TEXT,
        state TEXT,
        city TEXT,
        district TEXT,
        street TEXT,
        number TEXT,
        complement TEXT
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS patients (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        remote_id TEXT UNIQUE,
        has_picture INTEGER,
        name TEXT,
        cpf TEXT,
        mother_name TEXT,
        observation TEXT,
        year_of_birth INTEGER,
        month_of_birth INTEGER,
        day_of_birth INTEGER,
        created_at TEXT,
        updated_at TEXT,
        address_id INTEGER,
        FOREIGN KEY (address_id) REFERENCES addresses(id) ON DELETE SET NULL
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS patient_activities (
        patient_id INTEGER NOT NULL,
        activity_id INTEGER NOT NULL,
        PRIMARY KEY (patient_id, activity_id),
        FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
      )
    ''');

    db.execute('''
      CREATE TABLE IF NOT EXISTS patient_phones (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        patient_id INTEGER NOT NULL,
        phone_number TEXT NOT NULL,
        FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE
      )
    ''');

    _createIndexes(db);
  }

  static void _createIndexes(Database db) {
    final indexes = [
      'CREATE UNIQUE INDEX IF NOT EXISTS idx_patients_remote_id ON patients(remote_id)',
      'CREATE INDEX IF NOT EXISTS idx_patients_name ON patients(name COLLATE NOCASE)',
      'CREATE INDEX IF NOT EXISTS idx_patients_cpf ON patients(cpf)',
      'CREATE INDEX IF NOT EXISTS idx_patients_year_of_birth ON patients(year_of_birth)',
      'CREATE INDEX IF NOT EXISTS idx_patients_month_of_birth ON patients(month_of_birth)',
      'CREATE INDEX IF NOT EXISTS idx_patients_day_of_birth ON patients(day_of_birth)',
      'CREATE INDEX IF NOT EXISTS idx_patients_created_at ON patients(created_at)',
      'CREATE INDEX IF NOT EXISTS idx_patients_updated_at ON patients(updated_at)',
      'CREATE INDEX IF NOT EXISTS idx_patients_address_id ON patients(address_id)',
      'CREATE INDEX IF NOT EXISTS idx_patients_birthday ON patients(month_of_birth, day_of_birth)',
      'CREATE INDEX IF NOT EXISTS idx_addresses_district ON addresses(district COLLATE NOCASE)',
      'CREATE INDEX IF NOT EXISTS idx_addresses_street ON addresses(street COLLATE NOCASE)',
    ];

    for (final index in indexes) {
      db.execute(index);
    }
  }

  static Future<void> _migrateDatabase(Database db, int from, int to) async {
    _logger.w('No migrations defined yet');
  }

  static void close() {
    if (_instance != null) {
      _instance!.close();
      _instance = null;
      _logger.i('Database connection closed');
    }
  }

  static Future<void> deleteDatabase() async {
    close();
    final dir = await getDatabaseDirectory();
    final dbPath = p.join(dir.path, _dbFileName);
    final file = File(dbPath);
    if (file.existsSync()) {
      await file.delete();
      _logger.i('Database deleted: $dbPath');
    }
  }
}
