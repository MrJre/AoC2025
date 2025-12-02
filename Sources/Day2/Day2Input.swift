import Foundation

struct InputParser {
    let input: String

    func parse() -> [String] {
        let result = input.components(separatedBy: "\n")
        
        return result
    }
}