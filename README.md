
# Products App Clean Architecture

This repository contains the **Products App**, a clean architecture project built with **Flutter**. The app demonstrates a clean and maintainable code structure, focusing on modularity and scalability.

![Clean Architecture Overview](https://github.com/user-attachments/assets/f6cd2499-ce0c-4a15-bc53-90ae9e4f22a1)

## **Project Structure**

The project follows a well-defined folder structure to ensure code maintainability and clarity:

### **Root Structure**
```plaintext
lib/
├── config/
│   ├── routes/
│   │   └── router.dart
│   ├── theme/
│       └── app_theme.dart
├── core/
│   ├── constants/
│   │   └── constants.dart
│   ├── resources/
│   │   └── data_state.dart
│   ├── usecase/
│   │   └── usecase.dart
│   ├── util/
│       ├── converter/
│           └── rating_converter.dart
├── features/
│   ├── products/
│   │   ├── data/
│   │   │   ├── model/
│   │   │   │   ├── products.dart
│   │   │   │   └── rating.dart
│   │   │   ├── repository/
│   │   │   │   └── products_repository_impl.dart
│   │   │   ├── sources/
│   │   │       ├── local/
│   │   │       │   ├── app_database.dart
│   │   │       │   ├── app_database.g.dart
│   │   │       │   └── dao/
│   │   │       │       └── products_dao.dart
│   │   │       ├── remote/
│   │   │           ├── products_api_service.dart
│   │   │           └── products_api_service.g.dart
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── products.dart
│   │   │   ├── repository/
│   │   │   │   └── products_repository.dart
│   │   │   ├── usecase/
│   │   │       ├── delete_product_use_case.dart
│   │   │       ├── get_products_use_case.dart
│   │   │       ├── get_saved_use_case.dart
│   │   │       └── save_product_use_case.dart
│   │   ├── presentation/
│   │       ├── bloc/
│   │       │   ├── products/
│   │       │       ├── local/
│   │       │       │   ├── local_products_bloc.dart
│   │       │       │   ├── local_products_event.dart
│   │       │       │   └── local_products_state.dart
│   │       │       ├── remote/
│   │       │           ├── remote_products_bloc.dart
│   │       │           ├── remote_products_event.dart
│   │       │           └── remote_products_state.dart
│   │       ├── pages/
│   │       │   ├── cart/
│   │       │   │   └── cart_product_screen.dart
│   │       │   ├── detail/
│   │       │   │   └── product_detail_screen.dart
│   │       │   ├── home/
│   │       │       └── products_screen.dart
│   │       ├── widgets/
│   │           ├── appbar_widget.dart
│   │           ├── cart_widget.dart
│   │           └── products_widget.dart
├── injection_container.dart
├── main.dart
```

## **Technologies Used**

This project leverages the following dependencies and tools:

### **Dependencies**
- **Flutter SDK**
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) `^1.0.8`
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) `^8.1.6`
- [equatable](https://pub.dev/packages/equatable) `^2.0.5`
- [get_it](https://pub.dev/packages/get_it) `^8.0.2`
- [intl](https://pub.dev/packages/intl) `^0.20.0`
- [floor](https://pub.dev/packages/floor) `^1.5.0`
- [flutter_hooks](https://pub.dev/packages/flutter_hooks) `^0.20.5`
- [cached_network_image](https://pub.dev/packages/cached_network_image) `^3.2.0`
- [dio](https://pub.dev/packages/dio) `^5.7.0`
- [go_router](https://pub.dev/packages/go_router) `^14.2.8`
- [ionicons](https://pub.dev/packages/ionicons) `^0.2.2`

### **Dev Dependencies**
- [flutter_test](https://pub.dev/packages/flutter_test)
- [flutter_lints](https://pub.dev/packages/flutter_lints) `^4.0.0`
- [retrofit_generator](https://pub.dev/packages/retrofit_generator) `^9.1.5`
- [floor_generator](https://pub.dev/packages/floor_generator) `^1.5.0`
- [build_runner](https://pub.dev/packages/build_runner) `^2.4.13`

## **Key Features**
- **Clean Architecture:** Adopts a structured approach to separate concerns into layers.
- **State Management:** Utilizes `flutter_bloc` for efficient state management.
- **Data Persistence:** Implements the `floor` library for local database management.
- **API Integration:** Integrates RESTful APIs using `dio` and `retrofit_generator`.
- **Routing:** Efficient navigation using `go_router`.
- **Responsive UI:** Modular widget system to ensure adaptability across devices.

## **Preview**
### **Screenshots**
![Screenshot 1](https://github.com/user-attachments/assets/8e6333a1-8ada-48ef-8abe-34628e27bc46)  
![Screenshot 2](https://github.com/user-attachments/assets/d26d4eae-9061-49aa-86da-be7d5b66ac79)  
![Screenshot 3](https://github.com/user-attachments/assets/0ee40356-4f9c-4ffb-b77d-f78ba0d42779)  
![Screenshot 4](https://github.com/user-attachments/assets/55227359-2015-477b-9fab-13a0ef5d0fc0)

## **Getting Started**

1. **Clone the repository:**
   ```bash
   git clone https://github.com/your-username/ProductsAppCleanArchitecture.git
   cd ProductsAppCleanArchitecture
   ```  

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```  

3. **Run the app:**
   ```bash
   flutter run
   ```  

---

Feel free to contribute, raise issues, or suggest improvements for this project! 🚀  
