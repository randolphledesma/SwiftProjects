// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Hello",
    dependencies: [
      .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0),
      .Package(url: "https://github.com/kylef/Stencil.git", majorVersion: 0)            
    ]
)
