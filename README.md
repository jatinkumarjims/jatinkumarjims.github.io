# 🔐 EBLING Biometric Billing Intelligence Suite

![Version](https://img.shields.io/badge/version-2.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20Mobile%20%7C%20PWA-lightgrey)

> **Enterprise-Grade Billing System with Biometric Authentication**  
> *Developed by Jatin Kumar*

---

## 📌 Overview

**EBLING** is a full-featured, production-ready billing and invoice management system that integrates **biometric fingerprint authentication** for mobile devices (Android/iOS) alongside traditional login methods. Built for enterprises, freelancers, and finance teams who demand security, speed, and modern UX.

### 🎯 Main Aim
To provide a **zero-password, thumbprint-first** billing platform that reduces friction, enhances security, and delivers real-time financial analytics — all within a beautiful, responsive interface.

---

## ✨ Features

| Module | Description |
|--------|-------------|
| 🔐 **Biometric Login** | Fingerprint / Face ID authentication using WebAuthn API (Android, iOS, Windows Hello) |
| 📊 **Live Dashboard** | Revenue stats, invoice count, paid/pending metrics |
| 🧾 **Invoice Management** | Create, read, update, delete, and print invoices |
| 💱 **Multi-Currency** | USD, EUR, INR, GBP with real-time conversion |
| 🌓 **Dark Mode** | System-wide theme toggle with persistent preference |
| 🖨️ **Print Support** | Generate printable invoices for clients |
| 📈 **Analytics Chart** | Visual revenue trends using Chart.js |
| 💾 **Persistent Storage** | All data saved in browser's localStorage (no backend required for demo) |
| 📱 **Fully Responsive** | Works seamlessly on desktop, tablet, and mobile devices |

---

## 🖼️ Screenshots

| Login Screen | Dashboard | Invoice Print |
|--------------|-----------|---------------|
| ![Login](https://via.placeholder.com/200x400?text=Fingerprint+Login) | ![Dashboard](https://via.placeholder.com/400x200?text=Analytics+Dashboard) | ![Print](https://via.placeholder.com/200x300?text=Invoice+Preview) |

*(Replace placeholders with actual screenshots)*

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| HTML5 | Structure & semantics |
| CSS3 | Styling, animations, dark mode |
| JavaScript (ES6+) | Core logic, data handling |
| WebAuthn API | Biometric fingerprint authentication |
| Chart.js | Revenue analytics visualization |
| Moment.js | Date formatting |
| Font Awesome 6 | Icons |
| LocalStorage | Client-side persistence |

---

## 🚀 Getting Started

### Prerequisites
- A modern web browser (Chrome, Edge, Firefox, Safari)
- For biometric login: **Android device with fingerprint sensor** OR **Windows Hello** OR **macOS Touch ID**
- No server or database required — runs entirely client-side

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/jatinkumarjims/billingsys.git
   cd billingsys

ebling-billing-system/
├── index.html          # Main application file (all-in-one)
├── README.md           # This documentation
├── LICENSE             # MIT License
└── assets/             # (Optional) Images, icons, etc.


🧪 Testing the Biometric Feature
Since the WebAuthn API requires HTTPS or localhost, follow these steps:

Option 1: Local Development
bash
# Using Python
python -m http.server 8080

# Using Node.js
npx serve

# Using VS Code Live Server
Right-click index.html → Open with Live Server
Option 2: Deploy to HTTPS
Push to GitHub Pages, Netlify, or Vercel — biometrics will work automatically on supported devices.

👨‍💻 Developer Information
Name: Jatin Kumar
Role: Full Stack Developer & Financial Systems Architect
Portfolio: https://jatinkumar.dev (update with your actual link)
GitHub: github.com/jatin-kumar
Email: jatin.kumar@ebling.com (replace with your real email)

Developer Notes
This project was built as a demonstration of biometric integration in financial applications.

All data is stored locally — for production, replace localStorage with a backend API (Node.js, Django, Firebase, etc.)

WebAuthn requires HTTPS in production environments.

📋 How Everything Works — Step by Step
Step	Action	Description
1	User arrives	Sees biometric login card with fingerprint icon
2	Authentication	Taps fingerprint sensor → WebAuthn verification
3	Dashboard	After login, sees revenue stats and invoice table
4	Create Invoice	Enters client, amount, status → clicks Create
5	Manage Invoices	Can mark as paid/pending, delete, or print
6	Multi-Currency	Changes currency from dropdown → values auto-convert
7	Dark Mode	Toggles theme — preference saved
8	Print	Clicks print icon → opens printer-friendly invoice
🧠 System Architecture Explained
text
┌─────────────────────────────────────────────────────────┐
│                     User Device                         │
│  ┌─────────────┐    ┌─────────────┐    ┌─────────────┐  │
│  │ Biometric   │───▶│ WebAuthn    │───▶│  Success/   │  │
│  │ Sensor      │    │ API Call    │    │   Fail      │  │
│  └─────────────┘    └─────────────┘    └─────────────┘  │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │            localStorage (browser)                │   │
│  │  ┌──────────┐ ┌──────────┐ ┌──────────────────┐ │   │
│  │  │ Invoices │ │ Settings │ │ Biometric CredID │ │   │
│  │  └──────────┘ └──────────┘ └──────────────────┘ │   │
│  └─────────────────────────────────────────────────┘   │
│                                                         │
│  ┌─────────────────────────────────────────────────┐   │
│  │                   UI Layer                       │   │
│  │  Dashboard │ Forms │ Tables │ Charts │ Print    │   │
│  └─────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────┘
🔄 Future Roadmap
Backend integration (Node.js + MongoDB)

Email invoice delivery

PDF export (instead of browser print)

Multi-user role management

Recurring billing / subscriptions

API endpoints for third-party integration

PWA installation support

Export to Excel/CSV

🤝 Contributing
Contributions are welcome! Please follow these steps:

Fork the repository

Create your feature branch (git checkout -b feature/amazing-feature)

Commit your changes (git commit -m 'Add amazing feature')

Push to the branch (git push origin feature/amazing-feature)

Open a Pull Request

📄 License
This project is licensed under the MIT License — see the LICENSE file for details.

text
MIT License

Copyright (c) 2025 Jatin Kumar

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction...
🙏 Acknowledgments
WebAuthn Working Group for biometric standards

Chart.js team for beautiful visualizations

Font Awesome for premium icons

All open-source contributors

📞 Support
For questions, issues, or feature requests:

Open an issue on GitHub

Email: jatin.kumar@ebling.com

LinkedIn: linkedin.com/in/jatin-kumar

<div align="center"> <strong>Made with ❤️ by Jatin Kumar</strong><br /> <sub>© 2026 EBLING Financial Intelligence Suite</sub> </div> ```
   
