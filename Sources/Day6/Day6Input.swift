import Foundation

struct InputParser {
    let input: String

    func parsePart1() -> ([[Int]], [(Int, Int) -> Int]) {
        var lines = parseInputToLines()
        let operators: [(Int, Int) -> Int] = parseOperators(lines.removeLast())

        let result = lines.map {
            $0.components(separatedBy: " ").compactMap(Int.init)
        }

        return (result, operators)
    }

    func parsePart2() -> ([[Int]], [(Int, Int) -> Int]) {
        var lines = parseInputToLines()
        let operators: [(Int, Int) -> Int] = parseOperators(lines.removeLast())

        var columns: [[Int]] = []
        var currentColumn: [Int] = []

        for char in (0..<lines[0].count).reversed() {
            var col = ""
            for line in 0..<lines.count {
                let l = lines[line]
                let char = l[l.index(l.startIndex, offsetBy: char)]
                col.append(char)
            }
            if col == String(repeating: " ", count: lines.count) {
                columns.append(currentColumn)
                currentColumn = []
            } else {
                let str = String(col.trimmingCharacters(in: .whitespaces))
                let num = Int(str)!
                currentColumn.append(num)
            }
        }

        columns.append(currentColumn)

        return (columns, operators)
    }

    private func parseInputToLines() -> [String] {
        input.components(separatedBy: "\n").filter { !$0.isEmpty }
    }

    private func parseOperators(_ ops: String) -> [(Int, Int) -> Int] {
        ops
            .components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .compactMap {
                switch $0 {
                case "+": return { $0 + $1 }
                case "*": return { $0 * $1 }
                default: return nil
                }
            }
    }
}
