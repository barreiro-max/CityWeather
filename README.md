# CityWeather

## Application Architecture

The application is built following the **MVVM** pattern with clear separation of concerns and support for a **feature-based modular structure**.  

---

## Technologies

- SwiftUI / iOS 17+  
- Swift Concurrency(async / await) 
- MVVM + Feature Modules  
- Dependency Injection

---

### Layers

1. **Data Source**  
   The data source is responsible for fetching raw data (e.g., from a weather API or local storage). It does not process the data — it only delivers it.

2. **Repository**  
   The repository requests data from the data source and transforms it into a format suitable for use. It encapsulates business logic, error handling, and prepares models for further consumption.  

3. **ViewModel**  
   The ViewModel interacts with the repository, fetches prepared data, handles errors, and updates its state. The view receives only ready-to-use data through the ViewModel, without knowing the source.  

4. **View**  
   The view subscribes to the ViewModel’s state and displays the data to the user. It does not access data sources directly and works only with formatted values (text, numbers, etc.).

5. **Navigation / Router**  
   Navigation is managed via routers that handle screen transitions.  
   Example: the user taps "Add city to list", the router triggers the action, a new screen appears, and when navigating back, the screen is removed from the stack.  

---

## Feature Structure

Each feature is organized as a separate module with its own models, ViewModel, and routers:  

- **Onboarding**  
  A separate flow for the welcome screen and initial app setup.  
- **TabBar**  
  The main bottom navigation bar for switching between key screens.  
- **Weather**  
  Weather screen displaying current data with error handling and loading states.  
- **Cities**  
  Lists of all cities and favorite cities, each with independent navigation per tab.  

---

## Key Principles

- **MVVM**: each screen has its own ViewModel for state management and business logic.  
- **Layer Separation**: data, business logic, presentation, and navigation are fully isolated.  
- **Feature Modules**: each feature is independent and contains its own models, ViewModel, and routers.  
- **Navigation Router**: each feature has its own router to manage screen transitions within that feature, without direct dependencies on other features' views.
- **Dependency Injection**: all dependencies (repositories, data sources, services) are injected via constructors or environment.  

---

## Data Flow Example

1. The data source fetches raw weather data.  
2. The repository transforms it into usable models.  
3. The ViewModel requests data from the repository, handles errors, and updates its state.  
4. The view displays the data to the user by subscribing to the ViewModel.  
5. Navigation is handled via the router, managing transitions between screens.

