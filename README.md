# GitHubSearch
GitHub iOS client which is written in Swift using Clean-ish architecture with minimum third-party dependencies. The app allows for searching for repositories using GitHub API. The next release will be available to save info about repositories in local storage, so a user can see them offline.

## Features
- Each part of the screen modules was separated by its responsibilities into Assembly, Presenter, Interactor, View, and ViewController.
- Screen layout was done fully programmatically with Auto Layout and `UICollectionViewCompositionalLayout`.
- All dependencies built in Dependency Container and injected as needed.
- The networking layer uses [Moya](https://github.com/Moya/Moya).
- Navigation to screens uses custom routing mechanics.

## Screenshots
![GitHubSearchPreview](https://user-images.githubusercontent.com/6949755/131861836-9d883527-a259-4d8e-951f-9b23b1be01a7.png)

## License
MIT License. See [LICENSE](https://github.com/Karambirov/GitHubSearch/blob/develop/LICENSE).
