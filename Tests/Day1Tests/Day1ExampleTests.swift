import Foundation
import Testing
@testable import Day1

struct Day1ExampleTests {

    @Test func exampleOne() {
        let input = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day1(input: parseResult).part1()

        #expect(result == 3)
    }

    @Test func exampleOnePart2() {
        let input = """
        L68
        L30
        R48
        L5
        R60
        L55
        L1
        L99
        R14
        L82
        """

        let parseResult = InputParser(input: input).parse()
        let result = Day1(input: parseResult).part2()

        #expect(result == 6)
    }
}
