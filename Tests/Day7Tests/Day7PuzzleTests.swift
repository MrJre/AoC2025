import Foundation
import Testing
import PuzzleToolbox
@testable import Day7

struct Day7PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 7)
        let input = InputParser(input: file).parse()

        let result = Day7(input: input).part1()
        #expect(result == 1646)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 7)
        let input = InputParser(input: file).parse()

        let result = Day7(input: input).part2()
        #expect(result == -1)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
