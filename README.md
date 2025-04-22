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
  - TabBar used for seamless navigation between News and Bookmarks

- **Optional Features**
  - ✅ Pull-to-refresh
  - ✅ Dark mode
  - ✅ Search functionality

---

## 🧑‍💻 Tech Stack & Packages Used

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

*(Insert screenshots of Login Page, News Feed, Bookmarks Page, Dark Mode, etc.)*

---

## 📦 Deliverables

- [GitHub Repository](https://github.com/yourusername/flutter-news-app) ✅
- [Google Drive Link (APK + Optional Video)](https://drive.google.com/your-link) ✅

