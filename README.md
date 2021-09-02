# GitHubSearch
GitHub iOS client which is written in Swift using Clean-ish architecture with minimum third-party dependencies. The app allows for searching for repositories using GitHub API. The next release will be available to save info about repositories in local storage, so a user can see them offline.

## Features
- Each part of screen modules separated by its responsibilities into Assembly, Presenter, Interactor, View and ViewController.
- Screen layout was done fully programmatically with Auto Layout and `UICollectionViewCompositionalLayout`.
- All dependencies built in Dependency Container and injected as needed.
- Networking layer uses [Moya](https://github.com/Moya/Moya)
- Navigation to screens uses custom routing mechanics.

## Screenshots
![GitHubSearchPreview](https://user-images.githubusercontent.com/6949755/131858556-b02c0a54-c824-4e43-ad62-6ec2346aba90.png)

## License
MIT License. See [LICENSE](https://github.com/Karambirov/GitHubSearch/blob/develop/LICENSE).
