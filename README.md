# Mala SDK

A comprehensive Dart SDK for managing patient data in healthcare clinics. **Mala** is a lightweight patient management system designed for small health clinics, providing seamless offline-first functionality with intelligent background synchronization.

## Overview

Mala SDK is a data management layer that integrates with the Mala API, enabling front-end applications to:

- **Authenticate users** and manage user sessions
- **Manage patient data** including personal information, medical activities, and photos
- **Work offline** with automatic sync when connectivity is restored
- **Export/import data** for backup and inter-clinic data sharing
- **Generate PDFs** for patient information and address labels
- **Search and filter** patients by various criteria

The SDK is built on a **hybrid architecture** combining local-first storage with intelligent server synchronization.

## Features

### 🔐 Authentication
- JWT-based user authentication
- Token persistence and automatic validation
- Secure login/logout with token refresh

### 👥 Patient Management
- Create, update, delete patients with full personal details
- Attach profile pictures to patient records
- Track healthcare activities (physical therapy, nutrition, etc.)
- Search and filter patients by name, age, location, and activities

### 📱 Offline-First
- Full offline capability using local database (Isar)
- Automatic background sync when connected
- Throttled operations prevent duplicate requests
- Pending operations queue for resilient data handling

### 📊 Data Synchronization
- Incremental sync fetches only changed records
- Automatic retry on network failures
- Compression for efficient data transfer
- Customizable sync notifications and error handling

### 📤 Import/Export
- Export patient data to files for backup or transfer
- Import patient data from external sources
- Progress tracking for long-running operations

### 📄 PDF Generation
- Generate and share patient information reports
- Create customizable address labels for mailing
- Configurable label dimensions, margins, and spacing

## Quick Start

### Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  mala_api: latest_version
```

### Basic Usage

```dart
import 'package:mala_api/mala_api.dart';

// Login
await MalaApi.user.login('user@clinic.com', 'password');

// Check if authenticated
if (MalaApi.user.isLogged) {
  print('User authenticated');
}

// Create a patient
var patient = Patient(
  name: 'João Silva',
  cpf: '123.456.789-00',
  motherName: 'Maria Silva',
  yearOfBirth: 1990,
  monthOfBirth: 5,
  dayOfBirth: 15,
);

await MalaApi.patient.upsert(patient);

// Search patients
var results = await MalaApi.patient.list(
  query: PatientQuery(name: 'João'),
  limit: 20,
);

// Logout
await MalaApi.user.logout();
```

## Core Modules

### UserModule
Handles authentication and user session management.

```dart
// Login
await MalaApi.user.login(email, password);

// Check authentication status
bool isLogged = MalaApi.user.isLogged;

// Logout
await MalaApi.user.logout();
```

### PatientModule
Manages all patient data operations.

```dart
// Create or update patient
await MalaApi.patient.upsert(patient, pictureBytes);

// Delete patient
await MalaApi.patient.delete(patient);

// Query patients
var patients = await MalaApi.patient.list(
  query: PatientQuery(
    name: 'João',
    minAge: 18,
    maxAge: 65,
    monthBirthday: true,
    activities: {Activities.physicalTherapy},
  ),
  skip: 0,
  limit: 50,
);

// Count matching patients
int count = await MalaApi.patient.count(query);

// Manage patient pictures
await MalaApi.patient.savePicture(patientId, imageBytes);
var picture = await MalaApi.patient.loadPicture(patient);

// Search addresses by postal code
var address = await MalaApi.patient.searchCep('01310-100');
```

### ServerModule
Manages data synchronization with the API.

```dart
// Sync all changes
await MalaApi.server.sync(
  uiNotifier: (message) {
    print('Sync: $message'); // Shows sync progress
  },
  shouldAbort: () {
    return userCancelledSync; // Can abort mid-sync
  },
  errorNotifier: (context, message) {
    showErrorDialog(message);
  },
);
```

### FileModule
Export and import patient data.

```dart
// Export patients to file
await MalaApi.file.export(
  query: PatientQuery(activities: {Activities.physicalTherapy}),
  outputDir: '/path/to/export',
  onProgress: ({
    required String event,
    required double progress,
    required String message,
  }) {
    print('$event: ${(progress * 100).toStringAsFixed(2)}%');
  },
);

// Import patients from file
await MalaApi.file.import(
  '/path/to/file.zip',
  onProgress: (progress) {
    print('Import: ${(progress * 100).toStringAsFixed(2)}%');
  },
);
```

### PdfModule
Generate and share PDF documents.

```dart
// Generate patient information PDF
var patients = await MalaApi.patient.list(query: PatientQuery());
await MalaApi.pdf.printInfo(patients: patients);

// Generate address labels PDF
var tags = patients
    .map((p) => PatientTag(
      name: p.name,
      address: p.address,
    ))
    .toList();
await MalaApi.pdf.printTags(tags: tags);
```

### TagPdfConfiguration
Customize patient label/tag PDF formatting.

```dart
// Configure label dimensions and layout
MalaApi.tagPdfConfig.setWidth(100);
MalaApi.tagPdfConfig.setHeight(50);
MalaApi.tagPdfConfig.setHorizontalSpacing(10);
MalaApi.tagPdfConfig.setVerticalSpacing(5);
MalaApi.tagPdfConfig.setMargins(
  top: 10,
  bottom: 10,
  left: 5,
  right: 5,
);
```

## Data Models

### Patient
Represents a patient in the clinic.

**Fields:**
- `id` - Auto-incremented local ID
- `remoteId` - Server-side ID (indexed for sync)
- `name` - Patient name
- `cpf` - Brazilian national ID
- `phones` - List of contact phone numbers
- `motherName` - Mother's full name
- `observation` - Medical notes
- `yearOfBirth`, `monthOfBirth`, `dayOfBirth` - Birth date components
- `activitiesId` - Linked activities/treatments
- `address` - Full address details
- `hasPicture` - Whether profile picture exists
- `createdAt`, `updatedAt` - Timestamps
- `uploadedAt` - Server upload timestamp

**Computed Properties:**
- `birthDate` - Full birth date
- `years` - Current age
- `hasBirthdayThisMonth` - Boolean
- `isBirthdayToday` - Boolean

### Address
Patient's full address.

**Fields:**
- `zipCode`, `state`, `city`, `district`, `street`, `number`, `complement`

### PatientQuery
Search and filter criteria for patient queries.

**Fields:**
- `name` - Filter by name
- `district`, `street` - Location filters
- `minAge`, `maxAge` - Age range
- `monthBirthday` - Show only birthdays this month
- `activities` - Filter by healthcare activities

### Activities
Enum of healthcare/wellness activities available:

- `physicalTherapy` - Fisioterapia
- `waterAerobics` - Hidroginástica
- `pilates` - Pilates
- `psychologist` - Psicólogo
- `nutrition` - Nutrição
- `massageTherapy` - Massoterapia
- `doctor` - Médico
- `health` - Saúde
- `others` - Outros
- `qualivida` - Qualivida

## Architecture

### Hybrid Operation Mode

The SDK operates in **hybrid mode** by default, combining:

1. **Local-First Storage** - Data is saved immediately to Isar database
2. **Background Sync** - Changes are uploaded to server asynchronously
3. **Offline Support** - Full functionality when disconnected
4. **Automatic Retry** - Failed operations are retried when connectivity returns

### Data Flow

```
User Action
    ↓
Local Database (Isar) ← Immediate
    ↓
Background Upload → API
    ↓
Sync Notification/Error Callback
```

### Storage

- **Local Database**: Isar (NoSQL, fast, offline-capable)
- **Key-Value Store**: SharedPreferences (JWT, settings, pending ops)
- **File System**: Images and export files

## Configuration

### Operation Mode

```dart
import 'package:mala_api/src/data/models/configuration.dart';

// Change operation mode
Configuration.mode = AppOperationMode.hybrid;  // Default
Configuration.mode = AppOperationMode.offline; // Local only
Configuration.mode = AppOperationMode.online;  // API only
```

### API Endpoint

```dart
// Update API server URL
Configuration.updateUrl('https://your-api.com/');
```

### Debug Mode

```dart
// Enable debug logging
Configuration.isDebugMode = true;
```

## Synchronization Details

### Sync Workflow

1. **Validates** user authentication
2. **Refreshes** JWT token
3. **Fetches** changed patients from server (new, updated, deleted)
4. **Processes** changes in chunks for large datasets
5. **Sends** pending local patients to server
6. **Retries** failed background operations
7. **Provides** UI notifications at each stage
8. **Logs** errors for debugging

### Handling Pending Operations

When network is unavailable, patient operations are queued:

```dart
// These are automatically retried when sync runs
await MalaApi.patient.upsert(patient); // Queued if offline
await MalaApi.patient.delete(patient); // Queued if offline

// Manually retry pending operations
await MalaApi.server.sync(...);
```

### Streaming Updates

Subscribe to patient operation streams for real-time UI updates:

```dart
// Listen for uploaded patients
MalaApi.patient.patientUploadController.stream.listen((patient) {
  print('Patient uploaded: ${patient.name}');
});

// Listen for deleted patients
MalaApi.patient.patientDeletedController.stream.listen((patientId) {
  print('Patient deleted: $patientId');
});
```

## Error Handling

Errors are handled gracefully with fallback to offline mode:

```dart
try {
  await MalaApi.server.sync(
    uiNotifier: (msg) => print(msg),
    shouldAbort: () => false,
    errorNotifier: (context, error) {
      print('Sync error: $error');
      // Continue with offline data
    },
  );
} catch (e) {
  print('Fatal error: $e');
  // App continues to work with local data
}
```

## Best Practices

### Before Using the SDK

1. **Initialize** by logging in:
   ```dart
   await MalaApi.user.login(email, password);
   ```

2. **Check authentication** regularly:
   ```dart
   if (!MalaApi.user.isLogged) {
     // Redirect to login
   }
   ```

### When Managing Patients

1. **Attach pictures** during creation:
   ```dart
   var imageBytes = await pickImage();
   await MalaApi.patient.upsert(patient, imageBytes);
   ```

2. **Use queries** for efficient filtering:
   ```dart
   var query = PatientQuery(
     minAge: 18,
     activities: {Activities.physicalTherapy},
   );
   var patients = await MalaApi.patient.list(query: query);
   ```

3. **Paginate** large datasets:
   ```dart
   var page1 = await MalaApi.patient.list(skip: 0, limit: 50);
   var page2 = await MalaApi.patient.list(skip: 50, limit: 50);
   ```

### Synchronization

1. **Sync regularly** during clinic operations:
   ```dart
   // Run daily or on app startup
   await MalaApi.server.sync(...);
   ```

2. **Handle aborts** gracefully:
   ```dart
   bool shouldAbort = false;
   
   await MalaApi.server.sync(
     shouldAbort: () => shouldAbort,
     ...
   );
   
   // User can set shouldAbort = true to cancel
   ```

3. **Monitor progress** via UI notifications:
   ```dart
   await MalaApi.server.sync(
     uiNotifier: (message) {
       updateUI('Syncing: $message');
     },
     ...
   );
   ```

## Dependencies

- **dio** - HTTP client for API communication
- **isar** - Local NoSQL database
- **shared_preferences** - Persistent key-value storage
- **jwt_decoder** - JWT token validation
- **pdf** - PDF generation
- **printing** - Print and share functionality
- **search_cep** - Brazilian postal code lookup
- **archive** - ZIP compression for sync
- **get_it** - Dependency injection

## Requirements

- Dart 3.0+
- Flutter 3.0+

## API Reference

Complete API documentation is available in the source code. Key entry point: `lib/mala_api.dart`

## Support

For issues or feature requests, please refer to the project repository.

## License

See LICENSE file for details.
