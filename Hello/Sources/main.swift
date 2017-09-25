import Foundation
import Commander
import Stencil

struct Article {
  let title: String
  let author: String
}

let context = [
  "articles": [
    Article(title: "Migrating from OCUnit to XCTest", author: "Kyle Fuller"),
    Article(title: "Memory Management with ARC", author: "Kyle Fuller"),
  ]
]

let main = command(
  Argument<String>("name", description: "Your name"),
  Option("count", 1, description: "The number of times to print.")
) { name, count in
  // for _ in 0..<count {
  //   print("Hello \(name)")
  // }
  let environment = Environment(loader: FileSystemLoader(paths: ["templates/"]))
  let rendered = try environment.renderTemplate(name: "article_list.html", context: context)

  print(rendered)
}

main.run()