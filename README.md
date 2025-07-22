# 🧠 Lingua Touch

**Lingua Touch** is an accessibility-focused Flutter mobile app that converts Braille text to readable and audible formats using OpenCV and Google Text-to-Speech (TTS). The app supports multiple languages and provides an intuitive interface for visually impaired users.

📄 **Published in IJCRT** – [IJCRT24A4526.pdf](https://www.ijcrt.org/papers/IJCRT24A4526.pdf)

---

## 📋 Table of Contents

- [System Requirements](#system-requirements)
- [Installation](#installation)
- [App Structure](#app-structure)
- [Code Formatting](#code-formatting)
- [Support](#support)

---

## System Requirements

Make sure you have the following installed:

- **Dart SDK**: `>= 3.3.2`
- **Flutter SDK**: `>= 3.19.4`
- A device/emulator for Android or iOS

---

## Installation

Follow these steps to get the app running locally:

## App Structure
├── android/                   # Android platform files
├── ios/                       # iOS platform files
├── assets/                    # Fonts, images, and other assets
├── lib/
│   ├── main.dart              # Entry point of the application
│   ├── core/
│   │   ├── app_export.dart    # Common imports
│   │   ├── constants/         # App-wide constant values
│   │   └── utils/             # Utility functions
│   ├── presentation/          # All UI screens
│   ├── routes/                # Navigation route definitions
│   ├── theme/                 # App themes and decorations
│   └── widgets/               # Reusable custom widgets


```bash
git clone https://github.com/kmaxay/linguatouch.git
cd linguatouch
flutter pub get
flutter run
