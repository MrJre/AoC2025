import Foundation

struct InputParser {
    let input: String

    func parse() -> [ProductIDRange] {
        let result = input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .flatMap { $0.components(separatedBy: ",") }
            .map {
                let rangeIds = $0.components(separatedBy: "-")
                return ProductIDRange(first: rangeIds[0], last: rangeIds[1])
            }

        return result
    }
}

struct ProductIDRange {
    let first: String
    let last: String

    var range: CountableClosedRange<Int>
    var array: [String]

    init(first: String, last: String) {
        self.first = first
        self.last = last

        self.range = Int(first)!...Int(last)!
        self.array = range.map { String($0) }
    }
}
