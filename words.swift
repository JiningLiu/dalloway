import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Word Index")
print("================================")

do {

    let bookPath = "/Users/jining/Library/Mobile Documents/com~apple~CloudDocs/School/11/Lit/Dalloway Project/text.txt"
    let bookUrl = URL(fileURLWithPath: bookPath)
    var text = try String(contentsOf: bookUrl, encoding: .utf8)

    let commonWordsPath = "/Users/jining/Library/Mobile Documents/com~apple~CloudDocs/School/11/Lit/Dalloway Project/common.txt"
    let commonWordsUrl = URL(fileURLWithPath: commonWordsPath)
    let common = try String(contentsOf: commonWordsUrl, encoding: .utf8)

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
            words += phrase.components(separatedBy: " ").map { $0.lowercased() }
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

    print("================================")
    print("Longest Word: \(dict.last!.key)")
    print("Most Occurrences: \(dict.filter({ !common.contains($0.key) }).sorted(by: { $0.value >= $1.value }).prefix(20))")


} catch {
    print("Error: \(error.localizedDescription)")
}

print("================================")
print("Done ✅")
print("Execution Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1000000)ms")
