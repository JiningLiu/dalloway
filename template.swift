import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Program Template")
print("================================")

do {

    let file = FileManager.default.currentDirectoryPath + "/text.txt"
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

    print(text)

} catch {
    print("Error: \(error.localizedDescription)")
}

print("================================")
print("Done ✅")
print("Execution Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1000000)ms")
