# 📰 Flutter News App – AiBuzz Task Submission

## ✅ Features Implemented

- **Login Page**
  - Email & password with simple validation (required fields, proper email format)
  - No backend integration, but session persists using `shared_preferences`

- **News Feed**
  - News fetched from **NewsAPI** using the `http` package
  - Each article displays: thumbnail, title, description, source name, and a human-readable published date (e.g., `16 April, 2025`)
  - Tapping an article opens full content in WebView
  - Articles can be bookmarked

- **Bookmarks Page**
  - View all saved articles
  - Ability to remove bookmarks
  - Bookmarks persist even after closing the app

- **Navigation**
  - TabBar used for seamless navigation between different News topics and Bookmarks

- **Optional Features**
  - ✅ Dark mode
  - ✅ Search functionality

---

## 🧑‍💻 Tech Stack & Packages Used

- **News API:** [NewsAPI.org](https://newsapi.org/) used as the news data provider


| Package | Purpose |
|--------|---------|
| [`http`](https://pub.dev/packages/http) | API calls to fetch news |
| [`flutter_riverpod`](https://pub.dev/packages/flutter_riverpod) | State management (clean and testable) |
| [`shared_preferences`](https://pub.dev/packages/shared_preferences) | Persistent storage for login state and bookmarks |
| [`webview_flutter`](https://pub.dev/packages/webview_flutter) | To load article URLs in-app |
| [`intl`](https://pub.dev/packages/intl) | Formatting the published date |

---

## 🧱 Architecture

- **Pattern:** MVVM (Model-View-ViewModel)
- Clean separation of UI, logic, and data
- `Riverpod` ensures reactive state management with less boilerplate and better testability

---

## 🚀 Setup Instructions

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourusername/flutter-news-app.git
   cd flutter-news-app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

---

## 📸 Screenshots

You can view screenshots of the app [here](https://github.com/pranjay-t/skimz/tree/main/asset/screenshots)

---

## 📦 Deliverables

- [GitHub Repository](https://github.com/pranjay-t/skimz) ✅
- [Google Drive Link (APK)](https://drive.google.com/file/d/1zP0e0BRKtC4wc5n127SNLgZEH0jFLYru/view?usp=sharing) ✅

