import Foundation
import PuzzleCore

struct Day5: Puzzle {

    let input: ([ClosedRange<Int>], [Int])

    func part1() -> Int {
        input.1.reduce(0) {
            for av in input.0 {
                if av ~= $1 {
                    return $0 + 1
                }
            }
            return $0
        }
    }

    func part2() -> Int {
        let ranges = input.0.sorted { $0.lowerBound < $1.lowerBound }
        var result: [ClosedRange<Int>] = []
        var acc: ClosedRange<Int> = 0...0

        for range in ranges {
            if acc == 0...0 {
                acc = range
            } else if acc.upperBound >= range.upperBound { // contains
                continue
            } else if acc.upperBound >= range.lowerBound { // overlaps
                acc = acc.lowerBound...range.upperBound
            } else if acc.upperBound < range.lowerBound { // disjunct
                result.append(acc)
                acc = range
            }
        }

        result.append(acc)

        return result.reduce(0) { $0 + $1.count }
    }
}
