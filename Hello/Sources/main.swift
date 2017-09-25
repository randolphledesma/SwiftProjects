import Foundation
import Commander
import Stencil

let main = Group {
  $0.command("sql") { (template:String) in
    var templateFile = ""
    switch template {
      case "select":
        templateFile = "select.sql"
      default:
        break
    }
    
    let environment = Environment(loader: FileSystemLoader(paths: ["templates/"]))
    let rendered = try environment.renderTemplate(name: templateFile, context: [:])

    print(rendered)
  }
}

main.run()