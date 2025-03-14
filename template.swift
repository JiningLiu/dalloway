import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Program Template")
print("================================")

do {
    let file = FileManager.default.currentDirectoryPath + "/Users/jining/Library/Mobile Documents/com~apple~CloudDocs/School/11/Lit/Dalloway Project/text.txt"
    let path = URL(fileURLWithPath: file)
    var text = try String(contentsOf: path, encoding: .utf8)

//    text = text.replacingOccurrences(of: "?", with: "")
//    text = text.replacingOccurrences(of: ".", with: "")
//    text = text.replacingOccurrences(of: ",", with: "")
//    text = text.replacingOccurrences(of: "!", with: "")
//    text = text.replacingOccurrences(of: "—", with: " ")
//    text = text.replacingOccurrences(of: "“", with: "")
//    text = text.replacingOccurrences(of: "”", with: "")
//    text = text.replacingOccurrences(of: "(", with: "")
//    text = text.replacingOccurrences(of: ")", with: "")
//    text = text.replacingOccurrences(of: ";", with: "")

} catch {
    print("Error: \(error.localizedDescription)")
}

print("================================")
print("Processing Complete ✅")
print("Execution Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")
