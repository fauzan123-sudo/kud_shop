## 🏗️ Arsitektur

Project ini menggunakan **Clean Architecture** dengan 3 layer utama:
lib/
├── core/                     # Core utilities & shared components
│   ├── bloc/                 # BLoC observer
│   ├── config/               # App configuration & flavor
│   ├── constants/            # App constants & keys
│   ├── error/                # Failure & exception handling
│   ├── injection/            # Dependency injection (GetIt)
│   ├── navigation/           # GoRouter & navigation service
│   └── network/              # Dio & interceptors
│
├── src/                      # Feature modules
│   ├── auth/                 # Authentication
│   │   ├── data/             # Models, datasources, repository impl
│   │   ├── domain/           # Entities, repository interface, usecases
│   │   └── presentation/     # BLoC, pages, widgets
│   │
│   ├── Customer/             # Customer
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── Admin/              # Admin 
│       ├── data/
│       ├── domain/
│       └── presentation/
│
└── component/                # Reusable UI components
└── widgets/

