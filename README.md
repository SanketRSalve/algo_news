# AlgoNews - Flutter News App

A news application built with Flutter that provides users with the latest news articles from various sources. The app features a clean UI, category-based news browsing, bookmarking functionality

## Features

- 📰 Browse news by categories (All, Business, Technology, Sports, etc.)
- 🔍 Search news articles
- 📑 Bookmark articles for later reading
- 🖼️ Image caching for better performance
- 🌙 Dark mode support (currently added theme for light mode only)
- 📱 clean UI
- 📄 Pagination (NewsAPI has some limitation for this I guess)[https://stackoverflow.com/questions/52570711/newsapi-returning-totalresults-20-even-after-specifying-pagesize-100]

## Getting Started

### Prerequisites

- Flutter (3.0.0 or higher)
- Dart (3.0.0 or higher)
- API Key (No need to get it, I've already added it in the code, but usually you need to store it in the .env file)

### Installation
1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to start the app


## Architecture and Design
The app follows a clean architecture pattern

### State Management
- Uses Riverpod for state management
- Implements repository pattern for data handling
- Uses AsyncValue for handling loading, error, and success states

### Dependencies
- `flutter_riverpod`: State management
- `dio`: HTTP client for API requests
- `cached_network_image`: Image caching and loading
- `shared_preferences`: Local storage for bookmarks and settings
- `intl`: Date formatting
