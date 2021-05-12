# GitHubSearch
GitHub iOS client written in Swift using MVVM architecture with Router (without Rx and Interface Builder).

## Features
- [x] Searching for repositories using GitHub API.
- [x] Saving info about favorite repositories on disk, so a user can see them offline.

## Technologies (outdated)
- [x] Separate layer for routing between screens.
- [x] Networking REST API v3 ([Moya](https://github.com/Moya/Moya)).
- [x] Programmatically UI ([SnapKit](https://github.com/SnapKit/SnapKit)).
- [x] Persistence ([Realm](https://github.com/realm/realm-cocoa))
- [x] [SwiftLint](https://github.com/realm/SwiftLint) - A tool to enforce Swift style and conventions.
- [x] [R.swift](https://github.com/mac-cain13/R.swift) - Get strong typed, autocompleted resources like images, fonts and segues in Swift projects.

## Screenshots
<p align="center">
  <img src="https://user-images.githubusercontent.com/6949755/52898872-71a60e00-31f4-11e9-853a-d7993aae4eed.png" width="70%">
</p>

## Building and Running
Make sure you have Xcode installed from the App Store. Then run the following commands in Terminal:

```sh
clone https://github.com/Karambirov/GitHubSearch.git
cd GitHubSearch
pod install
open GitHubSearch.xcworkspace
```

## License
MIT License. See [LICENSE](https://github.com/Karambirov/GitHubSearch/blob/develop/LICENSE).
