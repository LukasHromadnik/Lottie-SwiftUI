# Lottie-SwiftUI

SwiftUI wrapper of [Lottie-iOS](https://github.com/airbnb/lottie-ios). Very simple implementation that can be further expanded.

Currently only supports `loopMode`, other properties are not implemented yet. Feel free to create a pull request!

## Installation

### Swift Package Manager

```swift
import PackageDescription

let package = Package(
    name: "YourTestProject",
    platforms: [
        .iOS(.v13),
    ],
    dependencies: [
        .package(name: "LottieSwiftUI", url: "https://github.com/LukasHromadnik/Lottie-SwiftUI.git", .upToNextMajor(from: Version(1, 0, 0)))
    ],
    targets: [
        .target(name: "YourTestProject", dependencies: ["LottieSwiftUI"])
    ]
)
```

## Usage

```swift
import LottieSwiftUI

@State var playLottie = false

LottieView(name: "animation-name", play: $playLottie)
    .lottieLoopMode(.loop)
```
