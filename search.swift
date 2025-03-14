import Foundation

let start = DispatchTime.now().uptimeNanoseconds

print("================================")
print("Dalloway Project")
print("Search")
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

    let phrases = array.filter { !$0.isEmpty }.map { $0.lowercased() }

    print("Processing Complete ✅")
    print("Processing Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")

    while true {
        print("================================")
        print("Input the term to search (0: exit)")

        if var string = readLine() {
            string = string.lowercased()

            if let int = Int(string), int == 0 {
                exit(9)
            }

            let items = phrases.filter { $0.contains(string) }

            for (index, item) in Array(items.enumerated()) {
                print("----------------")
                print("Item \(index)\(item == string ? " (Exact Match)" : ""):", item.replacingOccurrences(of: string, with: "\u{001B}[102m\(string)\u{001B}[0m"))
            }
        }
    }
} catch {
    print("Error: \(error.localizedDescription)")
}
