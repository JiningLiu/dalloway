import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Index by Word Length")
print("================================")

do {
    let path = FileManager.default.currentDirectoryPath
    let bookPath = path + "/text.txt"
    let bookUrl = URL(fileURLWithPath: bookPath)
    var text = try String(contentsOf: bookUrl, encoding: .utf8)

    let commonWordsPath = path + "/common.txt"
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

    let array = text.components(separatedBy: .newlines).filter { !$0.isEmpty }

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
            // .replacingOccurrences(of: "-", with: "")
            .count
            <=
            $1.key
            // .replacingOccurrences(of: "-", with: "")
            .count
    }

    print("Done ✅")
    print("Processing Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")

    while true {
        print("================================")
        print("Input index of word length (0: shortest, 100: longer, -1: longest, -2: second longest, non-integer: exit)")

        if var string = readLine() {
            string = string.lowercased()
            if var index = Int(string) {
                if index < 0 {
                    index = dict.count + index
                }
                let item = dict[index]
                print("Word:", item.key)
                print("Occurrences:", item.value)
            } else {
                exit(9)
            }
        }
    }
} catch {
    print("Error: \(error.localizedDescription)")
}

print("================================")
print("Done ✅")
print("Execution Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")
