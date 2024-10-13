# News App

[![Crates.io](https://img.shields.io/crates/l/rustc-serialize.svg?maxAge=2592000)]()

This is a Flutter-based News App that provides users with the latest news articles from various sources. The app utilizes a clean architecture approach, implementing the MVVM (Model-View-ViewModel) pattern along with the BLoC (Business Logic Component) pattern using Cubit for state management. The application fetches news data from a remote API and incorporates the Repository pattern for efficient data handling.

<img width="60%" src="https://github.com/user-attachments/assets/da1bf192-f514-4996-aee7-0b52ebe3353d"/>

<img width="40%" src="https://github.com/user-attachments/assets/0d0060b3-bcd1-487b-9972-3d54ee01f87a"/>
<img width="40%" src="https://github.com/user-attachments/assets/5b6e6b2e-f709-4172-a539-f7f805f72f67"/>

<img width="40%" src="https://github.com/user-attachments/assets/8527beaf-67bf-42dc-aec8-c091b2626053"/>
<img width="40%" src="https://github.com/user-attachments/assets/359472b8-9dde-456a-80e3-95aac37ed538"/>

<img width="40%" src="https://github.com/user-attachments/assets/7667d439-19d3-4d6b-9ad3-927049a21106"/>
<img width="40%" src="https://github.com/user-attachments/assets/b60d887a-a306-4894-a542-b5bedc6c18b0"/>

# Features
Display the latest news articles.

Filter news by categories (e.g., Sports, Politics, Technology).

Responsive UI that adapts to different screen sizes.

Search functionality to find specific news articles.

# Technologies Used
Flutter: UI toolkit for building natively compiled applications.

Dart: Programming language used for Flutter development.

BLoC (Cubit): State management solution for Flutter.

MVVM: Architectural pattern for separating business logic from UI.

Repository Pattern: Abstracts data sources for better testability and maintainability.

HTTP: For making API calls to fetch news data.

Provider: For dependency injection and state management.

# Architecture

The app is structured as follows:

Model: Represents the data structure of news articles.

View: The UI components that display the news articles.

ViewModel: Contains the business logic and interacts with the Model and View.

Repository: Manages data fetching and caching, providing a clean API for the ViewModel.

# Getting Started

App uses The News Database API. You have to enter your API key in order to run the app. You can create your own one very easy! (https://newsapi.org) 
