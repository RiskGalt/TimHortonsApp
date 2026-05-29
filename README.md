# TimHortons2App ☕️

A modular, production-ready iOS mobile application constructed using **SwiftUI** and the **Model-View-ViewModel (MVVM)** design pattern. The application features a dynamic product catalog, an interactive order configuration workspace, an automated checkout tracker, and a persistent shopping cart pipeline.

---

## 🛠 Architecture & Technical Stack

- **Framework:** SwiftUI (Declarative UI Layout Layer)
- **Design Pattern:** MVVM (Model-View-ViewModel) to strictly separate state and presentation logic.
- **Data Architecture:** Asynchronous data lifecycle management using local JSON serialization protocols.

---

## 📂 Structural Overview

The repository configuration is organized cleanly across modular domain environments:

* **`Model/`** * `Coffee.swift`: The data schema mapping properties for individual drink configurations (names, pricing, asset definitions).
    * `CartItem.swift`: Employs `Codable` compliance to represent transactional checkout items.
* **`ViewModel/ / Manager/`**
    * `CartManager.swift`: Governs transactional array modifications, quantity computations, and localized tracking logic.
* **`DataLoader/`**
    * `DataLoader.swift`: Manages localized workspace initialization by decoding local bundle manifests (`coffeeData.json`).
* **`Views/`**
    * `ContentView.swift`: The central interface switchboard controlling navigation stacks and catalog presentation.
    * `CoffeeCardView.swift`: A reusable component designed to render item information layouts cleanly.
    * `CartView.swift`: Displays active orders, computes subtotals, and exposes quantity modification layouts.
* **`Resources/`**
    * `coffeeData.json`: The local data source file populating the application's menu entries dynamically.

---

## 🚀 Future Roadmap Capabilities

Planned architectural updates for future development sprints include:
- [ ] **Localized Persistence Layer:** Migrate data management from bundle structures directly into native `UserDefaults` or `SwiftData` pipelines.
- [ ] **Admin Configuration Context:** Integrate dedicated views to append or modify inventory definitions natively in real-time.
- [ ] **Telemetry Layer:** Drop a unified logging class to register analytics triggers on checkout interactions.

---

## 📄 Licensing & Compliance

This software framework is distributed as an educational portfolio application. All code components conform strictly to native iOS compilation standards.
