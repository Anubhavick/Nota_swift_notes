# Nota - Your Thoughts, Organized

<p align="center">
  <img src="https://via.placeholder.com/150/6366F1/FFFFFF?text=Nota" alt="Nota App Icon" width="150" height="150" style="border-radius: 20%;">
</p>

<p align="center">
  <strong>A modern, feature-rich note-taking application for iOS, built entirely with SwiftUI.</strong>
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Swift-5.7-orange.svg" alt="Swift 5.7">
  <img src="https://img.shields.io/badge/iOS-16.0+-blue.svg" alt="iOS 16.0+">
  <img src="https://img.shields.io/badge/Xcode-14.0+-informational.svg" alt="Xcode 14.0+">
  <img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License MIT">
</p>

Nota is a clean, intuitive, and powerful application designed to demonstrate modern iOS development practices using the latest SwiftUI frameworks. It provides a seamless user experience for capturing ideas, organizing thoughts, and managing personal notes.

## ✨ Features

Nota is packed with features designed to showcase the capabilities of SwiftUI and provide a robust user experience.

*   **Modern Authentication Flow**: A vibrant login screen with an option to skip, demonstrating state management (`@State` & `@Binding`) to control the application's view hierarchy.
*   **Powerful Sidebar Navigation**: Utilizes `NavigationSplitView` for a professional, multi-column layout that feels native on both iPhone and iPad.
*   **Dynamic Note Management**:
    *   Create, read, update, and delete (CRUD) notes.
    *   Mark notes as "Important" with a visual indicator.
    *   Sample data model for a quick start.
*   **Aesthetic & Responsive UI**:
    *   Clean, modern design with gradients, shadows, and rounded corners.
    *   Responsive layouts that adapt to different screen sizes and orientations.
*   **Theming & Customization**:
    *   A dedicated settings panel to switch between **Light**, **Dark**, and **System** appearance modes.
    *   The entire app theme updates instantly.
*   **Persistent State (Conceptual)**: The data model is built with `Codable`, ready for easy integration with `UserDefaults` or `CoreData` for data persistence.
*   **Professional Project Structure**: A clear and organized file structure, separating data models (`Item.swift`), views (`ContentView.swift`), and app entry (`sign_up_pageApp.swift`).

## 🛠️ Tech Stack & Architecture

This project is a showcase of modern SwiftUI development:

*   **Framework**: SwiftUI
*   **Language**: Swift 5.7+
*   **Platform**: iOS 16.0+
*   **Architecture**: Follows a declarative, state-driven architecture.
    *   **View State**: Managed with `@State`, `@Binding`, and `@StateObject`.
    *   **Navigation**: Implemented using `NavigationSplitView` for the main shell and `NavigationLink` for detail views.
    *   **Data Model**: Defined using `structs` that conform to `Identifiable` and `Codable` for list rendering and future persistence.

## 🚀 Getting Started

To run this project locally, you will need:

*   A Mac with macOS Ventura or later.
*   [Xcode 14.0](https://developer.apple.com/xcode/) or later.

### Installation

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/Anubhavick/Nota_swift_notes.git
    ```
2.  **Open the project in Xcode:**
    *   Navigate to the cloned directory.
    *   Open the `sign_up_page.xcodeproj` file.

3.  **Run the application:**
    *   Select an iOS simulator (e.g., iPhone 14 Pro).
    *   Press the "Play" button (▶️) or use the shortcut `⌘ + R`.

## 📸 Screenshots

*(This is a great section to add later! Once your app is running, take some screenshots of the login screen, the home page, and the settings page, and add them here to visually impress visitors.)*

| Login Screen | Home (Notes List) | Settings |
| :----------: | :---------------: | :------: |
| *[Image]*    | *[Image]*         | *[Image]* |

## 💡 Future Improvements

This project serves as a strong foundation. Future features could include:

- [ ] **Data Persistence**: Save notes using `UserDefaults`, `CoreData`, or `SwiftData`.
- [ ] **Rich Text Editing**: Integrate Markdown support or a `UITextView` wrapper for bold, italics, and lists.
- [ ] **Search Functionality**: Add a search bar to filter notes by title or content.
- [ ] **Cloud Sync**: Use iCloud (CloudKit) to sync notes across a user's devices.
- [ ] **Unit & UI Tests**: Add a testing suite to ensure code quality and stability.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for details.

---

*This project was created as a learning exercise to explore the power and elegance of SwiftUI.*
