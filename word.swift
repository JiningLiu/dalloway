import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Word Search")
print("================================")

do {
    let path = FileManager.default.currentDirectoryPath
    let bookPath = path + "/text.txt"
    let bookUrl = URL(fileURLWithPath: bookPath)
    var text = try String(contentsOf: bookUrl, encoding: .utf8)

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

    let array = text.components(separatedBy: .newlines).filter { !$0.isEmpty }

    var words: [String] = []

    for phrase in array {
        if !phrase.isEmpty {
            words += phrase.components(separatedBy: " ").map { $0.lowercased() }
        }
    }

    let dict = words.reduce(into: [String: Int]()) { counts, word in
        counts[word, default: 0] += 1
    }

    print("Processing Complete ✅")
    print("Processing Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")

    while true {
        print("================================")
        print("Input the word to search (0: exit)")

        if var string = readLine() {
            string = string.lowercased()

            if let int = Int(string), int == 0 {
                exit(9)
            }

            let items = dict.filter { $0.key.contains(string) }

            var total = 0

            for (index, item) in Array(items.enumerated()) {
                print("----------------")
                print("Word \(index)\(item.key == string ? " (Exact Match)" : ""):", item.key.replacingOccurrences(of: string, with: "\u{001B}[102m\(string)\u{001B}[0m"))
                print("Occurrences:", item.value)
                total += item.value
            }

            print("----------------")
            print("Total Occurrences:", total)
        }
    }
} catch {
    print("Error: \(error.localizedDescription)")
}
