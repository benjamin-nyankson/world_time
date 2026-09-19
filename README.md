# World Time App

A Flutter-based world time application that allows users to search for locations around the world and view their current local time. The app uses timezone APIs and country flags to provide a simple and interactive global time experience.

🔗 **Live Demo:** https://worldtime-15187.web.app/

## Features

* View the current time for different locations around the world
* Search for cities and timezones
* Select a location and update the displayed time
* Display country flags for supported locations
* Automatically determine whether it is daytime or nighttime
* Fetch live timezone data from an external API
* Responsive Flutter UI
* Supports Flutter Web and mobile platforms

## Built With

* Flutter
* Dart
* HTTP package
* REST API
* FlagCDN for country flags

## How It Works

The application stores a list of supported timezones and their corresponding country flags.

When a user selects a location:

1. The app retrieves the selected timezone.
2. A request is sent to the World Time API.
3. The current local time is calculated from the returned data.
4. The app determines whether the location is currently in daytime or nighttime.
5. The result is passed back to the home screen.

## Project Structure

```text
lib/
├── constants/
│   └── time_zones_with_flags.dart
├── pages/
│   ├── choose_location.dart
│   ├── home.dart
│   └── loading.dart
├── services/
│   └── world_time.dart
└── main.dart
```

## Getting Started

### Prerequisites

Make sure Flutter is installed on your machine.

Check your Flutter installation:

```bash
flutter doctor
```

### Clone the Repository

```bash
git clone <your-repository-url>
```

Navigate into the project:

```bash
cd world_time
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Run on Web

```bash
flutter run -d chrome
```

To create a production web build:

```bash
flutter build web
```

The generated files will be available inside:

```text
build/web
```

## Deployment

The Flutter web version can be deployed using Firebase Hosting.

Build the project:

```bash
flutter build web
```

Then deploy:

```bash
firebase deploy --only hosting
```

## API

The application uses a timezone API to retrieve the current time for selected locations.

Example timezone:

```text
Europe/London
```

Other supported timezone identifiers include:

```text
Africa/Accra
America/New_York
Asia/Tokyo
Australia/Sydney
```

## Future Improvements

* Add location favorites
* Add recently viewed locations
* Add automatic location detection
* Add improved error handling for failed API requests
* Add dark mode
* Add offline caching
* Add more detailed timezone information
* Improve search and filtering

## Author

**Benjamin Nyankson**

Flutter learning project focused on working with APIs, asynchronous programming, navigation, state management, and dynamic UI rendering.
