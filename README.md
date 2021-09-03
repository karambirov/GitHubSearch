# GitHubSearch
GitHub iOS client which is written in Swift using Clean-ish architecture with minimum third-party dependencies. The app allows for searching for repositories using GitHub API. 

🔜 In the **next release** will be possible to save info about repositories in local storage, so a user can see them offline.

## Features
- Each part of the screen modules was separated by its responsibilities into Assembly, Presenter, Router, Interactor, View, and ViewController.
- Screen layout was done fully programmatically with Auto Layout and `UICollectionViewCompositionalLayout`.
- All dependencies built in Dependency Container and injected as needed.
- The networking layer uses [Moya](https://github.com/Moya/Moya).
- Navigation to screens uses custom routing mechanics.

## Screenshots
![GitHubSearchPreview](https://user-images.githubusercontent.com/6949755/131862035-5e08d095-d70a-456b-9992-c8c6afa4c461.png)

## License
MIT License. See [LICENSE](https://github.com/Karambirov/GitHubSearch/blob/develop/LICENSE).
