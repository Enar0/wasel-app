# Wasel - Smart Ride-Hailing & Trusted Delivery App for Libya

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-3.27+-blue.svg" alt="Flutter">
  <img src="https://img.shields.io/badge/GetX-State%20Management-orange.svg" alt="GetX">
  <img src="https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green.svg" alt="Platform">
  <img src="https://img.shields.io/badge/License-MIT-yellow.svg" alt="License">
</p>

## 📱 About The Project

**Wasel** is a comprehensive Flutter application designed to solve transportation and trusted delivery problems in the Libyan market. The app combines ride-hailing services (like Uber) with trusted item delivery, featuring full support for Libyan electronic payment gateways.

### Key Features

| Service | Description |
|---------|-------------|
| 🚗 **Ride Hailing** | One-tap car booking, fixed upfront pricing |
| 📦 **Trusted Delivery** | Transport packages, documents, keys with OTP confirmation |
| 💳 **Electronic Payment** | Support for T-LYNC, Plutu, Sadad, plus cash payment |
| 🌍 **Bilingual** | Full Arabic and English support with RTL/LTR |
| 🗺️ **Live Tracking** | Real-time driver/courier tracking on map |

---

## 🛠️ Tech Stack

| Area | Technology |
|------|------------|
| **Framework** | Flutter 3.27+ |
| **State Management** | GetX (Reactive + Navigation + DI) |
| **Maps & Location** | Google Maps Flutter SDK, Geolocator |
| **Authentication** | Firebase Phone Auth (OTP) |
| **Database** | Cloud Firestore + Hive (Offline-first) |
| **Push Notifications** | Firebase Cloud Messaging (FCM) |
| **Payments** | T-LYNC, Plutu, Sadad APIs |
| **Local Storage** | Hive (for offline support) |
| **Image & Camera** | image_picker, camera |

---

## 📋 Prerequisites

Before running the app, ensure you have the following:

### 1. Development Environment

```bash
# Flutter SDK (3.27 or newer)
flutter --version

# Dart SDK
dart --version

# Android Studio / VS Code with appropriate extensions
