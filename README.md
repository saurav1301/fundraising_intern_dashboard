
# 🌟 NGO Fundraising Intern Dashboard

A Flutter prototype dashboard designed for NGO fundraising interns to track their progress, view announcements, rewards, and leaderboard rankings with interactive UI animations.

## ✨ Features

- 📊 **Dashboard Overview** — Total Donations, Referral Code, and Progress to Next Reward.
- 🏆 **Unlockable Rewards** — Flip card animations to reveal benefits of unlocked rewards.
- 📣 **Announcements Section** — Animated cards with typewriter effect and slide-in transitions.
- 🏅 **Leaderboard** — Podium animations for top 3 contributors and slide-in list for others.
- 🎉 **Smooth UI Animations** — Shimmer loaders, counters, bounce taps, and more.

## 📂 Folder Structure

```
lib/
 ├ animations/
 │ ├ bounce_on_tap.dart
 ├ models/
 │ ├ reward.dart
 │ ├ leaderboard_entry.dart
 │ ├ announcement.dart
 ├ utils/
 │ ├ constants.dart
 │ ├ dummy_data.dart
 ├ widgets/
 │ ├ dashboard_card.dart
 │ ├ reward_card.dart
 │ ├ shimmer_placeholder.dart
 │ ├ typewriter_text.dart
 │ ├ announcement_card.dart
 ├ screens/
 │ ├ dashboard_screen.dart
 │ ├ announcements_screen.dart
 │ ├ leaderboard_screen.dart
 │ ├ login_screen.dart
 ├ main.dart
```

## 📸 Screenshots

| Login Screen | Dashboard Screen |
|--------------|------------------|
| <img src="screenshots/login_screen.jpeg" width="220"/> | <img src="screenshots/dashborad_screen.gif" width="220"/> |

| Leaderboard Screen | Announcement Screen |
|--------------------|------------------|
| <img src="screenshots/leaderborad_screen.gif" width="220"/> | <img src="screenshots/announcement_screen.gif" width="220"/> | 

## 🚀 Setup Instructions

1. Clone the repo:
    ```bash
    git clone https://github.com/saurav1301/fundraising_intern_dashboard.git
    cd fundraising_intern_dashboard
    ```
2. Install dependencies:
    ```bash
    flutter pub get
    ```
3. Run the app:
    ```bash
    flutter run
    ```

## 📝 Notes

- All animations are implemented using Flutter's built-in animation libraries. No APK build required for submission.
- Screenshots above showcase key animations and UI components.
- This prototype is designed for mobile view (tested on Android).

## 🙌 Author

**Saurav Singh Negi** — [GitHub](https://github.com/saurav1301)

---

Feel free to reach out for any queries or suggestions!
