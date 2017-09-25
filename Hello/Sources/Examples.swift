import Foundation
import Socket

// Create the socket...

let signature = try Socket.Signature(protocolFamily: .inet, socketType: .stream, proto: .tcp, hostname: "httpbin.org", port: 80)
let socket = try Socket.create(connectedUsing: signature!)

print("Is: \(socket.isConnected)")

print("connecting...")

labelpoint: do {
  //try socket.connect(to: "httpbin.org", port: 80)
  try socket.write(from: "GET / HTTP/1.1\r\n")
  try socket.write(from: "Host: httpbin.org\r\n\r\n")
  print("connected")

  var readData = Data(capacity: 1024)
  
  let bytesRead = try socket.read(into: &readData)
  print("\(bytesRead)")
  if bytesRead > 0 {
    guard let response = String(data: readData, encoding: .utf8) else {
        print("Error decoding response...")
        readData.count = 0
        break labelpoint
    }  
    print("\(response)")
  }
} catch let error {
  print("Error: \(error.localizedDescription)")
  guard let socketError = error as? Socket.Error else {
      print("Unexpected error...")
      break labelpoint
  }
}
print("Socket: \(socket.remoteHostname):\(socket.remotePort) closed...")
socket.close()
