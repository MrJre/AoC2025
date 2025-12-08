import Foundation

struct InputParser {
    let input: String

    func parse() -> ([ClosedRange<Int>], [Int]) {
        let result = input.components(separatedBy: "\n\n").filter { !$0.isEmpty }

        let ranges = result[0]
            .components(separatedBy: "\n")
            .map {
                let range = $0.components(separatedBy: "-").compactMap(Int.init)
                return range[0]...range[1]
            }

        let availables = result[1].components(separatedBy: "\n").compactMap(Int.init)

        return (ranges, availables)
    }
}
