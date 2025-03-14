import Foundation
import NaturalLanguage

print("================================")
print("Dalloway Project")
print("Filtered Sentiment Analysis")
print("================================")

do {

    print("Character name (e.g. septimus)")

    let path = FileManager.default.currentDirectoryPath
    let bookPath = path + "/" + readLine()!.lowercased()

    let start = DispatchTime.now().uptimeNanoseconds

    let bookUrl = URL(fileURLWithPath: bookPath)
    var text = try String(contentsOf: bookUrl, encoding: .utf8)

    let pattern = #"\[Pg \d+\]"# // Use raw string syntax to avoid escape issues
    let regex = try NSRegularExpression(pattern: pattern, options: [])
    let range = NSRange(location: 0, length: text.utf16.count)

    text = regex.stringByReplacingMatches(in: text, options: [], range: range, withTemplate: "")

    var lines = text.components(separatedBy: .newlines)
    lines = lines.filter { !$0.isEmpty }

    let array = lines.joined(separator: "").components(separatedBy: "_____")

    var sentiments: [Double] = []

    for (index, item) in Array(array.enumerated()) {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = item
        let (sentiment, _) = tagger.tag(at: item.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let score = Double(sentiment?.rawValue ?? "0") ?? 0
        sentiments.append(score)

        print("----------------")
        print("Item", index, "Sentiment:", score)
    }

    print("----------------")
    print(sentiments)

    print("================================")
    print("Processing Complete ✅")
    print("Processing Time: \((DispatchTime.now().uptimeNanoseconds - start) / 1_000_000)ms")
} catch {
    print("Error: \(error.localizedDescription)")
}
