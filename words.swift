import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Word Index")
print("================================")

do {

    let file = "/Users/jining/Library/Mobile Documents/com~apple~CloudDocs/School/11/Lit/Dalloway Project/text.txt"
    let path = URL(fileURLWithPath: file)
    var text = try String(contentsOf: path, encoding: .utf8)

    text = text.replacingOccurrences(of: "?", with: "")
    text = text.replacingOccurrences(of: ".", with: "")
    text = text.replacingOccurrences(of: ",", with: "")
    text = text.replacingOccurrences(of: "!", with: "")
    text = text.replacingOccurrences(of: "—", with: " ")
    text = text.replacingOccurrences(of: "“", with: "")
    text = text.replacingOccurrences(of: "”", with: "")
    text = text.replacingOccurrences(of: "(", with: "")
    text = text.replacingOccurrences(of: ")", with: "")
    text = text.replacingOccurrences(of: ";", with: "")

    let array = text.components(separatedBy: .newlines)

    var words: [String] = []

    for phrase in array {
        if !phrase.isEmpty {
            words += phrase.components(separatedBy: " ")
        }
    }

    let dict = words.reduce(into: [String: Int]()) { counts, word in
        counts[word, default: 0] += 1
    }.sorted {
        $0.key
            //.replacingOccurrences(of: "-", with: "")
            .count
        <=
        $1.key
            //.replacingOccurrences(of: "-", with: "")
            .count
    }

    print(dict)

} catch {
    print("Error: \(error.localizedDescription)")
}

print("================================")
print("Done ✅")
print("Execution Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1000000)ms")
