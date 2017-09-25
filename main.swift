import PerfectLib
import PerfectHTTP
import PerfectHTTPServer

// An example request handler.
// This 'handler' function can be referenced directly in the configuration below.
func handler(data: [String:Any]) throws -> RequestHandler {
  return {
    request, response in
    // Respond with a simple message.
    response.setHeader(.contentType, value: "text/html")
    response.appendBody(string: "<html><title>Hello, world!</title><body>Hello, world!</body></html>")
    // Ensure that response.completed() is called when your processing is done.
    response.completed()
  }
}

// Configuration data for an example server.
// This example configuration shows how to launch a server
// using a configuration dictionary.


let confData = [
  "servers": [    
    [
      "name":"localhost",
      "port":8181,
      "routes":[
        ["method":"get", "uri":"/", "handler":handler],
        ["method":"get", "uri":"/**", "handler":PerfectHTTPServer.HTTPHandler.staticFiles,
        "documentRoot":"./webroot",
        "allowResponseFilters":true]
      ],
      "filters":[
        [
          "type":"response",
          "priority":"high",
          "name":PerfectHTTPServer.HTTPFilter.contentCompression,
        ]
      ]
    ]
  ]
]

do {
  // Launch the servers based on the configuration data.
  try HTTPServer.launch(configurationData: confData)
} catch {
  fatalError("\(error)") // fatal error launching one of the servers
}