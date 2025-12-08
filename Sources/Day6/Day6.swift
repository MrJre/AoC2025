import Foundation
import PuzzleCore

struct Day6: Puzzle {

    let input: ([[Int]], [(Int, Int) -> Int])

    func part1() -> Int {
        let lines = input.0

        var result = 0
        for i in 0..<input.1.count {
            let op = input.1[i]
            var res = op(1, 1) == 2 ? 0 : 1
            for j in 0..<lines.count {
                let num = lines[j][i]
                res = op(res, num)
            }
            result += res
        }

        return result
    }

    func part2() -> Int {
        var result = 0
        for i in 0..<input.1.count {
            let op = input.1.reversed()[i]
            let res = op(1, 1) == 2 ? 0 : 1
            result += input.0[i].reduce(res, op)
        }

        return result
    }
}
