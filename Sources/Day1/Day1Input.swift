import Foundation

struct InputParser {
    let input: String

    func parse() -> [Int] {
        input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map {
                ($0.prefix(1) == "L" ? -1 : 1) * Int(String($0[$0.index(after: $0.startIndex)...]))!
            }
    }
}
