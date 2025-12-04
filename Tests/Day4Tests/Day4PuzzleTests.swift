import Foundation
import Testing
@testable import Day4

struct Day4PuzzleTests {

    @Test func part1() throws {
        let file = file(forDay: 4)
        let input = InputParser(input: file).parse()

        let result = Day4(input: input).part1()
        #expect(result == 1393)
    }
    
    @Test func part2() throws {
        let file = file(forDay: 4)
        let input = InputParser(input: file).parse()

        let result = Day4(input: input).part2()
        #expect(result == -1)
    }

    private func file(forDay day: Int) -> String {
        let url = Bundle.module.url(forResource: "Day\(day)", withExtension: ".txt")
        return try! String(contentsOf: url!, encoding: .utf8)
    }
}
