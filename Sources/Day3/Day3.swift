import Foundation
import PuzzleCore

struct Day3: Puzzle {

    let input: [[Int]]

    func part1() -> Int {
        input.reduce(0) { $0 + findLargestJoltage(bank: $1, joltSize: 2) }
    }

    func part2() -> Int {
        input.reduce(0) { $0 + findLargestJoltage(bank: $1, joltSize: 12) }
    }

    func findLargestJoltage(bank: [Int], joltSize: Int) -> Int {
        var jolts: [(offset: Int, element: Int)] = Array(repeating: (-1,0), count: joltSize)

        for i in 0..<joltSize {
            let offset = i == 0 ? 0 : jolts[i - 1].offset + 1
            for j in offset..<bank.count - (joltSize - (i + 1)) {
                if jolts[i].element < bank[j] { jolts[i] = (j, bank[j]) }
            }
        }

        var result = 0
        for i in 0..<joltSize {
            result += Int(pow(10.0, Double(i))) * jolts[jolts.count - (1 + i)].element
        }

        return result
    }
}
