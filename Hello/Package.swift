// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
      .Package(url: "https://github.com/IBM-Swift/BlueSocket.git", majorVersion: 0, minor: 12),
      .Package(url: "https://github.com/Carthage/ReactiveTask.git", majorVersion: 0)
    ]
)
