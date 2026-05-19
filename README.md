# Wasel / واصل

Ride-hailing and trusted delivery app for the Libyan market.

## 🚀 Getting Started

### Prerequisites

- Flutter 3.27+
- Firebase Project
- Google Maps API Key

### Installation

1. Clone the repository
2. Run `flutter pub get`
3. Add your API keys in `lib/core/constants/app_constants.dart`
4. Setup Firebase for Android and iOS

### API Configuration

You need to provide the following API keys in `lib/core/constants/app_constants.dart`:
- `googleMapsApiKey`
- `googlePlacesApiKey`
- `googleDistanceMatrixApiKey`

## 🏗️ Project Structure

```
lib/
├── core/
│   ├── constants/
│   ├── themes/
│   ├── translations/
│   ├── services/
│   └── utils/
├── data/
│   ├── models/
│   ├── repositories/
│   └── providers/
├── domain/
│   ├── entities/
│   └── usecases/
├── presentation/
│   ├── controllers/
│   ├── pages/
│   └── widgets/
├── routes/
└── bindings/
```

## 🛠️ Tech Stack

- **State Management:** GetX
- **Database:** Cloud Firestore
- **Local Storage:** Hive
- **Authentication:** Firebase Phone Auth
- **Maps:** Google Maps Flutter SDK

## 🌍 Localization

Supported languages:
- Arabic (Default)
- English
