# QuestionApp

## Prepared by Oguzhan Kabul

### Overview
This project is developed using Swift, following the MVVM-R (Model-View-ViewModel-Router) architecture pattern. A clean structure is employed throughout the application, ensuring maintainability and scalability. Emphasis has been placed on Protocol Oriented Programming, enhancing the flexibility and reusability of the codebase.

### Features
- **MVVM-R Architecture**: Utilizes the MVVM-R pattern for a clear separation of concerns and improved testability.
- **Clean Structure**: Organized and modular codebase, making it easy to navigate and maintain.
- **Protocol Oriented Programming**: Leverages the strengths of Swift's protocol-oriented paradigms.
- **Tested Network Service**: Ensures reliability and robustness of the network layer.
- **Unit Tested ViewModels**: Each ViewModel is accompanied by comprehensive unit tests, validating the business logic of the screens.
- **Xib-based UI**: User interfaces are designed with Xib files, providing a visual and manageable approach to UI development.

### Application Flow
The application consists of two main screens:
1. **Start Screen**: Features a start button that, when pressed, leads to a series of questions.
2. **Question Screen**: Users answer questions, gaining points based on their responses. The maximum score achieved is stored in the application's local memory.

### Dependencies
- **Swift Package Dependencies**:
  - **KingFisher**: The only external library used in this project, demonstrating an example of Swift Package Dependencies.
