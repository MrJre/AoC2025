import Foundation
import PuzzleCore
import Algorithms

struct Day2: Puzzle {

    let input: [ProductIDRange]

    func part1() -> Int {
        var result = 0

        for range in input {
            for id in range.array {
                if !validatePart1(id: id) {
                    result += Int(id)!
                }
            }
        }

        return result
    }


    func validatePart1(id: String) -> Bool {
        guard id.count % 2 == 0 else { return true }

        let a = id[id.startIndex..<id.index(id.startIndex, offsetBy: id.count / 2)]
        let b = id[id.index(id.startIndex, offsetBy: id.count / 2)..<id.endIndex]

        return a != b
    }



    func part2() -> Int {
        var result = 0

        for range in input {
            for id in range.array {
                if !validatePart2(id: id, chunkSize: id.count / 2) {
                    result += Int(id)!
                }
            }
        }

        return result
    }

    func validatePart2(id: String, chunkSize: Int) -> Bool {
        if chunkSize == 0 { return true }
        let chunks = id.chunks(ofCount: chunkSize).map(String.init)
        let invalid = chunks.reduce(true, { $0 && ($1 == chunks.first) })

        if invalid { return false }

        return validatePart2(id: id, chunkSize: chunkSize - 1)
    }
}
