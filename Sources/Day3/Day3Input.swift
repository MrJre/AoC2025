import Foundation

struct InputParser {
    let input: String

    func parse() -> [[Int]] {

        input
            .components(separatedBy: "\n")
            .filter { !$0.isEmpty }
            .map { $0.map { Int(String($0))! } }
    }
}
