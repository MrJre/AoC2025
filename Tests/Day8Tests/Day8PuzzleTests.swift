import Foundation
import Testing
@testable import Day8

struct Day8PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 8)
        let input = InputParser(input: file).parse()

        let result = Day8(input: input).part1()
        #expect(result == 62186)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 8)
        let input = InputParser(input: file).parse()

        let result = Day8(input: input).part2()
        #expect(result == 8420405530)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
