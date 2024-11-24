
## MockupInter App using Clean Architecture and MVVM
The purpose of this project is to show the basic aspects of Clean Architecture and MVVM design pattern, protocol-oriented-programming, Concurrence, SwiftUI.

## Architecture
The architecture is structured into three main layers:

1. Data Layer: Responsible for data retrieval and manipulation: Gateway Implementations + API (Network) + Database
2. Domain Layer: Contains business logic and use cases: Entities + Use Cases + Gateway Protocols
3. UI/Presentation Layer: Manages user interface and user interactions: ViewModels + View

## Project Structure

```
.
├── MockupInterview
│   ├── Application
│   │   └── MockupInterviewApp.swift
│   ├── Data
│   │   ├── APIServiceBase
│   │   │   ├── Common
│   │   │   │   ├── APIServiceBase.swift
│   │   │   │   ├── BaseEndpoint.swift
│   │   │   │   └── APIErrorBase.swift
│   │   │   ├── API
│   │   │   │   ├── APIService
│   │   │   │   └── APIUrls
│   │   │   └── Endpoint
│   │   │       ├── Endpoint.swift
│   │   │       ├── UserEndPoint.swift
│   │   │       └── UserDetailEndpoint.swift
│   │   ├── Gateway 
│   │   │   ├── UserGateway.swift
│   │   │   └── UserDetailGateway.swift
│   │── Domain
│   │   ├── UseCase
│   │   │   │── UserUseCase.swift
│   │   │   └── UserUseCase.swift
│   │   ├── Entities
│   │   │   ├── Common
│   │   │   │   ├── EmptyModel.swift
│   │   │   │   └── APIError.swift
│   │   │   ├── User.swift
│   │   │   └── UserDetail.swift
│   ├── Presentation
│   │   ├── Common
│   │   │   ├── RefreshableListView.swift
│   │   │   ├── SFSafiriView.swift
│   │   │   ├── LoadingView.swift
│   │   │   ├── BackButton.swift
│   │   │   └── CardView.swift
│   │   ├── Splash
│   │   │   └── SplashView.swift
│   │   ├── UserDetail
│   │   │   ├── ChildView
│   │   │   │    ├── LocationView.swift
│   │   │   │    ├── FollowView.swift
│   │   │   │    └── Blog.swift
│   │   │   └── UserDetailView.swift
│   │   │    └── UserDetailViewModel.swift
│   │   ├── UserDetail
│   │   │    ├── ChildView
│   │   │    │    └── LandingPageView.swift
│   │   │    ├── UserView.swift
│   │   │    └── UserViewModel.swift
│   ├── Resources
│   │   ├── Assets.xcassets
│   │   ├── File+
│   │   │   ├── Util.swift
│   │   │   └── Constants.swift
│   │   ├── Extension
│   │   │   ├── PreferenceKey+.swift
│   │   │   ├── CGFloat++.swift
│   │   │   ├── String+.swift
│   │   │   └── ViewDidLoadModifier.swift
│   │   ├── Helper
│   │   │   ├── CoordinatorStack
│   │   │   │   ├── Coordinatable.swift
│   │   │   │   ├── Coordinator.swift
│   │   │   │   ├── CoordinatorPages.swift
│   │   │   │   └── CoordinatorStack.swift
│   │   │   ├── BaseViewModel
│   │   │   │   └── ViewModel.swift
│   │   │   └── ThreadSafe
│   │   │       └── ThreadSafe.swift
│   │   └── Localizable.xcstrings
│   ├── Generated
│   │   ├── Assets.swift
│   │   └── Strings.swift
│   └── Preview Content
│       ├── UserDetailMock.json
│       ├── UserlMock.json
│       └── Preview Assets.xcassets
├── MockupInterviewTests
│   ├── MockupInterviewTests
│   ├── Data
│   │   └── GatewayMock
│   │      ├── UserGatewayMock.swift
│   │      └── UserDetailGatewayMockup.swift
│   ├── Data
│   │   └── Entities
│   │      ├── UserViewTests.swift
│   │      └── UserDetailViewTests.swift
│   └── Presentation
│       ├── UserViewTests.swift
│       └── UserDetailViewTests.swift
└── GithubUsersUITests
    └──  MockupInterviewUITests.swift
```

## Developer Tools

- [Xcode 15.4](https://apps.apple.com/vn/app/xcode/id497799835?mt=12) or newest
- [Mint 0.17.5](https://github.com/yonaskolb/Mint) or newest

## Get Started

1. Install [Mint](https://github.com/yonaskolb/Mint) via Homebrew
   ```sh
   brew install mint
   ```
2. Open Terminal and cd to the project folder and run each of the following commands:
   ```sh
   mint run SwiftGen
   mint run swiftformat "MockupInterview"
   mint run SwiftLint
   ```
3. Open `MockupInterview.xcodeproj`, choose target and build.

## Schemes

- MockupInterview
- MockupInterviewTests: Unit Test

## Library
- SDWebImageSwifUI: to download image asynchronous and cache image into local device 
(https://github.com/SDWebImage/SDWebImageSwiftUI.git)
