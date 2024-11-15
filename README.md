# knovator
This Flutter app consumes the JSONPlaceholder API to show a list of posts. On tapping a post in the list, the app loads a full description of a post. The app uses the BLoC pattern for managing its state and several third-party libraries for more functions and user interface.

Features
Shows a list of posts fetched by the API (https://jsonplaceholder.typicode.com/posts).
Every post is listed with a light yellow background color.
On tapping at a post, it takes to a detail screen with the description of that post, or the body from the API.
Timer Functionality: The timer starts counting when the item appears on the screen, pauses when it disappears or when the post is tapped, and resumes when the item reappears.
Local Storage: The app stores post data locally and synchronizes in the background with the API to keep data up-to-date.
Architecture of the app is done using the BLoC pattern, Business Logic Component, separates UI from the business logic. This approach has the following benefits in choosing BLoC architecture:
Separation of Concerns: Separates quite well that concerns UI layers from business logic; it makes the code very testable and maintainable.
Predictable state management: BLoC simplifies state transitions handling and maintaining an app's state.


Architecture
The application follows a clean and modular architecture that separates the UI, logic, and data layers:

UI Layer: Displays the list of posts and handles user interaction.
Logic Layer: Manages the application state, including fetching posts from the API and managing timers.
Data Layer: Handles local storage using shared preferences and API requests.

Pubspec yaml

dio: ^5.7.0
Dio is a powerful HTTP client for Flutter, which provides a clean and efficient API for making HTTP requests.

flutter_bloc: ^8.1.6
A Flutter package for implementing the BLoC pattern. It provides a simple and effective way to manage state and handle events.

equatable (v2.0.5)
This package makes object comparisons simpler. This is a necessity in the case of BLoC state management.

flutter_launcher_icons (v0.14.1)
Used to generate app launcher icons for Android as well as iOS.

flutter_easyloading (v3.0.5)
Easy and customizable loading indicator while making API calls.

bot_toast (v4.1.3)
Custom toast notifications are offered. They make showing error messages and loading indicators not too intrusive.

get_it (v8.0.2)
A lightweight service locator for dependency injection. Used mainly for BLoC and repository instances across the app.

sqflite (v2.4.1)
SQLite plugin for local database storage. Persist data locally if it's necessary.

visibility_detector (v0.4.0+2)
Detects when a widget goes visible on screen. Useful for lazy loading data or analytics tracking.
