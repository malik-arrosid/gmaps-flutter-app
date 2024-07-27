# GMaps Flutter App

A Flutter application integrating Google Maps for location-based functionalities.

## Features

- Display Google Map
- Show user’s current location
- Add markers
- Custom map styling
- Map interactions (zoom, pan, etc.)

## Installation

1. **Clone the repository**
    ```bash
    git clone https://github.com/malik-arrosid/gmaps-flutter-app.git
    cd gmaps-flutter-app
    ```

2. **Get dependencies**
    ```bash
    flutter pub get
    ```

3. **Set up Google Maps API Key**
    - Get an API Key from [Google Cloud Platform](https://console.cloud.google.com/).
    - Add the API Key in `android/app/src/main/AndroidManifest.xml` and `ios/Runner/AppDelegate.swift`:
        ```xml
        <meta-data
            android:name="com.google.android.geo.API_KEY"
            android:value="YOUR_API_KEY"/>
        ```

4. **Run the app**
    ```bash
    flutter run
    ```

## Usage

- **Zoom In/Out**: Use pinch gestures or buttons on the UI.
- **Pan**: Drag the map to explore different areas.
- **Add Marker**: Long press on the map to add a marker.
