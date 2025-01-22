# SQLiteApiAuth - Flutter Login Application

A Flutter-based mobile application that implements user authentication and profile management using a REST API and local SQLite storage.

## Features

- User authentication with API integration 
- Local data persistence using SQLite
- Profile screen with user information display
- Clean and responsive UI design
- Session management
- Error handling and loading states

## Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code
- An Android or iOS device/emulator

## Dependencies

Add these to your `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^1.1.0
  sqflite: ^2.3.0
  path: ^1.8.3
```

## Project Structure

```
lib/
  ├── models/
  │   └── user.dart           # User data model
  ├── services/
  │   ├── api_service.dart    # API integration service
  │   └── database_helper.dart # SQLite database service
  ├── screens/
  │   ├── login_screen.dart   # Login UI screen
  │   └── profile_screen.dart # Profile UI screen
  └── main.dart              # App entry point
```

## Installation

1. Clone the repository:
```bash
git clone https://github.com/nimeshdkumarawansha/sqlite_api_auth
```

2. Navigate to the project directory:
```bash
cd sqlite_api_auth
```

3. Get dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## API Integration

The app integrates with the following API endpoint:
```
URL: https://api.ezuite.com/api/External_Api/Mobile_Api/Invoke
```

### Sample API Request
```json
{
  "API_Body": [
    {
      "Unique_Id": "",
      "Pw": "Welcome#5"
    }
  ],
  "Api_Action": "GetUserData",
  "Company_Code": "info@enhanzer.com"
}
```

### Test Credentials

- Username: info@enhanzer.com
- Password: Welcome#5

## Database Schema

SQLite database table structure:

```sql
CREATE TABLE users(
  userCode TEXT PRIMARY KEY,
  displayName TEXT,
  email TEXT,
  employeeCode TEXT,
  companyCode TEXT
)
```

## Key Features Implementation

### Login Screen
- Form validation for username and password
- Loading state management during API calls
- Error handling and success messages
- Secure password field
- Navigation to profile screen upon successful login

### Profile Screen
- Display user information in organized cards
- Show user locations and permissions
- Logout functionality
- Clean and responsive layout
- Data persistence using SQLite

## License

This project is licensed under the MIT License - see the LICENSE.md file for details

## Acknowledgments

- Flutter documentation
- SQLite documentation
- HTTP package documentation
