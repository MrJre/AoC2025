import Foundation
import PuzzleCore

struct Day1: Puzzle {

    let input: [Int]

    func part1() -> Int {
        var result = 50
        var count = 0

        input.forEach {
            result += $0
            if result % 100 == 0 { count += 1 }
        }

        return count
    }

    func part2() -> Int {
        var result = 50
        var count = 0

        input.forEach {
            if $0 < 0 && result == 0 { result = 100 }
            result += $0

            while !(0...100 ~= result) {
                if result < 0 {
                    result += 100
                    count += 1
                }
                else if result > 100 {
                    result -= 100
                    count += 1
                }
            }

            if result % 100 == 0 {
                count += 1
                result = 0
            }
        }

        return count
    }
}
