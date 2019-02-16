# GitHubSearch
GitHub iOS client written in Swift and MVVM architecture without Rx and Interface Builder.

![iphone](https://user-images.githubusercontent.com/6949755/52896678-1ff18980-31dc-11e9-8b67-042e84c9a37f.png)

## App Features
- [x] Searching for repositories using GitHub API.
- [ ] Saving info about favorite repositories on disk, so a user can see them offline.

## Technologies
- [x] Networking REST API v3 ([Moya](https://github.com/Moya/Moya)).
- [x] Programmatically UI ([SnapKit](https://github.com/SnapKit/SnapKit)).
- [x] Persistance ([Realm](https://github.com/realm/realm-cocoa))
- [x] [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [x] [R.swift](https://github.com/mac-cain13/R.swift) - Get strong typed, autocompleted resources like images, fonts and segues in Swift projects.

## Building and Running
You'll need a few things before we get started. Make sure you have Xcode installed from the App Store. Then run the following commands:

```sh
clone https://github.com/Karambirov/GitHubSearch.git
cd GitHubSearch
pod install
open GitHubSearch.xcworkspace
```

## License
MIT License. See [LICENSE](https://github.com/Karambirov/GitHubSearch/blob/develop/LICENSE).
