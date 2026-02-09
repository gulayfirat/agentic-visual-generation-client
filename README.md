# Agentic Visual Generation Client

This is a mobile application built with **Flutter**, designed as the primary control interface for the **[Agentic Visual Generation Service](https://github.com/gulayfirat/agentic-visual-generation-service)**. The app enables users to interact with a multi-step AI Agent workflow by defining complex visual parameters and managing AI-generated content with seamless local persistence.

## 🔗 Direct Service Integration
This mobile client is specifically engineered to communicate with the **Agentic AI Orchestrator**. 
- **The Backend:** A LangGraph-based state machine that performs reasoning and prompt engineering.
- **The Client:** This Flutter app, which acts as the "Human-in-the-Loop" controller, sending structured state requests and visualizing the Agent's sophisticated output.
- **Service Repository:** [agentic-visual-generation-service](https://github.com/gulayfirat/agentic-visual-generation-service)

## 🚀 Technical Powerhouse (Tech Stack)
* **State Management:** `Riverpod` (StateNotifierProvider) for reactive and robust state handling.
* **Navigation:** `AutoRoute` for strongly-typed routing and seamless deep-linking.
* **Networking:** `Dio` with a custom `NetworkManager` for advanced API communication with the Python Agent.
* **Local Persistence:** `Hive` for high-performance NoSQL local caching of generated AI visuals.
* **Code Generation:** `JsonSerializable` for immutable state and type-safe data modeling.

## ✨ Key Features
- **Agent Parameter Controller:** A multi-step form to define the AI Agent's parameters: Mood, Color Tone, Post Type, and Context.
- **Dynamic Visual Generation:** Real-time tracking of the Agent's multi-step generation process.
- **Smart Caching:** Offline access to previously generated visuals using the Hive-based.
- **UI/UX:** Custom Shimmer effects, Lottie animations, and cached network images.

## 📂 Project Structure
```text
├── lib/
│   ├── core/               # Framework layer (Network, Cache, Extensions)
│   ├── product/            # Business layer (Constants, Widgets, Services)
│   ├── feature/            # Feature-based UI and ViewModels (Riverpod)
│   ├── model/              # Data Models (Request/Response/Cache)
│   └── main.dart           # App entry point

```
## Setup
1. **Install Dependencies**
```
flutter pub get
```
2. **Code Generation**
```
flutter pub run build_runner build --delete-conflicting-outputs
```
## 📱 Screenshots

<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 21 48 12" src="https://github.com/user-attachments/assets/11d63e77-6b54-4536-8855-0f2e61d91a1f" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 31 51" src="https://github.com/user-attachments/assets/ea7e5535-76c2-4292-91b7-2768c6fae636" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 09 24" src="https://github.com/user-attachments/assets/52d5c01d-4345-47b8-8e99-cdebd8d300e0" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 09 32" src="https://github.com/user-attachments/assets/f9f88312-0bfe-46a1-8ce1-82682906fbec" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 24 10" src="https://github.com/user-attachments/assets/f45945dc-882e-44db-9566-f1772c2a3cc4" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 34 22" src="https://github.com/user-attachments/assets/6baaaf6a-02fc-4296-994e-79287583e654" />
<img width="200" alt="Simulator Screenshot - iPhone 14 Pro - 2026-02-09 at 17 34 03" src="https://github.com/user-attachments/assets/877fe690-9d88-4570-ba69-c171f7694211" />

