# Weather App README

## Overview

This Weather App provides real-time weather information using the `weather` package and OpenWeatherMap API. Users can view the current weather for a predefined location and toggle between Celsius and Fahrenheit units. The app is built with Flutter and designed to be easy to set up and customize.

---

## Features

- Real-time weather updates.
- Support for both Celsius and Fahrenheit temperature units.
- Clean and responsive UI with theme customization.

---

## Prerequisites

Before you begin, ensure you have met the following requirements:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.
- An editor such as [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).
- API key for OpenWeatherMap.

---

## Setup Instructions

### 1. Clone the Repository

Clone the repository to your local machine:

```bash
git clone <https://github.com/tarikbinaziz/weather_app.git>
cd <repository-folder>
```

### 2. Install Dependencies

Run the following command to fetch the required packages:

```bash
flutter pub get
```

### 3. API Key Setup

Replace the placeholder API key in the `AppConstants` class with your OpenWeatherMap API key:

```dart
static const String weatherFactoryKey = "<YOUR_API_KEY_HERE>";
```

### 4. Run the Application

To run the app on an emulator or physical device, execute:

```bash
flutter run
```

---

## Application Structure

### Constants

The `AppConstants` class contains essential constants:

- **API Endpoint:** URL for the OpenWeatherMap API.
- **API Key:** Replace with your key to fetch weather data.


```dart
static const String currentWeatherUrl = 'https://api.openweathermap.org/data/2.5/weather?lat=';
static const String weatherFactoryKey = "<YOUR_API_KEY>";

```

### Theme Colors

The `AppColor` class defines the app’s color scheme:

- `primaryColor`: Main color for the UI.
- `secondaryColor`: Supporting accent color.
- Additional colors for text, backgrounds, and weather icons.

```dart
static const Color primaryColor = Color(0xFF123597);
static const Color sunColor = Color(0xFFFFD700);
```

---

## Packages Used

- `weather`: For fetching and parsing weather data.
- `Riverpod` (or state management of your choice): To manage app state.

---


## Customization

### Modify Colors

Adjust the theme in the `AppColor` class:

```dart
static const Color primaryColor = Color(<NEW_COLOR_CODE>);
```







